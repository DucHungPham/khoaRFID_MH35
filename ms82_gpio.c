#include "ms82_gpio.h"

void gpio_init(void){
    
	OSCCON = 0B01010001;   //Bit7    >>>  LFMOD=0 >>> WDT振荡器频率=32KHz
                           //Bit6:4 >>> IRCF[2:0]=101 >>> 内部RC频率=4MHz
                           //Bit0   >>> SCS=1      >>> 系统时钟选择为内部振荡器
	INTCON = 0B00000000; //暂禁止所有中断
	PIE1 = 0B00000000;
	PIR1 = 0B00000000;
	PORTA = 0B00000000;
	TRISA = 0B11111110;  //RA0为输出,其他PORTA口为输入
	WPUA = 0B11111110;   //开启除RA0之外其他PORTA口的内部上拉
	PORTC = 0B00000000;
	TRISC = 0B11111111;  //设置所有PORTC口为输入
	WPUC = 0B11111111;     //所有PORTC口的内部弱上拉开启
	OPTION = 0B00000000; //bit7=0,开启PORTA内部上拉总闸

}