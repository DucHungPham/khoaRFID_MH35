#ifndef _RFID_H
#define _RFID_H

#include "main.h"

#define RFID_ID       RA4

#define timeMax   600//600   		max time of signal				
#define timeMin   290//290 	min time of signal
  						
#define CntH	TMR1H
#define CntL 	TMR1L
#define CntOn 	TMR1ON = 1
#define CntOff 	TMR1ON = 0

extern unsigned char keyID[5];
unsigned char get_RFID();//


#endif 