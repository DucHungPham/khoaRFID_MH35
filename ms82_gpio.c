#include "ms82_gpio.h"

void gpio_init(void){
    
	OSCCON = 0B01010001;   //Bit7    >>>  LFMOD=0 >>> WDT����Ƶ��=32KHz
                           //Bit6:4 >>> IRCF[2:0]=101 >>> �ڲ�RCƵ��=4MHz
                           //Bit0   >>> SCS=1      >>> ϵͳʱ��ѡ��Ϊ�ڲ�����
	INTCON = 0B00000000; //�ݽ�ֹ�����ж�
	PIE1 = 0B00000000;
	PIR1 = 0B00000000;
	PORTA = 0B00000000;
	TRISA = 0B11111110;  //RA0Ϊ���,����PORTA��Ϊ����
	WPUA = 0B11111110;   //������RA0֮������PORTA�ڵ��ڲ�����
	PORTC = 0B00000000;
	TRISC = 0B11111111;  //��������PORTC��Ϊ����
	WPUC = 0B11111111;     //����PORTC�ڵ��ڲ�����������
	OPTION = 0B00000000; //bit7=0,����PORTA�ڲ�������բ

}