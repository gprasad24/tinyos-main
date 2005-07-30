// $Id: CC2420RadioInterruptCCA.nc,v 1.1.2.4 2005-07-30 23:09:03 mturon Exp $

/* "Copyright (c) 2000-2005 The Regents of the University of California.  
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

/**
 * @author Joe Polastre
 * @author Martin Turon
 */

// Set to 1 msec resolution
#define CC2420CCA_SOFT_IRQ_RATE 1

/**
 * Create a SoftIrq to provide standard interrupt interface
 * for a CPU pin that doesn't handle external interrupts.
 */
configuration CC2420RadioInterruptCCA
{
  provides interface Interrupt;
}
implementation
{
    components 
	new SoftIrqC(CC2420CCA_SOFT_IRQ_RATE) as SoftIrq,
        CC2420RadioIO;
    
    Interrupt = SoftIrq;
    SoftIrq -> CC2420RadioIO.CC2420RadioCCA;
}
