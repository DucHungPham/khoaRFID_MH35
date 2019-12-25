#include "ms82_eeprom.h"



/*====================================================*/
unsigned char eepromReadByte(unsigned char EEAddr)
{
	unsigned char ReEepromData;

	EEADR = EEAddr;    
	RD = 1;
	ReEepromData = EEDAT;
	RD = 0;
	return ReEepromData;
}

void eepromReadBlock(unsigned char addStart,unsigned char *buff, unsigned char len)
{
	unsigned char i;
	for(i=0;i<len;i++){
        buff[i] = eepromReadByte(addStart+i);   
	}
}

void eepromWriteByte(unsigned char EEAddr,unsigned char EEData)
{
	GIE = 0; 
    //if(eepromReadByte(EEAddr)!= EEData)
    {    
		while(GIE) CLRWDT();
		EEADR = EEAddr;
		EEDAT = EEData;
		EEIF = 0;
		EECON1 = 0x34;
		WR = 1;
		while(WR) CLRWDT();
        __delay_ms(2);	
	}
	GIE = 1;
}

void eepromWriteBlock(unsigned char addStart,unsigned char *buff, unsigned char len)
{
	unsigned char i;
	for(i=0;i<len;i++){
		eepromWriteByte(addStart+i,buff[i]);
    }

}


unsigned char comArr(unsigned char *arr1, unsigned char *arr2, unsigned char len1,unsigned char len2){
	unsigned char i;

	if(len1!=len2)
		return 0;
	else{
		for(i=0;i<len1;i++){
			if(*(arr1+i) != *(arr2+i)){
				return 0;
            }           
		}
		if(i==len1)
			return 1;
        else 
            return 0;
	}		
}

unsigned char eepromSearch(unsigned char *arr,unsigned char len){
	unsigned char i,tmp=0x12, memIdx;
    unsigned char *buf;
    memIdx = eepromReadByte(__addIdx);
	for (i = 1; i <= memIdx ;i++)
    {
		tmp = eepromGet(i,buf);
		tmp = comArr(arr,buf,len,tmp);
        
		if(tmp==1)
			return i;
	}
	return False;
}

unsigned char eepromReplace(unsigned char id, unsigned char *buf, unsigned char len){
    unsigned char i=1,tmp,addLen,memIdx;
	memIdx = eepromReadByte(__addIdx);
	if(id>memIdx || memIdx ==0 ) return False;
	//read array
	addLen = __addMem;
	while(i<id){
		addLen +=  eepromReadByte(addLen) + 1;
		i++;
	}
	tmp = eepromReadByte(addLen);
    if(tmp !=len) 
		return False;
	else 
		eepromWriteBlock(addLen+1,buf,tmp);
	return tmp;
}

unsigned char eepromGet(unsigned char id, unsigned char *buf){
	
	unsigned char i=1,tmp,addLen,memIdx;
	memIdx = eepromReadByte(__addIdx);
	if(id>memIdx || memIdx ==0 ) return False;
	//read array
	addLen = __addMem;
	while(i<id){
		addLen +=  eepromReadByte(addLen) + 1;
		i++;
	}
	tmp = eepromReadByte(addLen);
	eepromReadBlock(addLen+1,buf,tmp);
	return tmp;
}

void eepromClear(void){
    unsigned char i;
    for(i=__memBegin ;i<=__memEnd;i++)
		eepromWriteByte(i,Null);
}
/**/

unsigned char eepromAdd(unsigned char *arr,unsigned char len){
	unsigned char i=0,idx,addLen;
	//write array
	idx =  eepromReadByte(__addIdx);
    if(idx==0xff) {
        idx =0;
         eepromWriteByte(__addIdx,0);
        }
	addLen = __addMem;

	while(i<=idx){
		addLen +=  eepromReadByte(addLen) + 1;
		i++;
	}
	eepromWriteByte(addLen,len);
	eepromWriteBlock(addLen+1,arr,len);
	idx++;
	eepromWriteByte(__addIdx,idx);
	//save idx
	return idx;
}