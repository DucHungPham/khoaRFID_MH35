//Project: smartkey.prj
// Device: MS82Fxx02
// Memory: Flash 2KX14b, EEPROM 128X8b, SRAM 128X8b
// Author: 
//Company: 
//Version:
//   Date: 
//===========================================================
//===========================================================


/*
//

// tat ca deu k co 833
	Smart
    k cos tinh nawng sao chia cua the bao hanh
    
    // co tinh nang sao the bao hanh
    Asimo
    3-5s-> keu coi, sau 20s-> sao chia= su dung the chu khi sao chia thuong
    Asimo Coi(bo cuon day)
    5s-> keu,tuong tu MH35
    ///========
    //** y tuong
    su dung Password de xoa toan bo the da luu bao gom ca the master 
    su dung timeOut chinh xac de vao trang thai nhap pw
*/

#include 	"main.h"

#define maxTag 5


unsigned char buzFre=12;
unsigned int timeOut ,timeTick=0;
unsigned char  mtState = 0,PwInNum=0;//
unsigned char keyID[5]={0,0,0,0,0};
unsigned char buffTag[25]={0,0,0x11,0x0b,0x4f, //master
0,0,0x81,0x2f,0x22,	//subport
0,0,0x7d,0x67,0x05,//tag1
0,0,0x7e,0x31,0xe7,//tag2
0,0,0x7e,0x51,0xe6,//tag3
};	


//unsigned char const master[5]={0,0,0x11,0x0b,0x4f};

//===========================================================
//Variable definition
//===========================================================
void delay_x10ms(unsigned char t){
		while(t--)
			__delay_ms(10);
}
void beep(unsigned char delay,unsigned char rep){
 TMR1ON = 1;T0IE = 1;

		while(rep--){
             TMR1ON = 1;T0IE = 1;
            buzFre=42;	//45 80 (dec)
			delay_x10ms(delay);
            T0IE = 0;//?
            TMR1ON = 0;buzzer =0;
            delay_x10ms(20);
        }
        
    T0IE = 0;
}

void interrupt ISR(void)
{
//	unsigned char tmp=0;
//=============
//
/*
	if(PAIE && PAIF){
		
		tmp = PORTA;		//
		PAIF = 0;          //clear flag      
		return;
	}
 */
//====================
/*
	if(INTE&&INTF)
		{
			INTF = 0;
         
            Suon xuong -> luu EEPROM
            
            

            return;      
		}*/
        
 //====================
	 if(T0IE&&T0IF)
		{
			T0IF = 0;
			TMR0 = buzFre;//
			buzzer = ~buzzer;
            return;
		}
 //====================
 //====================   
// Timer1 Interrup 
/*
	if(TMR1IE&&TMR1IF){
        
        TMR1IF = 0;
		return;
  	}
    */
 //====================
// Timer2 ->> buzzer  
 /*
	if(TMR2IE&&TMR2IF)
		{
			TMR2IF = 0;    
            return;
            
		}
    */
}


void setState(unsigned char stt, unsigned int _tOut){

	mtState = stt;
	timeTick =0;
	timeOut = _tOut;
}

unsigned char id_search(unsigned char *id_input,unsigned char *buff){
	unsigned char i;
    for(i=0;i<21;i+=5){
		if(comArr(id_input,buff+i,5,5))
			return i/5 +1;	
	}
	return 255;
}
void id_replate(unsigned char id,unsigned char *Cont,unsigned char *buff ){
    id=(id-1)*5;
    {
			{
					*(buff+id)  = *Cont;
                    *(buff+1+id)  = *(Cont+1);
                    *(buff+2+id)  = *(Cont+2);
                    *(buff+3+id)  = *(Cont+3);
                    *(buff+4+id)  = *(Cont+4);
			}
	}
    
	eepromWriteBlock(__memBegin,buffTag,25);
}
void id_clear(unsigned char idMin,unsigned char idMax){
	unsigned char  tmp[5]={0xff,0xff,0xff,0xff,0xff};
	for(idMin;idMin<=idMax;idMin++)
		 id_replate(idMin,tmp,buffTag);
}

