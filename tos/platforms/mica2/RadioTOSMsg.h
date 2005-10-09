/* $Id: RadioTOSMsg.h,v 1.1.2.2 2005-10-09 16:35:35 scipio Exp $
 * "Copyright (c) 2005 The Regents of the University  of California.  
 * All rights reserved.
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without written agreement is
 * hereby granted, provided that the above copyright notice, the following
 * two paragraphs and the author appear in all copies of this software.
 * 
 * IN NO EVENT SHALL THE UNIVERSITY OF CALIFORNIA BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT
 * OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF
 * CALIFORNIA HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * THE UNIVERSITY OF CALIFORNIA SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE UNIVERSITY OF CALIFORNIA HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS."
 *
 * Copyright (c) 2002-2005 Intel Corporation
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached INTEL-LICENSE     
 * file. If you do not find these files, copies can be found by writing to
 * Intel Research Berkeley, 2150 Shattuck Avenue, Suite 1300, Berkeley, CA, 
 * 94704.  Attention:  Intel License Inquiry.
 */

/**
 * Defining the platform-independently named packet structures to be the
 * chip-specific CC1000 packet structures.
 *
 * @author Philip Levis
 * @date   May 16 2005
 * Revision:  $Revision: 1.1.2.2 $
 */


#ifndef RADIO_TOS_MSG_H
#define RADIO_TOS_MSG_H

#include "CC1000Msg.h"
#include "Serial.h"

typedef union TOSRadioHeader {
  CC1KHeader cc1k;
  SerialAMHeader serial;
} TOSRadioHeader;

typedef union TOSRadioFooter {
  CC1KFooter cc1k;
} TOSRadioFooter;

typedef union TOSRadioMetadata {
  CC1KMetadata cc1k;
} TOSRadioMetadata;

#endif
