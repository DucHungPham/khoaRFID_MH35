#ifndef __memHand_h
#define __memHand_h

#include "main.h"

#define __memRam
#define __memBegin 0x00
#define __memEnd 0xff
#define __memLenMax 0xff

#define Null 0xff
#define False 0
#define True !False

static unsigned char memIdx = 0;


/*
	(__memBegin)[Idx][lenOfArr1][Arr1..]...[lenOfArrN][ArrN..](__memEnd)
	Length of data = lenOfArr1 + ... + lenOfArrN + Idx + 1
*/
// byte
//void memByteWrite(unsigned char add,unsigned char val);//
//unsigned char memByteRead(unsigned char add);//
//unsigned char memByteAdd(unsigned char val);//
//unsigned char memByteDel(unsigned char idx);

// array
#define memGetIdx() return memIdx
unsigned char comArr(unsigned char *arr1, unsigned char *arr2, unsigned char len1,unsigned char len2);
unsigned char memSearch(unsigned char *arr,unsigned char len);
unsigned char memGet(unsigned char id, unsigned char *buf);
unsigned char memAdd(unsigned char *arr,unsigned char len);
unsigned char memDel(unsigned char id);
void memEdit(unsigned char id,unsigned char *arr,unsigned char len);
void memWriteBlock(unsigned char add,unsigned char *buf,unsigned char len);
void memWriteByte(unsigned char add,unsigned char val);
void memReadBlock(unsigned char add,unsigned char *buf,unsigned char len);
unsigned char memReadByte(unsigned char add);
#endif