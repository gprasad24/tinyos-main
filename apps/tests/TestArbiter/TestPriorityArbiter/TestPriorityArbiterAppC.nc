/*
 * Copyright (c) 2004, Technische Universitat Berlin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 * - Neither the name of the Technische Universitat Berlin nor the names
 *   of its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
 * OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
 * USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * - Revision -------------------------------------------------------------
 * $Revision: 1.1.2.1 $
 * $Date: 2005-12-21 17:43:06 $ 
 * ======================================================================== 
 */
 
 /**
 * TestArbiter Application  
 * This application is used to test the functionality of the arbiter 
 * components developed using the Resource and ResourceUser uinterfaces
 *
 * @author Kevin Klues (klues@tkn.tu-berlin.de)
 * @author Philipp Huppertz (extended to test FcfsPriorityArbiter)
 */
 

configuration TestPriorityArbiterAppC{
}
implementation {
  components  MainC, 
              TestPriorityArbiterC,
              LedsC,
              new FcfsPriorityArbiterC("Test.Arbiter.Resource") as Arbiter,
              new OskiTimerMilliC() as Timer1,
              new OskiTimerMilliC() as Timer2,
              new OskiTimerMilliC() as Timer4;

 

  TestPriorityArbiterC -> MainC.Boot;
  MainC.SoftwareInit -> LedsC;
  MainC.SoftwareInit -> Arbiter;
 
  TestPriorityArbiterC.TimerResource1 -> Timer1;
  TestPriorityArbiterC.TimerResource2 -> Timer2;
  TestPriorityArbiterC.TimerResource4 -> Timer4;
  
  TestPriorityArbiterC.Resource4 -> Arbiter.HighestPriorityClient;  
  TestPriorityArbiterC.Resource3 -> Arbiter.LowestPriorityClient;  
  TestPriorityArbiterC.Resource2 -> Arbiter.Resource[unique("Test.Arbiter.Resource")];
  TestPriorityArbiterC.Resource1 -> Arbiter.Resource[unique("Test.Arbiter.Resource")];
  TestPriorityArbiterC.ArbiterInfo -> Arbiter.ArbiterInfo;
  
  TestPriorityArbiterC.Leds -> LedsC;
}

