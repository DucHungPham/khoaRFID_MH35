#include "ms82_pwm.h"


/*====================================================
*函数名:SET_EPWM_ON
*功能:CCP1模块开启PWM半桥输出,占空比50%,频率为10KHz,带死区
*输入参数:无
*返回参数:无
====================================================*/
void SET_EPWM_ON(void)
{
	TRISC |= 0b00000100; // GPIO off (2)
	PR2 = 15; //T99
	EPWMR1L =0; //Duty50
	EPWM1CON = 0b10011100; //PWM EPWM1CON[5:4] =[01] => gia tri thuc te test dam bao duty 50% T=8us
	TMR2 = 0;
	TMR2IF = 0;
	T2CON = 0B00000100;
	while(TMR2IF==1) CLRWDT();
	PWM1CON = 0b00010000; 
	EPWM1AUX = 0b10001000;//P1DOE
	TRISC &= 0b11111011;// GPIO on (2)
}
/***************************
PWM_T = (PR2+1)*4*Tosc*(Timer2 perscaler)
Tosc=(1/8MHz)=0.125us
Timer2prescaler 1:1
T = (99+1)*4*0.125us*1=8us=>125KHz

Duty = (EPWMR1L:EPWM1CON[5:4])/(4*(PR2+1))
(EPWMR1L:EPWM1CON[5:4])=32
D/T =32/(4*(15+1))=50%

***************************/