void main(void)
{
	// clear WDT
#asm
	MOVLW		0x07			//
	MOVWF		0x19			//
#endasm

unsigned char idop,tmp,idState=0; // tag RFID code
unsigned char t1;//,t2,t3;
	CLRWDT();
    
	sys_init();
	gpio_init();
        
    timer_init();
    int_init();
    
// init EEPROM
//...
//Write twice at an arbitrary address that is not used 0xAA
// If the program has read and write EEPROM, this operation must be performed
eepromWriteByte(0x7F,0xAA);			
	eepromWriteByte(0x7F,0xAA);		
//them delay giua read delay write    

    TRISC &=0xfe;

	SET_EPWM_ON();
	
    //Power On
	//beep(2);
 __delay_ms(20);   
//eepromReadBlock(__memBegin,buffTag,25);

//<<< su dung WDT>>>

    if(eepromReadByte(addNoPw) == 0xff) eepromWriteByte(addNoPw,0);
    if(eepromReadByte(addEmgStart)==0xff)eepromWriteByte(addEmgStart,0);
    
	if(eepromReadByte(__memBegin)!=0){
		//setState(_firstProg,tOut_firstProg);// fist prog
       // tmp=0;
       //write master tag
       eepromWriteByte(__memBegin,0);//0= master xuong
       eepromWriteByte(__memBegin+1,0);//0
       eepromWriteByte(__memBegin+2,0x87);//87
       eepromWriteByte(__memBegin+3,0x3a);//3a
       eepromWriteByte(__memBegin+4,0xf8);//f8

	}
    eepromReadBlock(__memBegin,buffTag,maxTag*5);
    //else
 
    {   					
		if( eepromReadByte(addOldState) == _PwTp){
			tmp = eepromReadByte(addNoPw);
			t1 = tmp;
		   
			if(t1 == 3){

				//t1 = eepromReadByte(addPwIn1);
				//t2 = eepromReadByte(addPwIn2);
				//t3 = eepromReadByte(addPwIn3);
				if((eepromReadByte(addPwIn1)==pwES1) && (eepromReadByte(addPwIn2)==pwES2)&&(eepromReadByte(addPwIn3)==pwES3)){
					eepromWriteByte(addEmgStart,1);
					setState(_Open,0);
					beep(20,2);
				}
				else{
						setState(_PwOn,tOut_PwOn);
						beep(10,5);
				}
				
				 eepromWriteByte(addOldState,0);
				 eepromWriteByte(addNoPw,0);
				 eepromWriteByte(addPwIn3,0);
				 eepromWriteByte(addPwIn2,0);
				 eepromWriteByte(addPwIn1,0);
		
			}
			else{     
				tmp = eepromReadByte(addNoPw) ;
				tmp++;
				eepromWriteByte(addNoPw,tmp);
				PwInNum=0;
				setState(_PwTp,tOut_PwTp);
				
			}
		}	
		else{
			setState(_PwOn,tOut_PwOn);
		}

		if(eepromReadByte(addEmgStart)== 1){	
				setState(_Open,0);
			}
    } 

	setState(_PwOn,tOut_PwOn);


///////

tmp=0;

while(1){
     //GIE = 0; 
     idop =    get_RFID();
     //GIE = 1;
	if(idop){
        swUartSendString("\nTag: "); 
         //SendNum(keyID[0]);
         SendNum(keyID[1]);
         SendNum(keyID[2]);
         SendNum(keyID[3]);
         SendNum(keyID[4]);
	idop = id_search(keyID,buffTag);
		switch (mtState){ 
            case _PwTp: 
				           
			case _PwOn:
			case _Alert:

				if((idop>1) && (idop <6))				
				{				
                    if( eepromReadByte(addOldState) == _PwTp) eepromWriteByte(addOldState,0);                  
                    if(mtState==_PwTp){                        
					 eepromWriteByte(addNoPw,0);
					 eepromWriteByte(addPwIn3,0);
					 eepromWriteByte(addPwIn2,0);
					 eepromWriteByte(addPwIn1,0);
					}			
					setState(_Open,tOut_Open);
					beep(10,1);
				}

                else if(idop==1) //MH35 the chu cho phep vao che do sao chia bao hanh              	
                {
						//clear subTag
					id_clear(2,5);
					setState(_subTagProg,0);//
                    tmp=1;//start tag2
					beep(10,3);
                    }
                    
				break;

			case _Open:
				if(idop<=maxTag && idop!=1 ){
					if(eepromReadByte(addEmgStart)==1){
						eepromWriteByte(addEmgStart,0);
                        beep(10,2);					
					}
                    //beep(10,1);
				}
                else if(idop==1){
                    
                    }
				break; 

			case _rProg:
			// ap dung cho MH35
				if(idop==1 && idState == 0){	// masterTag
					//clear subTag
					id_clear(2,maxTag);
					setState(_subTagProg,0);//setState(_subTagProg,80);
                    tmp=1;//start tag2
					beep(10,3);
				}
				// ap dung cho cac bo con lai
				else if(idop==2 && idState == 0){// subTag
					//clear norTag
					id_clear(3,maxTag);
					setState(_norTagProg,0);//setState(_norTagProg,80);
					tmp=2;//start tag3
					beep(10,2);
				}
				break;
					// ap dung MH 35  
			case _subTagProg:
				//must be difiren marter tag
                if (idState == 0){
                    /*
					if(idop !=1){ 
						id_replate(2,keyID,buffTag);
						timeTick=0;
						beep(10,1);
                        */
                     if( idop !=1){
						tmp++;
						//if(tmp==5) tmp =3;
                        if(tmp <=maxTag){
							id_replate(tmp,keyID,buffTag);
							timeTick=0;
							beep(10,1);
                        }
					}else{
						//beep(10,5);
						}
                }else{
                    beep(10,1);
                    }
				break;
///ap dung cho tat ca
			case _norTagProg:
				//must be difiren sub tag and marter tag
                if(idState == 0){
					if( idop >2){
						tmp++;
						//if(tmp==5) tmp =3;
                        if(tmp <=maxTag){
							id_replate(tmp,keyID,buffTag);
							timeTick=0;
							beep(10,1);
                        }
					}else{
						//beep(10,5);
						}
                }else{
                    beep(10,1);
				}
				break;
                /*
            case _firstProg:
				if(idState == 0){ 
                    if(idop==255){                   
						tmp++;
						//if(tmp==5) tmp =0;
                        if(tmp<=maxTag){
							id_replate(tmp,keyID,buffTag);
                            beep(20,1);
                           
                        }
					}else{
						//beep(10,5);
                    }
					//timeOut =50;
				}
                timeTick=0;
                   
				break;
                */
		}
		
		idState = 1;          
		__delay_ms(61);
	}
    else{
		idState =0;
       __delay_ms(150);
	}
    
//========================== time out
  
        if((timeOut!=0)&&( timeTick > timeOut)){
              		
			switch (mtState){
             
                case _PwOn:               
			        setState(_Alert,tOut_Alert);// time out Asimo 20s, MH35 5s
                    buzFre=0x6a;
			        break;
			    case _Alert:
                	setState(_rProg,tOut_rProg);
			        break;
				case _rProg:
                	setState(_Alert,0);
                    buzFre=0x6a;
                	eepromWriteByte(addOldState,_PwTp);
                    eepromWriteByte(addNoPw,0);
                	break;
               	case _PwTp:            		
                	 
                    if(RC1==1){
                    	PwInNum++;
                        tmp = eepromReadByte(addNoPw);
                        if(tmp>0&&tmp<4){
                            tmp--;
                            eepromWriteByte(addPwIn1+tmp,PwInNum);
						}
					
					beep(10,1);
                    setState(_PwTp,tOut_PwTp);	
					}        
                
                	break;
                 /*   
                 case _norTagProg:
                 case _subTagProg:
					//beep(10,5);               
			        //setState(_PwOn,tOut_PwOn);
			        break;
                    
                 case _firstProg:
					if (eepromReadByte(__memBegin)==255)
						beep(10,1);               
			        setState(_firstProg,tOut_firstProg);
			        break;
                    */
			}
		}

//============Set
        if(mtState==_Open) swMainOut = 1;
        else swMainOut =0; 

	// __delay_ms(100);
    
	//77 85  58 6c 69 [6a] 75 70

//==========
    if(mtState == _Alert) {
        // cac bo con lai      
        TMR1ON = 1;T0IE = 1;
       if(timeTick%4 ==0){

			if(buzFre==0x6a){
				 buzFre=12;	
			}else{
                buzFre=0x6a;
			}

		}
    }else{TMR1ON = 0;T0IE = 0;};
//============= 
    
     timeTick++;
     
}

}
//===========================================================
