//$Id: MSP430TimerM.nc,v 1.1.2.2 2005-02-10 01:07:39 cssharp Exp $

/* "Copyright (c) 2000-2003 The Regents of the University of California.  
 * All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement
 * is hereby granted, provided that the above copyright notice, the following
 * two paragraphs and the author appear in all copies of this software.
 * 
 * IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
 * OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY
 * OF CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS."
 */

//@author Cory Sharp <cssharp@eecs.berkeley.edu>

includes msp430regtypes;

generic module MSP430TimerM(
  uint16_t TxIV_addr,
  uint16_t TxR_addr,
  uint16_t TxCTL_addr,
  uint16_t TxIFG,
  uint16_t TxCLR,
  uint16_t TxIE,
  uint16_t TxSSEL0,
  uint16_t TxSSEL1 )
{
  provides interface MSP430Timer as Timer;
  provides interface MSP430TimerEvent as Event[uint8_t n];
  uses interface MSP430TimerEvent as Overflow;
  uses interface MSP430TimerEvent as VectorTimerX0;
  uses interface MSP430TimerEvent as VectorTimerX1;
}
implementation
{
  #define TxIV (*(volatile TYPE_TAIV*)TxIV_addr)
  #define TxR (*(volatile TYPE_TAR*)TxR_addr)
  #define TxCTL (*(volatile TYPE_TACTL*)TxCTL_addr)

  async command uint16_t Timer.get()
  {
    return TxR;
  }

  async command bool Timer.isOverflowPending()
  {
    return TxCTL & TxIFG;
  }

  async command void Timer.clearOverflow()
  {
    CLR_FLAG(TxCTL,TxIFG);
  }

  async command void Timer.setMode( int mode )
  {
    TxCTL = (TxCTL & ~(MC1|MC0)) | ((mode<<4) & (MC1|MC0));
  }

  async command int Timer.getMode()
  {
    return (TxCTL & (MC1|MC0)) >> 4;
  }

  async command void Timer.clear()
  {
    TxCTL |= TxCLR;
  }

  async command void Timer.enableEvents()
  {
    TxCTL |= TxIE;
  }

  async command void Timer.disableEvents()
  {
    TxCTL &= ~TxIE;
  }

  async command void Timer.setClockSource( uint16_t clockSource ) 
  { 
    TxCTL = (TxCTL & ~(TxSSEL0|TxSSEL1)) | ((clockSource << 8) & (TxSSEL0|TxSSEL1));
  }
  
  async command void Timer.setInputDivider( uint16_t inputDivider )
  {
    TxCTL = (TxCTL & ~(ID_1|ID_3)) | ((inputDivider << 8) & (ID_1|ID_3));
  }

  async event void VectorTimerX0.fired()
  {
    signal Event.fired[0]();
  }

  async event void VectorTimerX1.fired()
  {
    uint8_t n = TxIV;
    signal Event.fired[n]();
  }

  async event void Overflow.fired()
  {
    signal Timer.overflow();
  }

  default async event void Timer.overflow()
  {
  }

  default async event void Event.fired[uint8_t n]()
  {
  }
}

