#include "memHandler.h"

#define __addIdx __memBegin
#define __addMem __memBegin +1


/**/
unsigned char memReadByte(unsigned char add){
	return eepromReadByte(add);
}
/**/
void memReadBock(unsigned char add,unsigned char *buf,unsigned char len){
	eepromReadBlock(add,buf,len);
}

void memWriteByte(unsigned char add,unsigned char val){
	eepromWriteByte(add,val);
}

void memWriteBlock(unsigned char add,unsigned char *buf,unsigned char len){
	eepromWriteBlock(add,buf,len);
}
/*
	len arr1< arr2
>> True/False
*/
unsigned char comArr(unsigned char *arr1, unsigned char *arr2, unsigned char len1,unsigned char len2){
	unsigned char i;

	if(len1!=len2)
		return False;
	else{
		for(i=0;i<len1;i++){
			if(arr1[i]!=arr2[i])
				return False;
		}
		return True;
	}		
}
/*
>> index of arr Or 
*/
unsigned char memSearch(unsigned char *arr,unsigned char len){
	unsigned char i,*buf,tmp;
	for (i = 0; i < memIdx ;i++){
		tmp = memGet(i,buf);
		
		if(comArr(arr,buf,len,tmp))
			return i;
	}
	return False;
}
/*
>> lengh of buffer
*/
//unsigned char memLoad(unsigned char *buf){
	//read array
//}
/**/

unsigned char memGet(unsigned char id, unsigned char *buf){
	
	unsigned char i,tmp,addLen;

	if(id>memIdx || memIdx ==0 ) return False;
	//read array
	addLen = __addMem;
	while(i<id){
		addLen +=  memReadByte(addLen) + 1;
		i++;
	}
	tmp = memReadByte(addLen);
	memReadBock(addLen,buf,tmp);
	return tmp;
}
/**/
unsigned char memAdd(unsigned char *arr,unsigned char len){
	unsigned char i,idx,addLen;
	//write array
	idx =  memReadByte(__addIdx);
	addLen = __addMem;

	while(i<=idx){
		addLen +=  memReadByte(addLen) + 1;
		i++;
	}
	memWriteByte(addLen,len);
	memWriteBlock(addLen+1,arr,len);
	idx++;
	memWriteByte(__addIdx,idx);
	//save idx
	return idx;
}
/**/
//unsigned char memDel(unsigned char id){
	//
//}
/**/
//unsigned char memEdit(unsigned char id,unsigned char *arr,unsigned char len){
	//
//	if(id>=memIdx) return False;
	// edit
//	return True;
//}