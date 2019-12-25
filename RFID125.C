#include "rfid125.h"


/*====================================================*/

unsigned int timerOut(unsigned char Logic,unsigned int time){
	unsigned int CurTimer;
CntOff;
    CntH = 0;
    CntL = 0;
    TMR1IF = 0;
    CntOn;	
    while(RFID_ID==Logic){
         CurTimer= (CntH <<8 )| CntL;
		if(CurTimer>time)
			return 0;
	}
    return CurTimer;
}
unsigned char get_RFID()//
{
		//unsigned char   keyID[5];							
		unsigned char   RF_serial_55bits[11];	
		unsigned int timeOutVal;
		unsigned char  i,ii,j;
		unsigned char  flag_RFID_syn, flag_RFID_last;
		unsigned char  even_row, even_col;
		

		flag_RFID_syn = 0;				
		timeOutVal = 0;				  
     
      i=16;
		do                                 
		{
            timeOutVal=timerOut(1,timeMax);
            if(timeOutVal==0) return 0;
            
			timeOutVal=timerOut(0,timeMax);
            if(timeOutVal==0) return 0;
            
        	i--;
		}
		while(timeOutVal<timeMin && i>0);
		flag_RFID_last = 1;
		i = 0;
		while(i<64)
		{
				for(ii=0;ii<9;ii++)
				{						
						timeOutVal=timerOut(flag_RFID_last,timeMax);
						if(timeOutVal==0) return 0;
                        
						if(0==flag_RFID_last && timeOutVal<=timeMin ||          
								1==flag_RFID_last && timeOutVal>timeMin)        
						{
								if(!flag_RFID_last)
								{
									timeOutVal=timerOut(1,timeMin);
									if(timeOutVal==0) return 0;										
								}
								flag_RFID_last = 0;
								i++;
						}
						else
						if(0==flag_RFID_last && timeOutVal>timeMin ||        
								1==flag_RFID_last && timeOutVal<=timeMin)    
						{
								if(flag_RFID_last)
								{
										timeOutVal=timerOut(0,timeMin);
										if(timeOutVal==0) return 0;
								}
								flag_RFID_last = 1;
								i++;

								break;
						}
					
				}				
				if(9==ii)					 	
				{
						flag_RFID_syn = 1;      
						break;
				}
		}

		if(!flag_RFID_syn)              		
		{
			return 0;
		}
		for(ii=0;ii<55;ii++)
		{
				i = ii/5;
				timeOutVal=timerOut(flag_RFID_last,timeMax);
				if(timeOutVal==0) return 0;
                                    
				if(0==flag_RFID_last && timeOutVal<=timeMin ||       		
						1==flag_RFID_last && timeOutVal>timeMin)         
				{
						if(!flag_RFID_last)
						{
								timeOutVal=timerOut(1,timeMin);
								if(timeOutVal==0) return 0;
						}
						flag_RFID_last = 0;
						RF_serial_55bits[i] <<= 1;
						RF_serial_55bits[i] |= 0x01;
				}
				else
				if(0==flag_RFID_last && timeOutVal>timeMin ||            
						1==flag_RFID_last && timeOutVal<=timeMin)       
				{
						if(flag_RFID_last)
						{
								timeOutVal=timerOut(0,timeMax);
								if(timeOutVal==0) return 0;
						}
						flag_RFID_last = 1;
						RF_serial_55bits[i] <<= 1;
				}
		}
		if(55==ii)
		{
				even_col = 0;                   
				for(ii=0;ii<10;ii++)
				{
						even_row = (RF_serial_55bits[ii] & 0x01);          
						for(j=1;j<5;j++)
						{
							even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);	
						}
						if(even_row & 0x01)
						{
							return 0;	
						}
//						even_row =0;
						RF_serial_55bits[ii] <<= 3;

						i = RF_serial_55bits[ii];
						if( 0==ii%2 )
						{
								 keyID[ii/2] = (i & 0xF0);
						}
						else
						{
								 i >>=4;
								 keyID[ii/2] |= (i & 0x0F);
						}
						even_col ^= RF_serial_55bits[ii];
				}
				RF_serial_55bits[10] <<= 3;
				keyID[0] =0x00;
				if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial_55bits[10]&0x08)))
				{
						//key_out = &keyID[0];
						return 1;
				}
		}
		return 0;
 }

/*====================================================*/