// $Id: ConfigStorageP.nc,v 1.1.2.5 2006-05-31 14:57:43 idgay Exp $

/*									tab:4
 * Copyright (c) 2002-2006 Intel Corporation
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached INTEL-LICENSE     
 * file. If you do not find these files, copies can be found by writing to
 * Intel Research Berkeley, 2150 Shattuck Avenue, Suite 1300, Berkeley, CA, 
 * 94704.  Attention:  Intel License Inquiry.
 */

/**
 * Private component of the AT45DB implementation of the config storage
 * abstraction.
 *
 * @author: David Gay <dgay@acm.org>
 */

#include "Storage.h"

module ConfigStorageP {
  provides {
    interface Mount[configstorage_t id];
    interface ConfigStorage[configstorage_t id];
    interface At45dbBlockConfig as BConfig[blockstorage_t id];
  }
  uses {
    interface At45db;
    interface BlockRead[configstorage_t id];
    interface BlockWrite[configstorage_t id];
  }
}
implementation 
{
  /* A config storage is built on top of a block storage volume, with
     the block storage volume divided into two and the first 4 bytes of
     each half holding a (>0) version number. The valid half with the
     highest version number is the current version.

     Transactional behaviour is achieved by copying the current half
     into the other, then increment its version number. Writes then
     proceed in that new half until a commit, which just uses the 
     underlying BlockStorage commit's operation.

     Note: all of this depends on the at45db's implementation of 
     BlockStorageP. It will not work over an arbitrary BlockStorageP
     implementation (additionally, it uses hooks in BlockStorageP to
     support the half-volume operation). Additionally, the code assumes
     that the config volumes all have lower ids than the block volumes.
  */

  enum {
    S_STOPPED,
    S_MOUNT,
    S_CLEAN,
    S_DIRTY,
    S_INVALID
  };

  enum {
    N = uniqueCount(UQ_CONFIG_STORAGE),
    NO_CLIENT = 0xff,
  };

  /* Per-client state */
  uint8_t state[N];

  /* Version numbers for lower and upper half */
  uint32_t lowVersion[N], highVersion[N];

  /* Bit n is true if client n is using upper block */
  uint8_t flipped[(N + 7) / 8]; 

  uint8_t client = NO_CLIENT;
  at45page_t nextPage;

  void setFlip(blockstorage_t id, bool flip);

  /* ------------------------------------------------------------------ */
  /* Mounting								*/
  /* ------------------------------------------------------------------ */

  command error_t Mount.mount[uint8_t id]() {
    /* Read version on both halves. Validate higher. Validate lower if
       higher invalid. Use lower if both invalid. */
    if (state[id] != S_STOPPED)
      return FAIL;

    state[id] = S_MOUNT;
    setFlip(id, FALSE);
    call BlockRead.read[id](0, &lowVersion[id], sizeof lowVersion[id]);

    return SUCCESS;
  }

  void mountReadDone(uint8_t id, error_t error) {
    if (error != SUCCESS)
      {
	state[id] = S_STOPPED;
	signal Mount.mountDone[id](FAIL);
      }
    else if (!call BConfig.flipped[id]())
      {
	/* Just read low-half version. Read high-half version */
	setFlip(id, TRUE);
	call BlockRead.read[id](0, &highVersion[id], sizeof highVersion[id]);
      }
    else
      {
	/* Verify the half with the largest version */
	setFlip(id, highVersion[id] > lowVersion[id]);
	call BlockRead.verify[id]();
      }
  }

  void mountVerifyDone(uint8_t id, error_t error) {
    if (error == SUCCESS) 
      state[id] = S_CLEAN;
    else
      {
	// try the other half?
	bool isflipped = call BConfig.flipped[id]();

	if ((highVersion[id] > lowVersion[id]) == isflipped)
	  {
	    /* Verification of the half with the highest version failed. Try
	       the other half. */
	    setFlip(id, !isflipped);
	    call BlockRead.verify[id]();
	    return;
	  }
	/* both halves bad, just declare success and use the current half :-) 
	   (we did need to verify to find the end-of-block) */
	state[id] = S_INVALID;
      }
    signal Mount.mountDone[id](SUCCESS);
  }

  /* ------------------------------------------------------------------ */
  /* Read								*/
  /* ------------------------------------------------------------------ */

  command error_t ConfigStorage.read[configstorage_t id](storage_addr_t addr, void* buf, storage_len_t len) {
    /* Read from current half using BlockRead */
    if (state[id] < S_CLEAN)
      return EOFF;

    return call BlockRead.read[id](addr + sizeof(uint32_t), buf, len);
  }

  void readReadDone(configstorage_t id, storage_addr_t addr, void* buf, storage_len_t len, error_t error) {
    signal ConfigStorage.readDone[id](addr - sizeof(uint32_t), buf, len, error);
  }

  /* ------------------------------------------------------------------ */
  /* Write								*/
  /* ------------------------------------------------------------------ */

  command error_t ConfigStorage.write[configstorage_t id](storage_addr_t addr, void* buf, storage_len_t len) {
    /* 1: If first write:
         copy to other half, increment version number, and flip.
       2: Write to current half using BlockWrite */

    if (state[id] < S_CLEAN)
      return EOFF;
    return call BlockWrite.write[id](addr + sizeof(uint32_t), buf, len);
  }

  void copyCopyPageDone(error_t error);
  void writeContinue(error_t error);

  command int BConfig.writeHook[configstorage_t id]() {
    if (state[id] != S_CLEAN) // no work if dirty or invalid
      return FALSE;

    /* Time to do the copy, version update dance */
    client = id;
    nextPage = signal BConfig.npages[id]();
    copyCopyPageDone(SUCCESS);

    return TRUE;
  }

  void copyCopyPageDone(error_t error) {
    if (error != SUCCESS)
      writeContinue(error);
    else if (nextPage == 0) // copy done
      {
	uint32_t *version;

	// Set version number
	if (call BConfig.flipped[client]())
	  {
	    lowVersion[client] = highVersion[client] + 1;
	    version = &lowVersion[client];
	  }
	else
	  {
	    highVersion[client] = lowVersion[client] + 1;
	    version = &highVersion[client];
	  }
	call At45db.write(signal BConfig.remap[client](0), 0,
			  version, sizeof *version);
      }
    else
      {
	// copy next page
	at45page_t from, to, npages = signal BConfig.npages[client]();

	to = from = signal BConfig.remap[client](--nextPage);
	if (call BConfig.flipped[client]())
	  to -= npages;
	else
	  to += npages;

	call At45db.copyPage(from, to);
      }
  }

  void copyWriteDone(error_t error) {
    if (error == SUCCESS)
      {
	setFlip(client, !call BConfig.flipped[client]());
	state[client] = S_DIRTY;
      }
    writeContinue(error);
  }

  void writeContinue(error_t error) {
    uint8_t id = client;

    client = NO_CLIENT;
    signal BConfig.writeContinue[id](error);
  }

  void writeWriteDone(configstorage_t id, storage_addr_t addr, void* buf, storage_len_t len, error_t error) {
    signal ConfigStorage.writeDone[id](addr - sizeof(uint32_t), buf, len, error);
  }

  /* ------------------------------------------------------------------ */
  /* Commit								*/
  /* ------------------------------------------------------------------ */

  command error_t ConfigStorage.commit[configstorage_t id]() {
    /* Call BlockWrite.commit */
    /* Could special-case attempt to commit clean block */
    if (state[id] < S_CLEAN)
      return EOFF;
    return call BlockWrite.commit[id]();
  }

  void commitDone(configstorage_t id, error_t error) {
    if (error == SUCCESS)
      state[id] = S_CLEAN;
    signal ConfigStorage.commitDone[id](error);
  }

  /* ------------------------------------------------------------------ */
  /* Get Size								*/
  /* ------------------------------------------------------------------ */

  command storage_len_t ConfigStorage.getSize[configstorage_t id]() {
    return call BlockRead.getSize[id]();
  }

  /* ------------------------------------------------------------------ */
  /* Valid								*/
  /* ------------------------------------------------------------------ */

  command bool ConfigStorage.valid[configstorage_t id]() {
    return state[id] != S_INVALID;
  }

  /* ------------------------------------------------------------------ */
  /* Interface with BlockStorageP					*/
  /* ------------------------------------------------------------------ */

  /* The config volumes use the low block volume numbers. So a volume is a
     config volume iff its its id is less than N */

  command int BConfig.isConfig[blockstorage_t id]() {
    return id < N;
  }

  void setFlip(blockstorage_t id, bool flip) {
    if (flip)
      flipped[id >> 3] |= 1 << (id & 7);
    else
      flipped[id >> 3] &= ~(1 << (id & 7));
  }

  inline command int BConfig.flipped[blockstorage_t id]() {
    return (flipped[id >> 3] & (1 << (id & 7))) != 0;
  }

  event void BlockRead.readDone[configstorage_t id](storage_addr_t addr, void* buf, storage_len_t len, error_t error) {
    if (id < N)
      if (state[id] == S_MOUNT)
	mountReadDone(id, error);
      else
	readReadDone(id, addr, buf, len, error);
  }

  event void BlockRead.verifyDone[configstorage_t id]( error_t error ) {
    if (id < N)
      mountVerifyDone(id, error);
  }

  event void BlockWrite.writeDone[configstorage_t id]( storage_addr_t addr, void* buf, storage_len_t len, error_t error ) {
    if (id < N)
      writeWriteDone(id, addr, buf, len, error);
  }

  event void BlockWrite.commitDone[configstorage_t id]( error_t error ) {
    if (id < N)
      commitDone(id, error);
  }

  event void At45db.writeDone(error_t error) {
    if (client != NO_CLIENT)
      copyWriteDone(error);
  }

  event void At45db.copyPageDone(error_t error) {
    if (client != NO_CLIENT)
      copyCopyPageDone(error);
  }

  event void BlockRead.computeCrcDone[configstorage_t id]( storage_addr_t addr, storage_len_t len, uint16_t crc, error_t error ) {}
  event void BlockWrite.eraseDone[configstorage_t id]( error_t error ) {}
  event void At45db.eraseDone(error_t error) {}
  event void At45db.syncDone(error_t error) {}
  event void At45db.flushDone(error_t error) {}
  event void At45db.readDone(error_t error) {}
  event void At45db.computeCrcDone(error_t error, uint16_t crc) {}

  default event void Mount.mountDone[configstorage_t id](error_t error) { }
  default event void ConfigStorage.readDone[configstorage_t id](storage_addr_t addr, void* buf, storage_len_t len, error_t error) {}
  default event void ConfigStorage.writeDone[configstorage_t id](storage_addr_t addr, void* buf, storage_len_t len, error_t error) {}
  default event void ConfigStorage.commitDone[configstorage_t id](error_t error) {}
}
