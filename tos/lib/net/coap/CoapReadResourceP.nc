/*
 * Copyright (c) 2011 University of Bremen, TZI
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the copyright holders nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

generic module CoapReadResourceP(typedef val_t, uint8_t uri_key) {
  provides interface ReadResource;
  uses interface Leds;
  uses interface Timer<TMilli> as Timer1;
  uses interface Read<val_t>;
} implementation {
  coap_tid_t id_t;

  command error_t ReadResource.get(coap_tid_t id) {
#ifdef PRINTFUART_ENABLED
    // 	dbg("Read", "ReadResource.get: %hu\n", uri_key);
#endif
    id_t = id;
    call Timer1.startOneShot(COAP_PREACK_TIMEOUT);
    call Read.read();

    return SUCCESS;
  }

  event void Timer1.fired() {
    call Leds.led2Toggle();

    signal ReadResource.getDoneDeferred(id_t);
  }

  event void Read.readDone(error_t result, val_t val) {
    uint8_t* buf;
    uint8_t asyn_message = 1;

    if (call Timer1.isRunning()){
      call Timer1.stop();
      asyn_message = 0;
    }

    buf = (uint8_t*)coap_malloc(sizeof(val_t));
    memcpy(buf, &val, sizeof(val_t));
#ifdef PRINTFUART_ENABLED
    // 	dbg("Read","value in buf (len %hu)\n", sizeof(val_t));
    // 	for (i=0; i<sizeof(val_t); i++)
    // 	    dbg("Read", "%x:%x\n", i, buf[i]);
#endif
    signal ReadResource.getDone(result, id_t, asyn_message, buf, sizeof(val_t));
  }

  }
