#ifndef _eeprom_H
#define _eeprom_H

#include "main.h"

#define __memRam
#define __memBegin 0x06
#define __memEnd 0x5f
#define __memLenMax 0xff

#define __addIdx __memBegin
#define __addMem __memBegin +1

#define Null 0xff
#define False 0
#define True 255

//static unsigned char memIdx = 0;

unsigned char eepromReadByte(unsigned char EEAddr);
void eepromWriteByte(unsigned char EEAddr,unsigned char EEData);
void eepromReadBlock(unsigned char addStart,unsigned char *buff, unsigned char len);
void eepromWriteBlock(unsigned char addStart,unsigned char *buff, unsigned char len);
unsigned char comArr(unsigned char *arr1, unsigned char *arr2, unsigned char len1,unsigned char len2);
unsigned char eepromSearch(unsigned char *arr,unsigned char len);
unsigned char eepromGet(unsigned char id, unsigned char *buf);
unsigned char eepromAdd(unsigned char *arr,unsigned char len);
unsigned char eepromReplace(unsigned char id, unsigned char *buf, unsigned char len);
void eepromClear(void);

#endif