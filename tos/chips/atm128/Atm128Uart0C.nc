/*
 * Copyright (c) 2006 Arch Rock Corporation
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the Arch Rock Corporation nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE
 * ARCH ROCK OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE
 */

/**
 * @author Alec Woo <awoo@archrock.com>
 * @author Jonathan Hui <jhui@archrock.com>
 * @version $Revision: 1.1.2.1 $ $Date: 2006-10-10 19:18:42 $
 */

configuration Atm128Uart0C {
  
  provides interface StdControl;
  provides interface UartByte;
  provides interface UartStream;
  uses interface Counter<TMicro, uint16_t>;
  
}

implementation{
  
  components new Atm128UartP() as UartP;
  StdControl = UartP;
  UartByte = UartP;
  UartStream = UartP;
  UartP.Counter = Counter;
  
  components HplAtm128UartP as HplUartP;
  UartP.HplUartTxControl -> HplUartP.Uart0TxControl;
  UartP.HplUartRxControl -> HplUartP.Uart0RxControl;
  UartP.HplUart -> HplUartP.HplUart0;
  
  components PlatformC;
  HplUartP.Atm128Calibrate -> PlatformC;
  
  components McuSleepC;
  HplUartP.McuPowerState -> McuSleepC;
  
  components MainC;
  MainC.SoftwareInit -> UartP;
  
}
