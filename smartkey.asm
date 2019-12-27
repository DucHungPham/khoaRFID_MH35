//Deviec:MS82Fxx02
//-----------------------Variable---------------------------------
		_buzFre		EQU		25H
		_timeOut		EQU		5AH
		_timeTick		EQU		5CH
		_mtState		EQU		5FH
		_PwInNum		EQU		5EH
		_keyID		EQU		60H
		_buffTag		EQU		26H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	55BH 			//0009 	3D5B
		LJUMP 	50FH 			//000A 	3D0F
		LDWI 	7H 			//000B 	2A07
		ORG		000CH
		STR 	19H 			//000C 	0199

		//;MAIN.C: 160: unsigned char idop,tmp,idState=0;
		BCR 	STATUS,5 		//000D 	1283
		BCR 	STATUS,6 		//000E 	1303
		CLRR 	57H 			//000F 	0157
		CLRWDT	 			//0010 	0001

		//;MAIN.C: 164: sys_init();
		LCALL 	5CDH 			//0011 	35CD

		//;MAIN.C: 165: gpio_init();
		LCALL 	58BH 			//0012 	358B

		//;MAIN.C: 167: timer_init();
		LCALL 	5D7H 			//0013 	35D7
		ORG		0014H

		//;MAIN.C: 168: int_init();
		LCALL 	538H 			//0014 	3538

		//;MAIN.C: 174: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0015 	2AAA
		STR 	72H 			//0016 	01F2
		LDWI 	7FH 			//0017 	2A7F
		LCALL 	402H 			//0018 	3402

		//;MAIN.C: 175: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0019 	2AAA
		STR 	72H 			//001A 	01F2
		LDWI 	7FH 			//001B 	2A7F
		ORG		001CH
		LCALL 	402H 			//001C 	3402

		//;MAIN.C: 178: TRISC &=0xfe;
		BSR 	STATUS,5 		//001D 	1A83
		BCR 	STATUS,6 		//001E 	1303
		BCR 	7H,0 			//001F 	1007

		//;MAIN.C: 180: SET_EPWM_ON();
		LCALL 	4F7H 			//0020 	34F7

		//;MAIN.C: 184: _delay((unsigned long)((20)*(8000000/4000.0)));
		LDWI 	34H 			//0021 	2A34
		BCR 	STATUS,5 		//0022 	1283
		STR 	54H 			//0023 	01D4
		ORG		0024H
		LDWI 	F1H 			//0024 	2AF1
		STR 	53H 			//0025 	01D3
		DECRSZ 	53H,1 		//0026 	0ED3
		LJUMP 	26H 			//0027 	3826
		DECRSZ 	54H,1 		//0028 	0ED4
		LJUMP 	26H 			//0029 	3826
		LJUMP 	2BH 			//002A 	382B

		//;MAIN.C: 189: if(eepromReadByte(0x02) == 0xff) eepromWriteByte(0x02,0);
		LDWI 	2H 			//002B 	2A02
		ORG		002CH
		LCALL 	5E1H 			//002C 	35E1
		XORWI 	FFH 			//002D 	26FF
		BTSS 	STATUS,2 		//002E 	1D03
		LJUMP 	33H 			//002F 	3833
		LDWI 	2H 			//0030 	2A02
		CLRR 	72H 			//0031 	0172
		LCALL 	402H 			//0032 	3402

		//;MAIN.C: 190: if(eepromReadByte(0x01)==0xff)eepromWriteByte(0x01,0);
		LDWI 	1H 			//0033 	2A01
		ORG		0034H
		LCALL 	5E1H 			//0034 	35E1
		XORWI 	FFH 			//0035 	26FF
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3BH 			//0037 	383B
		LDWI 	1H 			//0038 	2A01
		CLRR 	72H 			//0039 	0172
		LCALL 	402H 			//003A 	3402

		//;MAIN.C: 192: if(eepromReadByte(0x06)!=0){
		LDWI 	6H 			//003B 	2A06
		ORG		003CH
		LCALL 	5E1H 			//003C 	35E1
		XORWI 	0H 			//003D 	2600
		BTSC 	STATUS,2 		//003E 	1503
		LJUMP 	52H 			//003F 	3852
		LDWI 	6H 			//0040 	2A06

		//;MAIN.C: 196: eepromWriteByte(0x06,0);
		CLRR 	72H 			//0041 	0172
		LCALL 	402H 			//0042 	3402
		LDWI 	7H 			//0043 	2A07
		ORG		0044H

		//;MAIN.C: 197: eepromWriteByte(0x06+1,0);
		CLRR 	72H 			//0044 	0172
		LCALL 	402H 			//0045 	3402

		//;MAIN.C: 198: eepromWriteByte(0x06+2,0x87);
		LDWI 	87H 			//0046 	2A87
		STR 	72H 			//0047 	01F2
		LDWI 	8H 			//0048 	2A08
		LCALL 	402H 			//0049 	3402

		//;MAIN.C: 199: eepromWriteByte(0x06+3,0x3a);
		LDWI 	3AH 			//004A 	2A3A
		STR 	72H 			//004B 	01F2
		ORG		004CH
		LDWI 	9H 			//004C 	2A09
		LCALL 	402H 			//004D 	3402

		//;MAIN.C: 200: eepromWriteByte(0x06+4,0xf8);
		LDWI 	F8H 			//004E 	2AF8
		STR 	72H 			//004F 	01F2
		LDWI 	AH 			//0050 	2A0A
		LCALL 	402H 			//0051 	3402

		//;MAIN.C: 202: }
		//;MAIN.C: 203: eepromReadBlock(0x06,buffTag,5*5);
		LDWI 	26H 			//0052 	2A26
		STR 	74H 			//0053 	01F4
		ORG		0054H
		LDWI 	19H 			//0054 	2A19
		STR 	75H 			//0055 	01F5
		LDWI 	6H 			//0056 	2A06
		LCALL 	54AH 			//0057 	354A

		//;MAIN.C: 206: {
		//;MAIN.C: 207: if( eepromReadByte(0x00) == 7){
		LDWI 	0H 			//0058 	2A00
		LCALL 	5E1H 			//0059 	35E1
		XORWI 	7H 			//005A 	2607
		BTSS 	STATUS,2 		//005B 	1D03
		ORG		005CH
		LJUMP 	A9H 			//005C 	38A9

		//;MAIN.C: 208: tmp = eepromReadByte(0x02);
		LDWI 	2H 			//005D 	2A02
		LCALL 	5E1H 			//005E 	35E1
		BCR 	STATUS,5 		//005F 	1283
		STR 	59H 			//0060 	01D9

		//;MAIN.C: 209: t1 = tmp;
		STR 	56H 			//0061 	01D6

		//;MAIN.C: 211: if(t1 == 3){
		XORWI 	3H 			//0062 	2603
		BTSS 	STATUS,2 		//0063 	1D03
		ORG		0064H
		LJUMP 	99H 			//0064 	3899

		//;MAIN.C: 216: if((eepromReadByte(0x03)==8) && (eepromReadByte(0x04)==3)&&(eepromReadByte
		//+                          (0x05)==3)){
		LDWI 	3H 			//0065 	2A03
		LCALL 	5E1H 			//0066 	35E1
		XORWI 	8H 			//0067 	2608
		BTSS 	STATUS,2 		//0068 	1D03
		LJUMP 	80H 			//0069 	3880
		LDWI 	4H 			//006A 	2A04
		LCALL 	5E1H 			//006B 	35E1
		ORG		006CH
		XORWI 	3H 			//006C 	2603
		BTSS 	STATUS,2 		//006D 	1D03
		LJUMP 	80H 			//006E 	3880
		LDWI 	5H 			//006F 	2A05
		LCALL 	5E1H 			//0070 	35E1
		XORWI 	3H 			//0071 	2603
		BTSS 	STATUS,2 		//0072 	1D03
		LJUMP 	80H 			//0073 	3880
		ORG		0074H
		LDWI 	1H 			//0074 	2A01

		//;MAIN.C: 217: eepromWriteByte(0x01,1);
		CLRR 	72H 			//0075 	0172
		INCR	72H,1 			//0076 	09F2
		LCALL 	402H 			//0077 	3402
		LDWI 	0H 			//0078 	2A00

		//;MAIN.C: 218: setState(0,0);
		CLRR 	72H 			//0079 	0172
		CLRR 	73H 			//007A 	0173
		LCALL 	5C2H 			//007B 	35C2
		ORG		007CH

		//;MAIN.C: 219: beep(20,2);
		LDWI 	2H 			//007C 	2A02
		STR 	75H 			//007D 	01F5
		LDWI 	14H 			//007E 	2A14
		LJUMP 	88H 			//007F 	3888

		//;MAIN.C: 220: }
		//;MAIN.C: 221: else{
		//;MAIN.C: 222: setState(1,45);
		LDWI 	2DH 			//0080 	2A2D
		STR 	72H 			//0081 	01F2
		LDWI 	1H 			//0082 	2A01
		CLRR 	73H 			//0083 	0173
		ORG		0084H
		LCALL 	5C2H 			//0084 	35C2

		//;MAIN.C: 223: beep(10,5);
		LDWI 	5H 			//0085 	2A05
		STR 	75H 			//0086 	01F5
		LDWI 	AH 			//0087 	2A0A
		LCALL 	4A4H 			//0088 	34A4
		LDWI 	0H 			//0089 	2A00

		//;MAIN.C: 224: }
		//;MAIN.C: 226: eepromWriteByte(0x00,0);
		CLRR 	72H 			//008A 	0172
		LCALL 	402H 			//008B 	3402
		ORG		008CH
		LDWI 	2H 			//008C 	2A02

		//;MAIN.C: 227: eepromWriteByte(0x02,0);
		CLRR 	72H 			//008D 	0172
		LCALL 	402H 			//008E 	3402
		LDWI 	5H 			//008F 	2A05

		//;MAIN.C: 228: eepromWriteByte(0x05,0);
		CLRR 	72H 			//0090 	0172
		LCALL 	402H 			//0091 	3402
		LDWI 	4H 			//0092 	2A04

		//;MAIN.C: 229: eepromWriteByte(0x04,0);
		CLRR 	72H 			//0093 	0172
		ORG		0094H
		LCALL 	402H 			//0094 	3402
		LDWI 	3H 			//0095 	2A03

		//;MAIN.C: 230: eepromWriteByte(0x03,0);
		CLRR 	72H 			//0096 	0172
		LCALL 	402H 			//0097 	3402

		//;MAIN.C: 232: }
		LJUMP 	AEH 			//0098 	38AE

		//;MAIN.C: 233: else{
		//;MAIN.C: 234: tmp = eepromReadByte(0x02) ;
		LDWI 	2H 			//0099 	2A02
		LCALL 	5E1H 			//009A 	35E1
		BCR 	STATUS,5 		//009B 	1283
		ORG		009CH
		STR 	59H 			//009C 	01D9

		//;MAIN.C: 235: tmp++;
		INCR	59H,1 			//009D 	09D9

		//;MAIN.C: 236: eepromWriteByte(0x02,tmp);
		LDR 	59H,0 			//009E 	0859
		STR 	72H 			//009F 	01F2
		LDWI 	2H 			//00A0 	2A02
		LCALL 	402H 			//00A1 	3402
		LDWI 	AH 			//00A2 	2A0A

		//;MAIN.C: 237: PwInNum=0;
		BCR 	STATUS,5 		//00A3 	1283
		ORG		00A4H
		BCR 	STATUS,6 		//00A4 	1303
		CLRR 	5EH 			//00A5 	015E

		//;MAIN.C: 238: setState(7,10);
		STR 	72H 			//00A6 	01F2
		LDWI 	7H 			//00A7 	2A07
		LJUMP 	ACH 			//00A8 	38AC

		//;MAIN.C: 242: else{
		//;MAIN.C: 243: setState(1,45);
		LDWI 	2DH 			//00A9 	2A2D
		STR 	72H 			//00AA 	01F2
		LDWI 	1H 			//00AB 	2A01
		ORG		00ACH
		CLRR 	73H 			//00AC 	0173
		LCALL 	5C2H 			//00AD 	35C2

		//;MAIN.C: 244: }
		//;MAIN.C: 246: if(eepromReadByte(0x01)== 1){
		LDWI 	1H 			//00AE 	2A01
		LCALL 	5E1H 			//00AF 	35E1
		XORWI 	1H 			//00B0 	2601
		BTSS 	STATUS,2 		//00B1 	1D03
		LJUMP 	B7H 			//00B2 	38B7
		LDWI 	0H 			//00B3 	2A00
		ORG		00B4H

		//;MAIN.C: 247: setState(0,0);
		CLRR 	72H 			//00B4 	0172
		CLRR 	73H 			//00B5 	0173
		LCALL 	5C2H 			//00B6 	35C2

		//;MAIN.C: 248: }
		//;MAIN.C: 249: }
		//;MAIN.C: 254: tmp=0;
		BCR 	STATUS,5 		//00B7 	1283
		CLRR 	59H 			//00B8 	0159

		//;MAIN.C: 258: idop = get_RFID();
		LCALL 	22CH 			//00B9 	322C
		STR 	58H 			//00BA 	01D8

		//;MAIN.C: 260: if(idop){
		LDR 	58H,0 			//00BB 	0858
		ORG		00BCH
		BTSC 	STATUS,2 		//00BC 	1503
		LJUMP 	1A7H 			//00BD 	39A7

		//;MAIN.C: 261: swUartSendString("\nTag: ");
		LDWI 	1H 			//00BE 	2A01
		LCALL 	5B5H 			//00BF 	35B5

		//;MAIN.C: 263: SendNum(keyID[1]);
		BCR 	STATUS,5 		//00C0 	1283
		BCR 	STATUS,6 		//00C1 	1303
		LDR 	61H,0 			//00C2 	0861
		LCALL 	3DCH 			//00C3 	33DC
		ORG		00C4H

		//;MAIN.C: 264: SendNum(keyID[2]);
		BCR 	STATUS,5 		//00C4 	1283
		BCR 	STATUS,6 		//00C5 	1303
		LDR 	62H,0 			//00C6 	0862
		LCALL 	3DCH 			//00C7 	33DC

		//;MAIN.C: 265: SendNum(keyID[3]);
		BCR 	STATUS,5 		//00C8 	1283
		BCR 	STATUS,6 		//00C9 	1303
		LDR 	63H,0 			//00CA 	0863
		LCALL 	3DCH 			//00CB 	33DC
		ORG		00CCH

		//;MAIN.C: 266: SendNum(keyID[4]);
		BCR 	STATUS,5 		//00CC 	1283
		BCR 	STATUS,6 		//00CD 	1303
		LDR 	64H,0 			//00CE 	0864
		LCALL 	3DCH 			//00CF 	33DC

		//;MAIN.C: 267: idop = id_search(keyID,buffTag);
		LDWI 	26H 			//00D0 	2A26
		STR 	7AH 			//00D1 	01FA
		LDWI 	60H 			//00D2 	2A60
		LCALL 	4C0H 			//00D3 	34C0
		ORG		00D4H
		STR 	58H 			//00D4 	01D8

		//;MAIN.C: 268: switch (mtState){
		LJUMP 	18EH 			//00D5 	398E

		//;MAIN.C: 271: case 1:
		//;MAIN.C: 272: case 2:
		//;MAIN.C: 274: if((idop>1) && (idop <6))
		LDWI 	2H 			//00D6 	2A02
		SUBWR 	58H,0 			//00D7 	0C58
		BTSS 	STATUS,0 		//00D8 	1C03
		LJUMP 	101H 			//00D9 	3901
		LDWI 	6H 			//00DA 	2A06
		SUBWR 	58H,0 			//00DB 	0C58
		ORG		00DCH
		BTSC 	STATUS,0 		//00DC 	1403
		LJUMP 	101H 			//00DD 	3901

		//;MAIN.C: 275: {
		//;MAIN.C: 276: if( eepromReadByte(0x00) == 7) eepromWriteByte(0x00,0);
		LDWI 	0H 			//00DE 	2A00
		LCALL 	5E1H 			//00DF 	35E1
		XORWI 	7H 			//00E0 	2607
		BTSS 	STATUS,2 		//00E1 	1D03
		LJUMP 	E6H 			//00E2 	38E6
		LDWI 	0H 			//00E3 	2A00
		ORG		00E4H
		CLRR 	72H 			//00E4 	0172
		LCALL 	402H 			//00E5 	3402

		//;MAIN.C: 277: if(mtState==7){
		BCR 	STATUS,5 		//00E6 	1283
		BCR 	STATUS,6 		//00E7 	1303
		LDR 	5FH,0 			//00E8 	085F
		XORWI 	7H 			//00E9 	2607
		BTSS 	STATUS,2 		//00EA 	1D03
		LJUMP 	F8H 			//00EB 	38F8
		ORG		00ECH
		LDWI 	2H 			//00EC 	2A02

		//;MAIN.C: 278: eepromWriteByte(0x02,0);
		CLRR 	72H 			//00ED 	0172
		LCALL 	402H 			//00EE 	3402
		LDWI 	5H 			//00EF 	2A05

		//;MAIN.C: 279: eepromWriteByte(0x05,0);
		CLRR 	72H 			//00F0 	0172
		LCALL 	402H 			//00F1 	3402
		LDWI 	4H 			//00F2 	2A04

		//;MAIN.C: 280: eepromWriteByte(0x04,0);
		CLRR 	72H 			//00F3 	0172
		ORG		00F4H
		LCALL 	402H 			//00F4 	3402
		LDWI 	3H 			//00F5 	2A03

		//;MAIN.C: 281: eepromWriteByte(0x03,0);
		CLRR 	72H 			//00F6 	0172
		LCALL 	402H 			//00F7 	3402
		LDWI 	0H 			//00F8 	2A00

		//;MAIN.C: 282: }
		//;MAIN.C: 283: setState(0,0);
		CLRR 	72H 			//00F9 	0172
		CLRR 	73H 			//00FA 	0173
		LCALL 	5C2H 			//00FB 	35C2
		ORG		00FCH
		LDWI 	AH 			//00FC 	2A0A

		//;MAIN.C: 284: beep(10,1);
		CLRR 	75H 			//00FD 	0175
		INCR	75H,1 			//00FE 	09F5
		LCALL 	4A4H 			//00FF 	34A4

		//;MAIN.C: 285: }
		LJUMP 	199H 			//0100 	3999

		//;MAIN.C: 287: else if(idop==1)
		DECRSZ 	58H,0 		//0101 	0E58
		LJUMP 	199H 			//0102 	3999

		//;MAIN.C: 288: {
		//;MAIN.C: 290: id_clear(2,5);
		LDWI 	5H 			//0103 	2A05
		ORG		0104H
		STR 	43H 			//0104 	01C3
		LDWI 	2H 			//0105 	2A02
		LCALL 	446H 			//0106 	3446
		LDWI 	3H 			//0107 	2A03

		//;MAIN.C: 291: setState(3,0);
		CLRR 	72H 			//0108 	0172
		CLRR 	73H 			//0109 	0173
		LCALL 	5C2H 			//010A 	35C2
		LDWI 	3H 			//010B 	2A03
		ORG		010CH

		//;MAIN.C: 292: tmp=1;
		CLRR 	59H 			//010C 	0159
		INCR	59H,1 			//010D 	09D9

		//;MAIN.C: 293: beep(10,3);
		STR 	75H 			//010E 	01F5
		LDWI 	AH 			//010F 	2A0A
		LCALL 	4A4H 			//0110 	34A4
		LJUMP 	199H 			//0111 	3999

		//;MAIN.C: 299: if(idop<=5 && idop!=1 ){
		LDWI 	6H 			//0112 	2A06
		SUBWR 	58H,0 			//0113 	0C58
		ORG		0114H
		BTSC 	STATUS,0 		//0114 	1403
		LJUMP 	199H 			//0115 	3999
		DECR 	58H,0 			//0116 	0D58
		BTSC 	STATUS,2 		//0117 	1503
		LJUMP 	199H 			//0118 	3999

		//;MAIN.C: 300: if(eepromReadByte(0x01)==1){
		LDWI 	1H 			//0119 	2A01
		LCALL 	5E1H 			//011A 	35E1
		XORWI 	1H 			//011B 	2601
		ORG		011CH
		BTSS 	STATUS,2 		//011C 	1D03
		LJUMP 	199H 			//011D 	3999
		LDWI 	1H 			//011E 	2A01

		//;MAIN.C: 301: eepromWriteByte(0x01,0);
		CLRR 	72H 			//011F 	0172
		LCALL 	402H 			//0120 	3402

		//;MAIN.C: 302: beep(10,2);
		LDWI 	2H 			//0121 	2A02
		STR 	75H 			//0122 	01F5
		LDWI 	AH 			//0123 	2A0A
		ORG		0124H
		LCALL 	4A4H 			//0124 	34A4
		LJUMP 	199H 			//0125 	3999

		//;MAIN.C: 313: if(idop==1 && idState == 0){
		DECRSZ 	58H,0 		//0126 	0E58
		LJUMP 	13AH 			//0127 	393A
		LDR 	57H,1 			//0128 	08D7
		BTSS 	STATUS,2 		//0129 	1D03
		LJUMP 	13AH 			//012A 	393A

		//;MAIN.C: 315: id_clear(2,5);
		LDWI 	5H 			//012B 	2A05
		ORG		012CH
		STR 	43H 			//012C 	01C3
		LDWI 	2H 			//012D 	2A02
		LCALL 	446H 			//012E 	3446
		LDWI 	3H 			//012F 	2A03

		//;MAIN.C: 316: setState(3,0);
		CLRR 	72H 			//0130 	0172
		CLRR 	73H 			//0131 	0173
		LCALL 	5C2H 			//0132 	35C2
		LDWI 	3H 			//0133 	2A03
		ORG		0134H

		//;MAIN.C: 317: tmp=1;
		CLRR 	59H 			//0134 	0159
		INCR	59H,1 			//0135 	09D9

		//;MAIN.C: 318: beep(10,3);
		STR 	75H 			//0136 	01F5
		LDWI 	AH 			//0137 	2A0A
		LCALL 	4A4H 			//0138 	34A4

		//;MAIN.C: 319: }
		LJUMP 	199H 			//0139 	3999

		//;MAIN.C: 321: else if(idop==2 && idState == 0){
		LDR 	58H,0 			//013A 	0858
		XORWI 	2H 			//013B 	2602
		ORG		013CH
		BTSS 	STATUS,2 		//013C 	1D03
		LJUMP 	199H 			//013D 	3999
		LDR 	57H,1 			//013E 	08D7
		BTSS 	STATUS,2 		//013F 	1D03
		LJUMP 	199H 			//0140 	3999

		//;MAIN.C: 323: id_clear(3,5);
		LDWI 	5H 			//0141 	2A05
		STR 	43H 			//0142 	01C3
		LDWI 	3H 			//0143 	2A03
		ORG		0144H
		LCALL 	446H 			//0144 	3446
		LDWI 	5H 			//0145 	2A05

		//;MAIN.C: 324: setState(5,0);
		CLRR 	72H 			//0146 	0172
		CLRR 	73H 			//0147 	0173
		LCALL 	5C2H 			//0148 	35C2

		//;MAIN.C: 325: tmp=2;
		LDWI 	2H 			//0149 	2A02
		STR 	59H 			//014A 	01D9

		//;MAIN.C: 326: beep(10,2);
		STR 	75H 			//014B 	01F5
		ORG		014CH
		LDWI 	AH 			//014C 	2A0A
		LCALL 	4A4H 			//014D 	34A4
		LJUMP 	199H 			//014E 	3999

		//;MAIN.C: 332: if (idState == 0){
		LDR 	57H,1 			//014F 	08D7
		BTSS 	STATUS,2 		//0150 	1D03
		LJUMP 	169H 			//0151 	3969

		//;MAIN.C: 339: if( idop !=1){
		DECR 	58H,0 			//0152 	0D58
		BTSC 	STATUS,2 		//0153 	1503
		ORG		0154H
		LJUMP 	199H 			//0154 	3999
		LDWI 	6H 			//0155 	2A06

		//;MAIN.C: 340: tmp++;
		INCR	59H,1 			//0156 	09D9

		//;MAIN.C: 342: if(tmp <=5){
		SUBWR 	59H,0 			//0157 	0C59
		BTSC 	STATUS,0 		//0158 	1403
		LJUMP 	199H 			//0159 	3999

		//;MAIN.C: 343: id_replate(tmp,keyID,buffTag);
		LDWI 	60H 			//015A 	2A60
		STR 	3FH 			//015B 	01BF
		ORG		015CH
		LDWI 	26H 			//015C 	2A26
		STR 	40H 			//015D 	01C0
		LDR 	59H,0 			//015E 	0859
		LCALL 	379H 			//015F 	3379
		LDWI 	AH 			//0160 	2A0A

		//;MAIN.C: 344: timeTick=0;
		BCR 	STATUS,5 		//0161 	1283
		BCR 	STATUS,6 		//0162 	1303
		CLRR 	5CH 			//0163 	015C
		ORG		0164H
		CLRR 	5DH 			//0164 	015D
		CLRR 	75H 			//0165 	0175
		INCR	75H,1 			//0166 	09F5
		LCALL 	4A4H 			//0167 	34A4
		LJUMP 	199H 			//0168 	3999
		LDWI 	AH 			//0169 	2A0A

		//;MAIN.C: 351: beep(10,1);
		CLRR 	75H 			//016A 	0175
		INCR	75H,1 			//016B 	09F5
		ORG		016CH
		LCALL 	4A4H 			//016C 	34A4
		LJUMP 	199H 			//016D 	3999

		//;MAIN.C: 357: if(idState == 0){
		LDR 	57H,1 			//016E 	08D7
		BTSS 	STATUS,2 		//016F 	1D03
		LJUMP 	189H 			//0170 	3989

		//;MAIN.C: 358: if( idop >2){
		LDWI 	3H 			//0171 	2A03
		SUBWR 	58H,0 			//0172 	0C58
		BTSS 	STATUS,0 		//0173 	1C03
		ORG		0174H
		LJUMP 	199H 			//0174 	3999
		LDWI 	6H 			//0175 	2A06

		//;MAIN.C: 359: tmp++;
		INCR	59H,1 			//0176 	09D9

		//;MAIN.C: 361: if(tmp <=5){
		SUBWR 	59H,0 			//0177 	0C59
		BTSC 	STATUS,0 		//0178 	1403
		LJUMP 	199H 			//0179 	3999

		//;MAIN.C: 362: id_replate(tmp,keyID,buffTag);
		LDWI 	60H 			//017A 	2A60
		STR 	3FH 			//017B 	01BF
		ORG		017CH
		LDWI 	26H 			//017C 	2A26
		STR 	40H 			//017D 	01C0
		LDR 	59H,0 			//017E 	0859
		LCALL 	379H 			//017F 	3379
		LDWI 	AH 			//0180 	2A0A

		//;MAIN.C: 363: timeTick=0;
		BCR 	STATUS,5 		//0181 	1283
		BCR 	STATUS,6 		//0182 	1303
		CLRR 	5CH 			//0183 	015C
		ORG		0184H
		CLRR 	5DH 			//0184 	015D
		CLRR 	75H 			//0185 	0175
		INCR	75H,1 			//0186 	09F5
		LCALL 	4A4H 			//0187 	34A4
		LJUMP 	199H 			//0188 	3999
		LDWI 	AH 			//0189 	2A0A

		//;MAIN.C: 370: beep(10,1);
		CLRR 	75H 			//018A 	0175
		INCR	75H,1 			//018B 	09F5
		ORG		018CH
		LCALL 	4A4H 			//018C 	34A4
		LJUMP 	199H 			//018D 	3999
		LDR 	5FH,0 			//018E 	085F
		STR 	FSR 			//018F 	0184
		LDWI 	8H 			//0190 	2A08
		SUBWR 	FSR,0 			//0191 	0C04
		BTSC 	STATUS,0 		//0192 	1403
		LJUMP 	199H 			//0193 	3999
		ORG		0194H
		LDWI 	5H 			//0194 	2A05
		STR 	PCLATH 			//0195 	018A
		LDWI 	EAH 			//0196 	2AEA
		ADDWR 	FSR,0 			//0197 	0B04
		STR 	PCL 			//0198 	0182
		LDWI 	9FH 			//0199 	2A9F

		//;MAIN.C: 395: idState = 1;
		BCR 	STATUS,5 		//019A 	1283
		BCR 	STATUS,6 		//019B 	1303
		ORG		019CH
		CLRR 	57H 			//019C 	0157
		INCR	57H,1 			//019D 	09D7

		//;MAIN.C: 396: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	54H 			//019E 	01D4
		LDWI 	6FH 			//019F 	2A6F
		STR 	53H 			//01A0 	01D3
		DECRSZ 	53H,1 		//01A1 	0ED3
		LJUMP 	1A1H 			//01A2 	39A1
		DECRSZ 	54H,1 		//01A3 	0ED4
		ORG		01A4H
		LJUMP 	1A1H 			//01A4 	39A1
		LJUMP 	1A6H 			//01A5 	39A6

		//;MAIN.C: 397: }
		LJUMP 	1B4H 			//01A6 	39B4
		LDWI 	2H 			//01A7 	2A02

		//;MAIN.C: 398: else{
		//;MAIN.C: 399: idState =0;
		CLRR 	57H 			//01A8 	0157

		//;MAIN.C: 400: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	55H 			//01A9 	01D5
		LDWI 	86H 			//01AA 	2A86
		STR 	54H 			//01AB 	01D4
		ORG		01ACH
		LDWI 	99H 			//01AC 	2A99
		STR 	53H 			//01AD 	01D3
		DECRSZ 	53H,1 		//01AE 	0ED3
		LJUMP 	1AEH 			//01AF 	39AE
		DECRSZ 	54H,1 		//01B0 	0ED4
		LJUMP 	1AEH 			//01B1 	39AE
		DECRSZ 	55H,1 		//01B2 	0ED5
		LJUMP 	1AEH 			//01B3 	39AE
		ORG		01B4H

		//;MAIN.C: 401: }
		//;MAIN.C: 405: if((timeOut!=0)&&( timeTick > timeOut)){
		BCR 	STATUS,5 		//01B4 	1283
		BCR 	STATUS,6 		//01B5 	1303
		LDR 	5BH,0 			//01B6 	085B
		IORWR 	5AH,0 			//01B7 	035A
		BTSC 	STATUS,2 		//01B8 	1503
		LJUMP 	20BH 			//01B9 	3A0B
		LDR 	5DH,0 			//01BA 	085D
		SUBWR 	5BH,0 			//01BB 	0C5B
		ORG		01BCH
		BTSS 	STATUS,2 		//01BC 	1D03
		LJUMP 	1C0H 			//01BD 	39C0
		LDR 	5CH,0 			//01BE 	085C
		SUBWR 	5AH,0 			//01BF 	0C5A
		BTSS 	STATUS,0 		//01C0 	1C03
		LJUMP 	1FDH 			//01C1 	39FD
		LJUMP 	20BH 			//01C2 	3A0B

		//;MAIN.C: 410: setState(2,80);
		LDWI 	50H 			//01C3 	2A50
		ORG		01C4H
		STR 	72H 			//01C4 	01F2
		LDWI 	2H 			//01C5 	2A02
		CLRR 	73H 			//01C6 	0173
		LCALL 	5C2H 			//01C7 	35C2

		//;MAIN.C: 411: buzFre=0x6a;
		LDWI 	6AH 			//01C8 	2A6A
		STR 	25H 			//01C9 	01A5

		//;MAIN.C: 412: break;
		LJUMP 	20BH 			//01CA 	3A0B

		//;MAIN.C: 414: setState(6,35);
		LDWI 	23H 			//01CB 	2A23
		ORG		01CCH
		STR 	72H 			//01CC 	01F2
		LDWI 	6H 			//01CD 	2A06
		CLRR 	73H 			//01CE 	0173
		LCALL 	5C2H 			//01CF 	35C2

		//;MAIN.C: 415: break;
		LJUMP 	20BH 			//01D0 	3A0B
		LDWI 	2H 			//01D1 	2A02

		//;MAIN.C: 417: setState(2,0);
		CLRR 	72H 			//01D2 	0172
		CLRR 	73H 			//01D3 	0173
		ORG		01D4H
		LCALL 	5C2H 			//01D4 	35C2

		//;MAIN.C: 418: buzFre=0x6a;
		LDWI 	6AH 			//01D5 	2A6A
		STR 	25H 			//01D6 	01A5

		//;MAIN.C: 419: eepromWriteByte(0x00,7);
		LDWI 	7H 			//01D7 	2A07
		STR 	72H 			//01D8 	01F2
		LDWI 	0H 			//01D9 	2A00
		LCALL 	402H 			//01DA 	3402
		LDWI 	2H 			//01DB 	2A02
		ORG		01DCH

		//;MAIN.C: 420: eepromWriteByte(0x02,0);
		CLRR 	72H 			//01DC 	0172
		LCALL 	402H 			//01DD 	3402

		//;MAIN.C: 421: break;
		LJUMP 	20BH 			//01DE 	3A0B

		//;MAIN.C: 422: case 7:
		//;MAIN.C: 424: if(RC1==1){
		BTSS 	7H,1 			//01DF 	1C87
		LJUMP 	20BH 			//01E0 	3A0B
		LDWI 	2H 			//01E1 	2A02

		//;MAIN.C: 425: PwInNum++;
		INCR	5EH,1 			//01E2 	09DE

		//;MAIN.C: 426: tmp = eepromReadByte(0x02);
		LCALL 	5E1H 			//01E3 	35E1
		ORG		01E4H
		BCR 	STATUS,5 		//01E4 	1283
		STR 	59H 			//01E5 	01D9

		//;MAIN.C: 427: if(tmp>0&&tmp<4){
		LDR 	59H,0 			//01E6 	0859
		BTSC 	STATUS,2 		//01E7 	1503
		LJUMP 	1F3H 			//01E8 	39F3
		LDWI 	4H 			//01E9 	2A04
		SUBWR 	59H,0 			//01EA 	0C59
		BTSC 	STATUS,0 		//01EB 	1403
		ORG		01ECH
		LJUMP 	1F3H 			//01EC 	39F3

		//;MAIN.C: 428: tmp--;
		DECR 	59H,1 			//01ED 	0DD9

		//;MAIN.C: 429: eepromWriteByte(0x03+tmp,PwInNum);
		LDR 	5EH,0 			//01EE 	085E
		STR 	72H 			//01EF 	01F2
		LDR 	59H,0 			//01F0 	0859
		ADDWI 	3H 			//01F1 	2703
		LCALL 	402H 			//01F2 	3402
		LDWI 	AH 			//01F3 	2A0A
		ORG		01F4H

		//;MAIN.C: 430: }
		//;MAIN.C: 432: beep(10,1);
		CLRR 	75H 			//01F4 	0175
		INCR	75H,1 			//01F5 	09F5
		LCALL 	4A4H 			//01F6 	34A4

		//;MAIN.C: 433: setState(7,10);
		LDWI 	AH 			//01F7 	2A0A
		STR 	72H 			//01F8 	01F2
		LDWI 	7H 			//01F9 	2A07
		CLRR 	73H 			//01FA 	0173
		LCALL 	5C2H 			//01FB 	35C2
		ORG		01FCH
		LJUMP 	20BH 			//01FC 	3A0B
		LDR 	5FH,0 			//01FD 	085F
		XORWI 	1H 			//01FE 	2601
		BTSC 	STATUS,2 		//01FF 	1503
		LJUMP 	1C3H 			//0200 	39C3
		XORWI 	3H 			//0201 	2603
		BTSC 	STATUS,2 		//0202 	1503
		LJUMP 	1CBH 			//0203 	39CB
		ORG		0204H
		XORWI 	4H 			//0204 	2604
		BTSC 	STATUS,2 		//0205 	1503
		LJUMP 	1D1H 			//0206 	39D1
		XORWI 	1H 			//0207 	2601
		BTSC 	STATUS,2 		//0208 	1503
		LJUMP 	1DFH 			//0209 	39DF
		LJUMP 	20BH 			//020A 	3A0B

		//;MAIN.C: 451: }
		//;MAIN.C: 454: if(mtState==0) RA3 = 1;
		BCR 	STATUS,5 		//020B 	1283
		ORG		020CH
		BCR 	STATUS,6 		//020C 	1303
		LDR 	5FH,1 			//020D 	08DF
		BTSS 	STATUS,2 		//020E 	1D03
		LJUMP 	212H 			//020F 	3A12
		BSR 	5H,3 			//0210 	1985
		LJUMP 	213H 			//0211 	3A13

		//;MAIN.C: 455: else RA3 =0;
		BCR 	5H,3 			//0212 	1185

		//;MAIN.C: 462: if(mtState == 2) {
		LDR 	5FH,0 			//0213 	085F
		ORG		0214H
		XORWI 	2H 			//0214 	2602
		BTSS 	STATUS,2 		//0215 	1D03
		LJUMP 	226H 			//0216 	3A26

		//;MAIN.C: 464: TMR1ON = 1;T0IE = 1;
		BSR 	10H,0 			//0217 	1810
		BSR 	INTCON,5 		//0218 	1A8B

		//;MAIN.C: 465: if(timeTick%4 ==0){
		LDR 	5CH,0 			//0219 	085C
		ANDWI 	3H 			//021A 	2403
		BTSS 	STATUS,2 		//021B 	1D03
		ORG		021CH
		LJUMP 	228H 			//021C 	3A28

		//;MAIN.C: 467: if(buzFre==0x6a){
		LDR 	25H,0 			//021D 	0825
		XORWI 	6AH 			//021E 	266A
		BTSS 	STATUS,2 		//021F 	1D03
		LJUMP 	223H 			//0220 	3A23

		//;MAIN.C: 468: buzFre=12;
		LDWI 	CH 			//0221 	2A0C
		LJUMP 	224H 			//0222 	3A24

		//;MAIN.C: 469: }else{
		//;MAIN.C: 470: buzFre=0x6a;
		LDWI 	6AH 			//0223 	2A6A
		ORG		0224H
		STR 	25H 			//0224 	01A5
		LJUMP 	228H 			//0225 	3A28
		BCR 	10H,0 			//0226 	1010
		BCR 	INTCON,5 		//0227 	128B

		//;MAIN.C: 477: timeTick++;
		INCR	5CH,1 			//0228 	09DC
		BTSC 	STATUS,2 		//0229 	1503
		INCR	5DH,1 			//022A 	09DD
		LJUMP 	B9H 			//022B 	38B9
		ORG		022CH
		LDWI 	10H 			//022C 	2A10

		//;rfid125.c: 23: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 24: unsigned int timeOutVal;
		//;rfid125.c: 25: unsigned char i,ii,j;
		//;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 27: unsigned char even_row, even_col;
		//;rfid125.c: 30: flag_RFID_syn = 0;
		CLRR 	4AH 			//022D 	014A

		//;rfid125.c: 33: i=16;
		STR 	4EH 			//022E 	01CE

		//;rfid125.c: 35: {
		//;rfid125.c: 36: timeOutVal=timerOut(1,600);
		LDWI 	58H 			//022F 	2A58
		STR 	72H 			//0230 	01F2
		LDWI 	2H 			//0231 	2A02
		STR 	73H 			//0232 	01F3
		LDWI 	1H 			//0233 	2A01
		ORG		0234H
		LCALL 	425H 			//0234 	3425

		//;rfid125.c: 37: if(timeOutVal==0) return 0;
		LCALL 	362H 			//0235 	3362
		BTSC 	STATUS,2 		//0236 	1503
		RETW 	0H 			//0237 	2100

		//;rfid125.c: 39: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//0238 	2A58
		LCALL 	375H 			//0239 	3375
		LCALL 	425H 			//023A 	3425

		//;rfid125.c: 40: if(timeOutVal==0) return 0;
		LCALL 	362H 			//023B 	3362
		ORG		023CH
		BTSC 	STATUS,2 		//023C 	1503
		RETW 	0H 			//023D 	2100
		LDWI 	1H 			//023E 	2A01

		//;rfid125.c: 42: i--;
		DECR 	4EH,1 			//023F 	0DCE

		//;rfid125.c: 43: }
		//;rfid125.c: 44: while(timeOutVal<290 && i>0);
		SUBWR 	51H,0 			//0240 	0C51
		LDWI 	22H 			//0241 	2A22
		BTSC 	STATUS,2 		//0242 	1503
		SUBWR 	50H,0 			//0243 	0C50
		ORG		0244H
		BTSC 	STATUS,0 		//0244 	1403
		LJUMP 	249H 			//0245 	3A49
		LDR 	4EH,1 			//0246 	08CE
		BTSS 	STATUS,2 		//0247 	1D03
		LJUMP 	22FH 			//0248 	3A2F

		//;rfid125.c: 45: flag_RFID_last = 1;
		CLRR 	4FH 			//0249 	014F
		INCR	4FH,1 			//024A 	09CF

		//;rfid125.c: 46: i = 0;
		CLRR 	4EH 			//024B 	014E
		ORG		024CH

		//;rfid125.c: 47: while(i<64)
		LDWI 	40H 			//024C 	2A40
		SUBWR 	4EH,0 			//024D 	0C4E
		BTSC 	STATUS,0 		//024E 	1403
		LJUMP 	2A5H 			//024F 	3AA5

		//;rfid125.c: 48: {
		//;rfid125.c: 49: for(ii=0;ii<9;ii++)
		CLRR 	52H 			//0250 	0152

		//;rfid125.c: 50: {
		//;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	36FH 			//0251 	336F
		LCALL 	425H 			//0252 	3425

		//;rfid125.c: 52: if(timeOutVal==0) return 0;
		LCALL 	362H 			//0253 	3362
		ORG		0254H
		BTSC 	STATUS,2 		//0254 	1503
		RETW 	0H 			//0255 	2100

		//;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4FH,1 			//0256 	08CF
		BTSS 	STATUS,2 		//0257 	1D03
		LJUMP 	260H 			//0258 	3A60
		LDWI 	1H 			//0259 	2A01
		SUBWR 	51H,0 			//025A 	0C51
		LDWI 	23H 			//025B 	2A23
		ORG		025CH
		BTSC 	STATUS,2 		//025C 	1503
		SUBWR 	50H,0 			//025D 	0C50
		BTSS 	STATUS,0 		//025E 	1C03
		LJUMP 	269H 			//025F 	3A69
		DECRSZ 	4FH,0 		//0260 	0E4F
		LJUMP 	277H 			//0261 	3A77
		LDWI 	1H 			//0262 	2A01
		SUBWR 	51H,0 			//0263 	0C51
		ORG		0264H
		LDWI 	23H 			//0264 	2A23
		BTSC 	STATUS,2 		//0265 	1503
		SUBWR 	50H,0 			//0266 	0C50
		BTSS 	STATUS,0 		//0267 	1C03
		LJUMP 	277H 			//0268 	3A77

		//;rfid125.c: 56: {
		//;rfid125.c: 57: if(!flag_RFID_last)
		LDR 	4FH,1 			//0269 	08CF
		BTSS 	STATUS,2 		//026A 	1D03
		LJUMP 	274H 			//026B 	3A74
		ORG		026CH

		//;rfid125.c: 58: {
		//;rfid125.c: 59: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//026C 	2A22
		STR 	72H 			//026D 	01F2
		LDWI 	1H 			//026E 	2A01
		STR 	73H 			//026F 	01F3
		LCALL 	425H 			//0270 	3425

		//;rfid125.c: 60: if(timeOutVal==0) return 0;
		LCALL 	362H 			//0271 	3362
		BTSC 	STATUS,2 		//0272 	1503
		RETW 	0H 			//0273 	2100
		ORG		0274H

		//;rfid125.c: 61: }
		//;rfid125.c: 62: flag_RFID_last = 0;
		CLRR 	4FH 			//0274 	014F

		//;rfid125.c: 63: i++;
		INCR	4EH,1 			//0275 	09CE

		//;rfid125.c: 64: }
		LJUMP 	29AH 			//0276 	3A9A

		//;rfid125.c: 65: else
		//;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4FH,1 			//0277 	08CF
		BTSS 	STATUS,2 		//0278 	1D03
		LJUMP 	281H 			//0279 	3A81
		LDWI 	1H 			//027A 	2A01
		SUBWR 	51H,0 			//027B 	0C51
		ORG		027CH
		LDWI 	23H 			//027C 	2A23
		BTSC 	STATUS,2 		//027D 	1503
		SUBWR 	50H,0 			//027E 	0C50
		BTSC 	STATUS,0 		//027F 	1403
		LJUMP 	28AH 			//0280 	3A8A
		DECRSZ 	4FH,0 		//0281 	0E4F
		LJUMP 	29AH 			//0282 	3A9A
		LDWI 	1H 			//0283 	2A01
		ORG		0284H
		SUBWR 	51H,0 			//0284 	0C51
		LDWI 	23H 			//0285 	2A23
		BTSC 	STATUS,2 		//0286 	1503
		SUBWR 	50H,0 			//0287 	0C50
		BTSC 	STATUS,0 		//0288 	1403
		LJUMP 	29AH 			//0289 	3A9A

		//;rfid125.c: 68: {
		//;rfid125.c: 69: if(flag_RFID_last)
		LDR 	4FH,0 			//028A 	084F
		BTSC 	STATUS,2 		//028B 	1503
		ORG		028CH
		LJUMP 	296H 			//028C 	3A96

		//;rfid125.c: 70: {
		//;rfid125.c: 71: timeOutVal=timerOut(0,290);
		LDWI 	22H 			//028D 	2A22
		STR 	72H 			//028E 	01F2
		LDWI 	1H 			//028F 	2A01
		STR 	73H 			//0290 	01F3
		LDWI 	0H 			//0291 	2A00
		LCALL 	425H 			//0292 	3425

		//;rfid125.c: 72: if(timeOutVal==0) return 0;
		LCALL 	362H 			//0293 	3362
		ORG		0294H
		BTSC 	STATUS,2 		//0294 	1503
		RETW 	0H 			//0295 	2100

		//;rfid125.c: 73: }
		//;rfid125.c: 74: flag_RFID_last = 1;
		CLRR 	4FH 			//0296 	014F
		INCR	4FH,1 			//0297 	09CF

		//;rfid125.c: 75: i++;
		INCR	4EH,1 			//0298 	09CE

		//;rfid125.c: 77: break;
		LJUMP 	29FH 			//0299 	3A9F
		LDWI 	9H 			//029A 	2A09
		INCR	52H,1 			//029B 	09D2
		ORG		029CH
		SUBWR 	52H,0 			//029C 	0C52
		BTSS 	STATUS,0 		//029D 	1C03
		LJUMP 	251H 			//029E 	3A51

		//;rfid125.c: 78: }
		//;rfid125.c: 80: }
		//;rfid125.c: 81: if(9==ii)
		LDR 	52H,0 			//029F 	0852
		XORWI 	9H 			//02A0 	2609
		BTSS 	STATUS,2 		//02A1 	1D03
		LJUMP 	24CH 			//02A2 	3A4C

		//;rfid125.c: 82: {
		//;rfid125.c: 83: flag_RFID_syn = 1;
		CLRR 	4AH 			//02A3 	014A
		ORG		02A4H
		INCR	4AH,1 			//02A4 	09CA

		//;rfid125.c: 84: break;
		//;rfid125.c: 85: }
		//;rfid125.c: 86: }
		//;rfid125.c: 88: if(!flag_RFID_syn)
		LDR 	4AH,1 			//02A5 	08CA
		BTSC 	STATUS,2 		//02A6 	1503
		RETW 	0H 			//02A7 	2100

		//;rfid125.c: 91: }
		//;rfid125.c: 92: for(ii=0;ii<55;ii++)
		CLRR 	52H 			//02A8 	0152

		//;rfid125.c: 93: {
		//;rfid125.c: 94: i = ii/5;
		LDWI 	5H 			//02A9 	2A05
		STR 	72H 			//02AA 	01F2
		LDR 	52H,0 			//02AB 	0852
		ORG		02ACH
		LCALL 	4DCH 			//02AC 	34DC
		STR 	4EH 			//02AD 	01CE

		//;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	36FH 			//02AE 	336F
		LCALL 	425H 			//02AF 	3425

		//;rfid125.c: 96: if(timeOutVal==0) return 0;
		LCALL 	362H 			//02B0 	3362
		BTSC 	STATUS,2 		//02B1 	1503
		RETW 	0H 			//02B2 	2100

		//;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4FH,1 			//02B3 	08CF
		ORG		02B4H
		BTSS 	STATUS,2 		//02B4 	1D03
		LJUMP 	2BDH 			//02B5 	3ABD
		LDWI 	1H 			//02B6 	2A01
		SUBWR 	51H,0 			//02B7 	0C51
		LDWI 	23H 			//02B8 	2A23
		BTSC 	STATUS,2 		//02B9 	1503
		SUBWR 	50H,0 			//02BA 	0C50
		BTSS 	STATUS,0 		//02BB 	1C03
		ORG		02BCH
		LJUMP 	2C6H 			//02BC 	3AC6
		DECRSZ 	4FH,0 		//02BD 	0E4F
		LJUMP 	2D8H 			//02BE 	3AD8
		LDWI 	1H 			//02BF 	2A01
		SUBWR 	51H,0 			//02C0 	0C51
		LDWI 	23H 			//02C1 	2A23
		BTSC 	STATUS,2 		//02C2 	1503
		SUBWR 	50H,0 			//02C3 	0C50
		ORG		02C4H
		BTSS 	STATUS,0 		//02C4 	1C03
		LJUMP 	2D8H 			//02C5 	3AD8

		//;rfid125.c: 100: {
		//;rfid125.c: 101: if(!flag_RFID_last)
		LDR 	4FH,1 			//02C6 	08CF
		BTSS 	STATUS,2 		//02C7 	1D03
		LJUMP 	2D1H 			//02C8 	3AD1

		//;rfid125.c: 102: {
		//;rfid125.c: 103: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//02C9 	2A22
		STR 	72H 			//02CA 	01F2
		LDWI 	1H 			//02CB 	2A01
		ORG		02CCH
		STR 	73H 			//02CC 	01F3
		LCALL 	425H 			//02CD 	3425

		//;rfid125.c: 104: if(timeOutVal==0) return 0;
		LCALL 	362H 			//02CE 	3362
		BTSC 	STATUS,2 		//02CF 	1503
		RETW 	0H 			//02D0 	2100

		//;rfid125.c: 105: }
		//;rfid125.c: 106: flag_RFID_last = 0;
		CLRR 	4FH 			//02D1 	014F

		//;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
		LCALL 	368H 			//02D2 	3368

		//;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
		LDR 	4EH,0 			//02D3 	084E
		ORG		02D4H
		ADDWI 	3FH 			//02D4 	273F
		STR 	FSR 			//02D5 	0184
		BSR 	INDF,0 			//02D6 	1800

		//;rfid125.c: 109: }
		LJUMP 	2F7H 			//02D7 	3AF7

		//;rfid125.c: 110: else
		//;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4FH,1 			//02D8 	08CF
		BTSS 	STATUS,2 		//02D9 	1D03
		LJUMP 	2E2H 			//02DA 	3AE2
		LDWI 	1H 			//02DB 	2A01
		ORG		02DCH
		SUBWR 	51H,0 			//02DC 	0C51
		LDWI 	23H 			//02DD 	2A23
		BTSC 	STATUS,2 		//02DE 	1503
		SUBWR 	50H,0 			//02DF 	0C50
		BTSC 	STATUS,0 		//02E0 	1403
		LJUMP 	2EBH 			//02E1 	3AEB
		DECRSZ 	4FH,0 		//02E2 	0E4F
		LJUMP 	2F7H 			//02E3 	3AF7
		ORG		02E4H
		LDWI 	1H 			//02E4 	2A01
		SUBWR 	51H,0 			//02E5 	0C51
		LDWI 	23H 			//02E6 	2A23
		BTSC 	STATUS,2 		//02E7 	1503
		SUBWR 	50H,0 			//02E8 	0C50
		BTSC 	STATUS,0 		//02E9 	1403
		LJUMP 	2F7H 			//02EA 	3AF7

		//;rfid125.c: 113: {
		//;rfid125.c: 114: if(flag_RFID_last)
		LDR 	4FH,0 			//02EB 	084F
		ORG		02ECH
		BTSC 	STATUS,2 		//02EC 	1503
		LJUMP 	2F4H 			//02ED 	3AF4

		//;rfid125.c: 115: {
		//;rfid125.c: 116: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//02EE 	2A58
		LCALL 	375H 			//02EF 	3375
		LCALL 	425H 			//02F0 	3425

		//;rfid125.c: 117: if(timeOutVal==0) return 0;
		LCALL 	362H 			//02F1 	3362
		BTSC 	STATUS,2 		//02F2 	1503
		RETW 	0H 			//02F3 	2100
		ORG		02F4H

		//;rfid125.c: 118: }
		//;rfid125.c: 119: flag_RFID_last = 1;
		CLRR 	4FH 			//02F4 	014F
		INCR	4FH,1 			//02F5 	09CF

		//;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
		LCALL 	368H 			//02F6 	3368
		LDWI 	37H 			//02F7 	2A37
		INCR	52H,1 			//02F8 	09D2
		SUBWR 	52H,0 			//02F9 	0C52
		BTSS 	STATUS,0 		//02FA 	1C03
		LJUMP 	2A9H 			//02FB 	3AA9
		ORG		02FCH

		//;rfid125.c: 121: }
		//;rfid125.c: 122: }
		//;rfid125.c: 123: if(55==ii)
		LDR 	52H,0 			//02FC 	0852
		XORWI 	37H 			//02FD 	2637
		BTSS 	STATUS,2 		//02FE 	1D03
		RETW 	0H 			//02FF 	2100

		//;rfid125.c: 124: {
		//;rfid125.c: 125: even_col = 0;
		CLRR 	4BH 			//0300 	014B

		//;rfid125.c: 126: for(ii=0;ii<10;ii++)
		CLRR 	52H 			//0301 	0152

		//;rfid125.c: 127: {
		//;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	52H,0 			//0302 	0852
		ADDWI 	3FH 			//0303 	273F
		ORG		0304H
		STR 	FSR 			//0304 	0184
		BCR 	STATUS,7 		//0305 	1383
		LDR 	INDF,0 			//0306 	0800
		STR 	4CH 			//0307 	01CC
		LDWI 	1H 			//0308 	2A01
		ANDWR 	4CH,1 			//0309 	02CC

		//;rfid125.c: 129: for(j=1;j<5;j++)
		CLRR 	4DH 			//030A 	014D
		INCR	4DH,1 			//030B 	09CD
		ORG		030CH

		//;rfid125.c: 130: {
		//;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	52H,0 			//030C 	0852
		ADDWI 	3FH 			//030D 	273F
		STR 	FSR 			//030E 	0184
		LDR 	INDF,0 			//030F 	0800
		STR 	77H 			//0310 	01F7
		INCR	4DH,0 			//0311 	094D
		LJUMP 	315H 			//0312 	3B15
		BCR 	STATUS,0 		//0313 	1003
		ORG		0314H
		RRR	77H,1 			//0314 	06F7
		ADDWI 	FFH 			//0315 	27FF
		BTSS 	STATUS,2 		//0316 	1D03
		LJUMP 	313H 			//0317 	3B13
		LDR 	77H,0 			//0318 	0877
		ANDWI 	1H 			//0319 	2401
		XORWR 	4CH,1 			//031A 	04CC
		LDWI 	5H 			//031B 	2A05
		ORG		031CH
		INCR	4DH,1 			//031C 	09CD
		SUBWR 	4DH,0 			//031D 	0C4D
		BTSS 	STATUS,0 		//031E 	1C03
		LJUMP 	30CH 			//031F 	3B0C

		//;rfid125.c: 132: }
		//;rfid125.c: 133: if(even_row & 0x01)
		BTSC 	4CH,0 			//0320 	144C
		RETW 	0H 			//0321 	2100

		//;rfid125.c: 136: }
		//;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
		LDR 	52H,0 			//0322 	0852
		ADDWI 	3FH 			//0323 	273F
		ORG		0324H
		STR 	FSR 			//0324 	0184
		RLR 	INDF,1 			//0325 	0580
		RLR 	INDF,1 			//0326 	0580
		RLR 	INDF,0 			//0327 	0500
		ANDWI 	F8H 			//0328 	24F8
		STR 	INDF 			//0329 	0180

		//;rfid125.c: 140: i = RF_serial_55bits[ii];
		LDR 	52H,0 			//032A 	0852
		ADDWI 	3FH 			//032B 	273F
		ORG		032CH
		STR 	FSR 			//032C 	0184
		LDR 	INDF,0 			//032D 	0800
		STR 	4EH 			//032E 	01CE

		//;rfid125.c: 141: if( 0==ii%2 )
		BTSC 	52H,0 			//032F 	1452
		LJUMP 	33EH 			//0330 	3B3E

		//;rfid125.c: 142: {
		//;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0331 	1003
		RRR	52H,0 			//0332 	0652
		ADDWI 	60H 			//0333 	2760
		ORG		0334H
		STR 	FSR 			//0334 	0184
		LDR 	4EH,0 			//0335 	084E
		STR 	INDF 			//0336 	0180
		BCR 	STATUS,0 		//0337 	1003
		RRR	52H,0 			//0338 	0652
		ADDWI 	60H 			//0339 	2760
		STR 	FSR 			//033A 	0184
		LDWI 	F0H 			//033B 	2AF0
		ORG		033CH
		ANDWR 	INDF,1 		//033C 	0280

		//;rfid125.c: 144: }
		LJUMP 	348H 			//033D 	3B48
		LDWI 	FH 			//033E 	2A0F

		//;rfid125.c: 145: else
		//;rfid125.c: 146: {
		//;rfid125.c: 147: i >>=4;
		SWAPR 	4EH,1 			//033F 	07CE
		ANDWR 	4EH,1 			//0340 	02CE

		//;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0341 	1003
		RRR	52H,0 			//0342 	0652
		ADDWI 	60H 			//0343 	2760
		ORG		0344H
		STR 	FSR 			//0344 	0184
		LDR 	4EH,0 			//0345 	084E
		ANDWI 	FH 			//0346 	240F
		IORWR 	INDF,1 		//0347 	0380

		//;rfid125.c: 149: }
		//;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
		LDR 	52H,0 			//0348 	0852
		ADDWI 	3FH 			//0349 	273F
		STR 	FSR 			//034A 	0184
		LDR 	INDF,0 			//034B 	0800
		ORG		034CH
		XORWR 	4BH,1 			//034C 	04CB
		LDWI 	AH 			//034D 	2A0A
		INCR	52H,1 			//034E 	09D2
		SUBWR 	52H,0 			//034F 	0C52
		BTSS 	STATUS,0 		//0350 	1C03
		LJUMP 	302H 			//0351 	3B02

		//;rfid125.c: 151: }
		//;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
		RLR 	49H,1 			//0352 	05C9
		RLR 	49H,1 			//0353 	05C9
		ORG		0354H
		RLR 	49H,0 			//0354 	0549
		ANDWI 	F8H 			//0355 	24F8
		STR 	49H 			//0356 	01C9
		LDWI 	F0H 			//0357 	2AF0

		//;rfid125.c: 153: keyID[0] =0x00;
		CLRR 	60H 			//0358 	0160

		//;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4BH,0 			//0359 	024B
		STR 	77H 			//035A 	01F7
		LDR 	49H,0 			//035B 	0849
		ORG		035CH
		ANDWI 	F0H 			//035C 	24F0
		XORWR 	77H,0 			//035D 	0477
		BTSC 	STATUS,2 		//035E 	1503
		BTSC 	49H,3 			//035F 	15C9
		RETW 	0H 			//0360 	2100

		//;rfid125.c: 155: {
		//;rfid125.c: 157: return 1;
		RETW 	1H 			//0361 	2101
		LDR 	73H,0 			//0362 	0873
		STR 	51H 			//0363 	01D1
		ORG		0364H
		LDR 	72H,0 			//0364 	0872
		STR 	50H 			//0365 	01D0
		IORWR 	51H,0 			//0366 	0351
		RET		 					//0367 	0004
		LDR 	4EH,0 			//0368 	084E
		ADDWI 	3FH 			//0369 	273F
		STR 	FSR 			//036A 	0184
		BCR 	STATUS,7 		//036B 	1383
		ORG		036CH
		BCR 	STATUS,0 		//036C 	1003
		RLR 	INDF,1 			//036D 	0580
		RET		 					//036E 	0004
		LDWI 	58H 			//036F 	2A58
		STR 	72H 			//0370 	01F2
		LDWI 	2H 			//0371 	2A02
		STR 	73H 			//0372 	01F3
		LDR 	4FH,0 			//0373 	084F
		ORG		0374H
		RET		 					//0374 	0004
		STR 	72H 			//0375 	01F2
		LDWI 	2H 			//0376 	2A02
		STR 	73H 			//0377 	01F3
		RETW 	0H 			//0378 	2100
		STR 	7BH 			//0379 	01FB

		//;MAIN.C: 133: id=(id-1)*5;
		LDWI 	5H 			//037A 	2A05
		STR 	72H 			//037B 	01F2
		ORG		037CH
		LDR 	7BH,0 			//037C 	087B
		ADDWI 	FFH 			//037D 	27FF
		LCALL 	59AH 			//037E 	359A
		STR 	7BH 			//037F 	01FB

		//;MAIN.C: 134: {
		//;MAIN.C: 135: {
		//;MAIN.C: 136: *(buff+id) = *Cont;
		LDR 	3FH,0 			//0380 	083F
		STR 	FSR 			//0381 	0184
		BCR 	STATUS,7 		//0382 	1383
		LDR 	INDF,0 			//0383 	0800
		ORG		0384H
		STR 	41H 			//0384 	01C1
		LDR 	7BH,0 			//0385 	087B
		ADDWR 	40H,0 			//0386 	0B40
		STR 	42H 			//0387 	01C2
		STR 	FSR 			//0388 	0184
		LDR 	41H,0 			//0389 	0841
		STR 	INDF 			//038A 	0180

		//;MAIN.C: 137: *(buff+1+id) = *(Cont+1);
		LDR 	3FH,0 			//038B 	083F
		ORG		038CH
		ADDWI 	1H 			//038C 	2701
		LCALL 	3ADH 			//038D 	33AD
		ADDWI 	1H 			//038E 	2701
		STR 	FSR 			//038F 	0184
		LDR 	41H,0 			//0390 	0841
		STR 	INDF 			//0391 	0180

		//;MAIN.C: 138: *(buff+2+id) = *(Cont+2);
		LDR 	3FH,0 			//0392 	083F
		ADDWI 	2H 			//0393 	2702
		ORG		0394H
		LCALL 	3ADH 			//0394 	33AD
		ADDWI 	2H 			//0395 	2702
		STR 	FSR 			//0396 	0184
		LDR 	41H,0 			//0397 	0841
		STR 	INDF 			//0398 	0180

		//;MAIN.C: 139: *(buff+3+id) = *(Cont+3);
		LDR 	3FH,0 			//0399 	083F
		ADDWI 	3H 			//039A 	2703
		LCALL 	3ADH 			//039B 	33AD
		ORG		039CH
		ADDWI 	3H 			//039C 	2703
		STR 	FSR 			//039D 	0184
		LDR 	41H,0 			//039E 	0841
		STR 	INDF 			//039F 	0180

		//;MAIN.C: 140: *(buff+4+id) = *(Cont+4);
		LDR 	3FH,0 			//03A0 	083F
		ADDWI 	4H 			//03A1 	2704
		LCALL 	3ADH 			//03A2 	33AD
		ADDWI 	4H 			//03A3 	2704
		ORG		03A4H
		STR 	FSR 			//03A4 	0184
		LDR 	41H,0 			//03A5 	0841
		STR 	INDF 			//03A6 	0180

		//;MAIN.C: 141: }
		//;MAIN.C: 142: }
		//;MAIN.C: 144: eepromWriteBlock(0x06,buffTag,25);
		LDWI 	26H 			//03A7 	2A26
		STR 	76H 			//03A8 	01F6
		LDWI 	19H 			//03A9 	2A19
		STR 	77H 			//03AA 	01F7
		LDWI 	6H 			//03AB 	2A06
		ORG		03ACH
		LJUMP 	526H 			//03AC 	3D26
		STR 	FSR 			//03AD 	0184
		LDR 	INDF,0 			//03AE 	0800
		STR 	41H 			//03AF 	01C1
		LDR 	7BH,0 			//03B0 	087B
		ADDWR 	40H,0 			//03B1 	0B40
		STR 	42H 			//03B2 	01C2
		RET		 					//03B3 	0004
		ORG		03B4H
		STR 	73H 			//03B4 	01F3
		LDWI 	8AH 			//03B5 	2A8A

		//;SWUART.C: 14: unsigned char i;
		//;SWUART.C: 16: RA2 = 0;
		BCR 	STATUS,5 		//03B6 	1283
		BCR 	STATUS,6 		//03B7 	1303
		BCR 	5H,2 			//03B8 	1105

		//;SWUART.C: 18: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
		STR 	72H 			//03B9 	01F2
		DECRSZ 	72H,1 		//03BA 	0EF2
		LJUMP 	3BAH 			//03BB 	3BBA
		ORG		03BCH
		CLRWDT	 			//03BC 	0001

		//;SWUART.C: 19: for(i=0;i<8;i++){
		CLRR 	74H 			//03BD 	0174

		//;SWUART.C: 20: RA2 = (dat&1);
		BTSS 	73H,0 			//03BE 	1C73
		LJUMP 	3C4H 			//03BF 	3BC4
		BCR 	STATUS,5 		//03C0 	1283
		BCR 	STATUS,6 		//03C1 	1303
		BSR 	5H,2 			//03C2 	1905
		LJUMP 	3C7H 			//03C3 	3BC7
		ORG		03C4H
		BCR 	STATUS,5 		//03C4 	1283
		BCR 	STATUS,6 		//03C5 	1303
		BCR 	5H,2 			//03C6 	1105
		LDWI 	8AH 			//03C7 	2A8A

		//;SWUART.C: 21: dat=dat>>1;
		BCR 	STATUS,0 		//03C8 	1003
		RRR	73H,1 			//03C9 	06F3

		//;SWUART.C: 23: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
		STR 	72H 			//03CA 	01F2
		DECRSZ 	72H,1 		//03CB 	0EF2
		ORG		03CCH
		LJUMP 	3CBH 			//03CC 	3BCB
		CLRWDT	 			//03CD 	0001
		LDWI 	8H 			//03CE 	2A08
		INCR	74H,1 			//03CF 	09F4
		SUBWR 	74H,0 			//03D0 	0C74
		BTSS 	STATUS,0 		//03D1 	1C03
		LJUMP 	3BEH 			//03D2 	3BBE
		LDWI 	8AH 			//03D3 	2A8A
		ORG		03D4H

		//;SWUART.C: 24: }
		//;SWUART.C: 29: RA2 = 1;
		BCR 	STATUS,5 		//03D4 	1283
		BCR 	STATUS,6 		//03D5 	1303
		BSR 	5H,2 			//03D6 	1905

		//;SWUART.C: 31: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
		STR 	72H 			//03D7 	01F2
		DECRSZ 	72H,1 		//03D8 	0EF2
		LJUMP 	3D8H 			//03D9 	3BD8
		CLRWDT	 			//03DA 	0001
		RET		 					//03DB 	0004
		ORG		03DCH
		STR 	79H 			//03DC 	01F9

		//;SWUART.C: 43: unsigned char nib = num>>4;
		SWAPR 	79H,0 			//03DD 	0779
		ANDWI 	FH 			//03DE 	240F
		STR 	7AH 			//03DF 	01FA

		//;SWUART.C: 44: swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
		LDWI 	AH 			//03E0 	2A0A
		SUBWR 	7AH,0 			//03E1 	0C7A
		LDR 	7AH,0 			//03E2 	087A
		STR 	75H 			//03E3 	01F5
		ORG		03E4H
		BTSS 	STATUS,0 		//03E4 	1C03
		LJUMP 	3E8H 			//03E5 	3BE8
		LDWI 	37H 			//03E6 	2A37
		LJUMP 	3E9H 			//03E7 	3BE9
		LDWI 	30H 			//03E8 	2A30
		CLRR 	76H 			//03E9 	0176
		ADDWR 	75H,1 			//03EA 	0BF5
		BTSC 	STATUS,0 		//03EB 	1403
		ORG		03ECH
		INCR	76H,1 			//03EC 	09F6
		LDR 	75H,0 			//03ED 	0875
		LCALL 	3B4H 			//03EE 	33B4

		//;SWUART.C: 45: nib = num&0x0f;
		LDR 	79H,0 			//03EF 	0879
		STR 	7AH 			//03F0 	01FA
		LDWI 	FH 			//03F1 	2A0F
		ANDWR 	7AH,1 			//03F2 	02FA

		//;SWUART.C: 46: swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
		LDWI 	AH 			//03F3 	2A0A
		ORG		03F4H
		SUBWR 	7AH,0 			//03F4 	0C7A
		LDR 	7AH,0 			//03F5 	087A
		STR 	77H 			//03F6 	01F7
		BTSS 	STATUS,0 		//03F7 	1C03
		LJUMP 	3FBH 			//03F8 	3BFB
		LDWI 	37H 			//03F9 	2A37
		LJUMP 	3FCH 			//03FA 	3BFC
		LDWI 	30H 			//03FB 	2A30
		ORG		03FCH
		CLRR 	78H 			//03FC 	0178
		ADDWR 	77H,1 			//03FD 	0BF7
		BTSC 	STATUS,0 		//03FE 	1403
		INCR	78H,1 			//03FF 	09F8
		LDR 	77H,0 			//0400 	0877
		LJUMP 	3B4H 			//0401 	3BB4
		STR 	75H 			//0402 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//0403 	138B
		ORG		0404H

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0404 	1F8B
		LJUMP 	408H 			//0405 	3C08
		CLRWDT	 			//0406 	0001
		LJUMP 	404H 			//0407 	3C04

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//0408 	0875
		BSR 	STATUS,5 		//0409 	1A83
		BCR 	STATUS,6 		//040A 	1303
		STR 	1BH 			//040B 	019B
		ORG		040CH

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//040C 	0872
		STR 	1AH 			//040D 	019A
		LDWI 	34H 			//040E 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//040F 	1283
		BCR 	CH,7 			//0410 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//0411 	1A83
		STR 	1CH 			//0412 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//0413 	181D
		ORG		0414H

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0414 	1A83
		BCR 	STATUS,6 		//0415 	1303
		BTSS 	1DH,0 			//0416 	1C1D
		LJUMP 	41AH 			//0417 	3C1A
		CLRWDT	 			//0418 	0001
		LJUMP 	414H 			//0419 	3C14

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//041A 	2A06
		STR 	74H 			//041B 	01F4
		ORG		041CH
		LDWI 	30H 			//041C 	2A30
		STR 	73H 			//041D 	01F3
		DECRSZ 	73H,1 		//041E 	0EF3
		LJUMP 	41EH 			//041F 	3C1E
		DECRSZ 	74H,1 		//0420 	0EF4
		LJUMP 	41EH 			//0421 	3C1E
		CLRWDT	 			//0422 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//0423 	1B8B
		ORG		0424H
		RET		 					//0424 	0004
		STR 	74H 			//0425 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: TMR1ON = 0;
		BCR 	10H,0 			//0426 	1010

		//;rfid125.c: 9: TMR1H = 0;
		CLRR 	FH 			//0427 	010F

		//;rfid125.c: 10: TMR1L = 0;
		CLRR 	EH 			//0428 	010E

		//;rfid125.c: 11: TMR1IF = 0;
		BCR 	CH,0 			//0429 	100C

		//;rfid125.c: 12: TMR1ON = 1;
		BSR 	10H,0 			//042A 	1810

		//;rfid125.c: 13: while(RA4==Logic){
		LDWI 	0H 			//042B 	2A00
		ORG		042CH
		BTSC 	5H,4 			//042C 	1605
		LDWI 	1H 			//042D 	2A01
		XORWR 	74H,0 			//042E 	0474
		BTSS 	STATUS,2 		//042F 	1D03
		LJUMP 	441H 			//0430 	3C41

		//;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
		LDR 	FH,0 			//0431 	080F
		STR 	76H 			//0432 	01F6
		CLRR 	75H 			//0433 	0175
		ORG		0434H
		LDR 	EH,0 			//0434 	080E
		IORWR 	75H,1 			//0435 	03F5

		//;rfid125.c: 15: if(CurTimer>time)
		LDR 	76H,0 			//0436 	0876
		SUBWR 	73H,0 			//0437 	0C73
		BTSS 	STATUS,2 		//0438 	1D03
		LJUMP 	43CH 			//0439 	3C3C
		LDR 	75H,0 			//043A 	0875
		SUBWR 	72H,0 			//043B 	0C72
		ORG		043CH
		BTSC 	STATUS,0 		//043C 	1403
		LJUMP 	42BH 			//043D 	3C2B

		//;rfid125.c: 16: return 0;
		CLRR 	72H 			//043E 	0172
		CLRR 	73H 			//043F 	0173
		RET		 					//0440 	0004

		//;rfid125.c: 17: }
		//;rfid125.c: 18: return CurTimer;
		LDR 	76H,0 			//0441 	0876
		STR 	73H 			//0442 	01F3
		LDR 	75H,0 			//0443 	0875
		ORG		0444H
		STR 	72H 			//0444 	01F2
		RET		 					//0445 	0004
		STR 	49H 			//0446 	01C9

		//;MAIN.C: 147: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
		LDWI 	44H 			//0447 	2A44
		STR 	FSR 			//0448 	0184
		LDR 	20H,0 			//0449 	0820
		BCR 	STATUS,7 		//044A 	1383
		STR 	INDF 			//044B 	0180
		ORG		044CH
		INCR	FSR,1 			//044C 	0984
		LDR 	21H,0 			//044D 	0821
		STR 	INDF 			//044E 	0180
		INCR	FSR,1 			//044F 	0984
		LDR 	22H,0 			//0450 	0822
		STR 	INDF 			//0451 	0180
		INCR	FSR,1 			//0452 	0984
		LDR 	23H,0 			//0453 	0823
		ORG		0454H
		STR 	INDF 			//0454 	0180
		INCR	FSR,1 			//0455 	0984
		LDR 	24H,0 			//0456 	0824
		STR 	INDF 			//0457 	0180
		LDR 	49H,0 			//0458 	0849
		SUBWR 	43H,0 			//0459 	0C43
		BTSS 	STATUS,0 		//045A 	1C03
		RET		 					//045B 	0004
		ORG		045CH

		//;MAIN.C: 149: id_replate(idMin,tmp,buffTag);
		LDWI 	44H 			//045C 	2A44
		STR 	3FH 			//045D 	01BF
		LDWI 	26H 			//045E 	2A26
		STR 	40H 			//045F 	01C0
		LDR 	49H,0 			//0460 	0849
		LCALL 	379H 			//0461 	3379
		BCR 	STATUS,5 		//0462 	1283
		BCR 	STATUS,6 		//0463 	1303
		ORG		0464H
		INCR	49H,1 			//0464 	09C9
		LJUMP 	458H 			//0465 	3C58
		RETW 	FFH 			//0466 	21FF
		RETW 	FFH 			//0467 	21FF
		RETW 	FFH 			//0468 	21FF
		RETW 	FFH 			//0469 	21FF
		RETW 	FFH 			//046A 	21FF
		RETW 	CH 			//046B 	210C
		ORG		046CH
		RETW 	0H 			//046C 	2100
		RETW 	0H 			//046D 	2100
		RETW 	11H 			//046E 	2111
		RETW 	BH 			//046F 	210B
		RETW 	4FH 			//0470 	214F
		RETW 	0H 			//0471 	2100
		RETW 	0H 			//0472 	2100
		RETW 	81H 			//0473 	2181
		ORG		0474H
		RETW 	2FH 			//0474 	212F
		RETW 	22H 			//0475 	2122
		RETW 	0H 			//0476 	2100
		RETW 	0H 			//0477 	2100
		RETW 	7DH 			//0478 	217D
		RETW 	67H 			//0479 	2167
		RETW 	5H 			//047A 	2105
		RETW 	0H 			//047B 	2100
		ORG		047CH
		RETW 	0H 			//047C 	2100
		RETW 	7EH 			//047D 	217E
		RETW 	31H 			//047E 	2131
		RETW 	E7H 			//047F 	21E7
		RETW 	0H 			//0480 	2100
		RETW 	0H 			//0481 	2100
		RETW 	7EH 			//0482 	217E
		RETW 	51H 			//0483 	2151
		ORG		0484H
		RETW 	E6H 			//0484 	21E6
		STR 	78H 			//0485 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//0486 	0873
		XORWR 	74H,0 			//0487 	0474
		BTSS 	STATUS,2 		//0488 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//0489 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//048A 	0179
		LDR 	73H,0 			//048B 	0873
		ORG		048CH
		SUBWR 	79H,0 			//048C 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//048D 	0879
		BTSC 	STATUS,0 		//048E 	1403
		LJUMP 	4A0H 			//048F 	3CA0
		ADDWR 	72H,0 			//0490 	0B72
		STR 	75H 			//0491 	01F5
		STR 	FSR 			//0492 	0184
		BCR 	STATUS,7 		//0493 	1383
		ORG		0494H
		LDR 	INDF,0 			//0494 	0800
		STR 	76H 			//0495 	01F6
		LDR 	79H,0 			//0496 	0879
		ADDWR 	78H,0 			//0497 	0B78
		STR 	77H 			//0498 	01F7
		STR 	FSR 			//0499 	0184
		LDR 	INDF,0 			//049A 	0800
		XORWR 	76H,0 			//049B 	0476
		ORG		049CH
		BTSS 	STATUS,2 		//049C 	1D03
		RETW 	0H 			//049D 	2100
		INCR	79H,1 			//049E 	09F9
		LJUMP 	48BH 			//049F 	3C8B

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//04A0 	0473
		BTSC 	STATUS,2 		//04A1 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//04A2 	2101
		RETW 	0H 			//04A3 	2100
		ORG		04A4H
		STR 	76H 			//04A4 	01F6

		//;MAIN.C: 46: TMR1ON = 1;T0IE = 1;
		BCR 	STATUS,5 		//04A5 	1283
		BCR 	STATUS,6 		//04A6 	1303
		BSR 	10H,0 			//04A7 	1810
		BSR 	INTCON,5 		//04A8 	1A8B

		//;MAIN.C: 48: while(rep--){
		DECR 	75H,1 			//04A9 	0DF5
		LDR 	75H,0 			//04AA 	0875
		XORWI 	FFH 			//04AB 	26FF
		ORG		04ACH
		BTSC 	STATUS,2 		//04AC 	1503
		LJUMP 	4BEH 			//04AD 	3CBE
		LDWI 	2AH 			//04AE 	2A2A

		//;MAIN.C: 49: TMR1ON = 1;T0IE = 1;
		BCR 	STATUS,5 		//04AF 	1283
		BCR 	STATUS,6 		//04B0 	1303
		BSR 	10H,0 			//04B1 	1810
		BSR 	INTCON,5 		//04B2 	1A8B

		//;MAIN.C: 50: buzFre=42;
		STR 	25H 			//04B3 	01A5
		ORG		04B4H

		//;MAIN.C: 51: delay_x10ms(delay);
		LDR 	76H,0 			//04B4 	0876
		LCALL 	56CH 			//04B5 	356C
		LDWI 	14H 			//04B6 	2A14

		//;MAIN.C: 52: T0IE = 0;
		BCR 	INTCON,5 		//04B7 	128B

		//;MAIN.C: 53: TMR1ON = 0;RC0 =0;
		BCR 	STATUS,5 		//04B8 	1283
		BCR 	STATUS,6 		//04B9 	1303
		BCR 	10H,0 			//04BA 	1010
		BCR 	7H,0 			//04BB 	1007
		ORG		04BCH

		//;MAIN.C: 54: delay_x10ms(20);
		LCALL 	56CH 			//04BC 	356C
		LJUMP 	4A9H 			//04BD 	3CA9

		//;MAIN.C: 55: }
		//;MAIN.C: 57: T0IE = 0;
		BCR 	INTCON,5 		//04BE 	128B
		RET		 					//04BF 	0004
		BCR 	STATUS,5 		//04C0 	1283
		BCR 	STATUS,6 		//04C1 	1303
		STR 	3FH 			//04C2 	01BF

		//;MAIN.C: 125: unsigned char i;
		//;MAIN.C: 126: for(i=0;i<21;i+=5){
		CLRR 	40H 			//04C3 	0140
		ORG		04C4H

		//;MAIN.C: 127: if(comArr(id_input,buff+i,5,5))
		LDR 	40H,0 			//04C4 	0840
		ADDWR 	7AH,0 			//04C5 	0B7A
		STR 	72H 			//04C6 	01F2
		LDWI 	5H 			//04C7 	2A05
		STR 	73H 			//04C8 	01F3
		STR 	74H 			//04C9 	01F4
		LDR 	3FH,0 			//04CA 	083F
		LCALL 	485H 			//04CB 	3485
		ORG		04CCH
		XORWI 	0H 			//04CC 	2600

		//;MAIN.C: 128: return i/5 +1;
		LDWI 	5H 			//04CD 	2A05
		BTSC 	STATUS,2 		//04CE 	1503
		LJUMP 	4D6H 			//04CF 	3CD6
		STR 	72H 			//04D0 	01F2
		LDR 	40H,0 			//04D1 	0840
		LCALL 	4DCH 			//04D2 	34DC
		STR 	7BH 			//04D3 	01FB
		ORG		04D4H
		INCR	7BH,0 			//04D4 	097B
		RET		 					//04D5 	0004
		ADDWR 	40H,1 			//04D6 	0BC0
		LDWI 	15H 			//04D7 	2A15
		SUBWR 	40H,0 			//04D8 	0C40
		BTSC 	STATUS,0 		//04D9 	1403

		//;MAIN.C: 129: }
		//;MAIN.C: 130: return 255;
		RETW 	FFH 			//04DA 	21FF
		LJUMP 	4C4H 			//04DB 	3CC4
		ORG		04DCH
		STR 	73H 			//04DC 	01F3
		CLRR 	75H 			//04DD 	0175
		LDR 	72H,0 			//04DE 	0872
		BTSC 	STATUS,2 		//04DF 	1503
		LJUMP 	4F5H 			//04E0 	3CF5
		CLRR 	74H 			//04E1 	0174
		INCR	74H,1 			//04E2 	09F4
		BTSC 	72H,7 			//04E3 	17F2
		ORG		04E4H
		LJUMP 	4E8H 			//04E4 	3CE8
		BCR 	STATUS,0 		//04E5 	1003
		RLR 	72H,1 			//04E6 	05F2
		LJUMP 	4E2H 			//04E7 	3CE2
		BCR 	STATUS,0 		//04E8 	1003
		RLR 	75H,1 			//04E9 	05F5
		LDR 	72H,0 			//04EA 	0872
		SUBWR 	73H,0 			//04EB 	0C73
		ORG		04ECH
		BTSS 	STATUS,0 		//04EC 	1C03
		LJUMP 	4F2H 			//04ED 	3CF2
		LDR 	72H,0 			//04EE 	0872
		SUBWR 	73H,1 			//04EF 	0CF3
		BSR 	75H,0 			//04F0 	1875
		BCR 	STATUS,0 		//04F1 	1003
		RRR	72H,1 			//04F2 	06F2
		DECRSZ 	74H,1 		//04F3 	0EF4
		ORG		04F4H
		LJUMP 	4E8H 			//04F4 	3CE8
		LDR 	75H,0 			//04F5 	0875
		RET		 					//04F6 	0004

		//;ms82_pwm.c: 12: TRISC |= 0b00000100;
		BSR 	7H,2 			//04F7 	1907

		//;ms82_pwm.c: 13: PR2 = 15;
		LDWI 	FH 			//04F8 	2A0F
		STR 	12H 			//04F9 	0192

		//;ms82_pwm.c: 14: EPWMR1L =0;
		BCR 	STATUS,5 		//04FA 	1283
		CLRR 	13H 			//04FB 	0113
		ORG		04FCH

		//;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
		LDWI 	9CH 			//04FC 	2A9C
		STR 	15H 			//04FD 	0195

		//;ms82_pwm.c: 16: TMR2 = 0;
		CLRR 	11H 			//04FE 	0111
		LDWI 	4H 			//04FF 	2A04

		//;ms82_pwm.c: 17: TMR2IF = 0;
		BCR 	CH,1 			//0500 	108C

		//;ms82_pwm.c: 18: T2CON = 0B00000100;
		STR 	12H 			//0501 	0192

		//;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
		BCR 	STATUS,5 		//0502 	1283
		BCR 	STATUS,6 		//0503 	1303
		ORG		0504H
		BTSS 	CH,1 			//0504 	1C8C
		LJUMP 	508H 			//0505 	3D08
		CLRWDT	 			//0506 	0001
		LJUMP 	502H 			//0507 	3D02

		//;ms82_pwm.c: 20: PWM1CON = 0b00010000;
		LDWI 	10H 			//0508 	2A10
		STR 	16H 			//0509 	0196

		//;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
		LDWI 	88H 			//050A 	2A88
		BSR 	STATUS,5 		//050B 	1A83
		ORG		050CH
		STR 	10H 			//050C 	0190

		//;ms82_pwm.c: 22: TRISC &= 0b11111011;
		BCR 	7H,2 			//050D 	1107
		RET		 					//050E 	0004
		LDWI 	3FH 			//050F 	2A3F
		CLRR 	5AH 			//0510 	015A
		CLRR 	5BH 			//0511 	015B
		CLRR 	5CH 			//0512 	015C
		CLRR 	5DH 			//0513 	015D
		ORG		0514H
		CLRR 	5EH 			//0514 	015E
		CLRR 	5FH 			//0515 	015F
		CLRR 	60H 			//0516 	0160
		CLRR 	61H 			//0517 	0161
		CLRR 	62H 			//0518 	0162
		CLRR 	63H 			//0519 	0163
		CLRR 	64H 			//051A 	0164
		BCR 	STATUS,7 		//051B 	1383
		ORG		051CH
		STR 	7DH 			//051C 	01FD
		LDWI 	4H 			//051D 	2A04
		STR 	7EH 			//051E 	01FE
		LDWI 	66H 			//051F 	2A66
		STR 	7FH 			//0520 	01FF
		LDWI 	20H 			//0521 	2A20
		STR 	FSR 			//0522 	0184
		LCALL 	580H 			//0523 	3580
		ORG		0524H
		CLRR 	STATUS 			//0524 	0103
		LJUMP 	0BH 			//0525 	380B
		STR 	79H 			//0526 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//0527 	017A
		LDR 	77H,0 			//0528 	0877
		SUBWR 	7AH,0 			//0529 	0C7A
		BTSC 	STATUS,0 		//052A 	1403
		RET		 					//052B 	0004
		ORG		052CH

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//052C 	087A
		ADDWR 	76H,0 			//052D 	0B76
		STR 	78H 			//052E 	01F8
		STR 	FSR 			//052F 	0184
		BCR 	STATUS,7 		//0530 	1383
		LDR 	INDF,0 			//0531 	0800
		STR 	72H 			//0532 	01F2
		LDR 	7AH,0 			//0533 	087A
		ORG		0534H
		ADDWR 	79H,0 			//0534 	0B79
		LCALL 	402H 			//0535 	3402
		INCR	7AH,1 			//0536 	09FA
		LJUMP 	528H 			//0537 	3D28

		//;sysinit.c: 71: INTCON = 0B00000000;
		CLRR 	INTCON 			//0538 	010B

		//;sysinit.c: 72: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//0539 	1A83
		CLRR 	CH 			//053A 	010C

		//;sysinit.c: 73: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//053B 	1283
		ORG		053CH
		CLRR 	CH 			//053C 	010C

		//;sysinit.c: 85: T0IF = 0;
		BCR 	INTCON,2 		//053D 	110B

		//;sysinit.c: 86: T0IE = 0;
		BCR 	INTCON,5 		//053E 	128B

		//;sysinit.c: 87: TMR1ON = 0;
		BCR 	10H,0 			//053F 	1010

		//;sysinit.c: 89: TMR2IF = 0;
		BCR 	CH,1 			//0540 	108C

		//;sysinit.c: 90: TMR2IE = 0;
		BSR 	STATUS,5 		//0541 	1A83
		BCR 	CH,1 			//0542 	108C

		//;sysinit.c: 93: TMR1IF = 0;
		BCR 	STATUS,5 		//0543 	1283
		ORG		0544H
		BCR 	CH,0 			//0544 	100C

		//;sysinit.c: 94: TMR1IE = 0;
		BSR 	STATUS,5 		//0545 	1A83
		BCR 	CH,0 			//0546 	100C

		//;sysinit.c: 96: PEIE = 0;
		BCR 	INTCON,6 		//0547 	130B

		//;sysinit.c: 98: GIE = 1;
		BSR 	INTCON,7 		//0548 	1B8B
		RET		 					//0549 	0004
		STR 	77H 			//054A 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//054B 	0178
		ORG		054CH
		LDR 	75H,0 			//054C 	0875
		SUBWR 	78H,0 			//054D 	0C78
		BTSC 	STATUS,0 		//054E 	1403
		RET		 					//054F 	0004

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//0550 	0878
		ADDWR 	74H,0 			//0551 	0B74
		STR 	76H 			//0552 	01F6
		STR 	FSR 			//0553 	0184
		ORG		0554H
		LDR 	78H,0 			//0554 	0878
		ADDWR 	77H,0 			//0555 	0B77
		LCALL 	5E1H 			//0556 	35E1
		BCR 	STATUS,7 		//0557 	1383
		STR 	INDF 			//0558 	0180
		INCR	78H,1 			//0559 	09F8
		LJUMP 	54CH 			//055A 	3D4C

		//;MAIN.C: 87: if(T0IE&&T0IF)
		BTSC 	INTCON,5 		//055B 	168B
		ORG		055CH
		BTSS 	INTCON,2 		//055C 	1D0B
		LJUMP 	565H 			//055D 	3D65

		//;MAIN.C: 88: {
		//;MAIN.C: 89: T0IF = 0;
		BCR 	INTCON,2 		//055E 	110B

		//;MAIN.C: 90: TMR0 = buzFre;
		BCR 	STATUS,5 		//055F 	1283
		BCR 	STATUS,6 		//0560 	1303
		LDR 	25H,0 			//0561 	0825
		STR 	1H 			//0562 	0181

		//;MAIN.C: 91: RC0 = ~RC0;
		LDWI 	1H 			//0563 	2A01
		ORG		0564H
		XORWR 	7H,1 			//0564 	0487
		LDR 	71H,0 			//0565 	0871
		STR 	PCLATH 			//0566 	018A
		SWAPR 	70H,0 			//0567 	0770
		STR 	STATUS 			//0568 	0183
		SWAPR 	7EH,1 			//0569 	07FE
		SWAPR 	7EH,0 			//056A 	077E
		RETI		 			//056B 	0009
		ORG		056CH
		STR 	74H 			//056C 	01F4

		//;MAIN.C: 42: while(t--)
		DECR 	74H,1 			//056D 	0DF4
		LDR 	74H,0 			//056E 	0874
		XORWI 	FFH 			//056F 	26FF
		BTSC 	STATUS,2 		//0570 	1503
		RET		 					//0571 	0004

		//;MAIN.C: 43: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0572 	2A1A
		STR 	73H 			//0573 	01F3
		ORG		0574H
		LDWI 	F8H 			//0574 	2AF8
		STR 	72H 			//0575 	01F2
		DECRSZ 	72H,1 		//0576 	0EF2
		LJUMP 	576H 			//0577 	3D76
		DECRSZ 	73H,1 		//0578 	0EF3
		LJUMP 	576H 			//0579 	3D76
		CLRWDT	 			//057A 	0001
		LJUMP 	56DH 			//057B 	3D6D
		ORG		057CH
		LDR 	7EH,0 			//057C 	087E
		STR 	PCLATH 			//057D 	018A
		LDR 	7FH,0 			//057E 	087F
		STR 	PCL 			//057F 	0182
		LCALL 	57CH 			//0580 	357C
		STR 	INDF 			//0581 	0180
		INCR	FSR,1 			//0582 	0984
		LDR 	FSR,0 			//0583 	0804
		ORG		0584H
		XORWR 	7DH,0 			//0584 	047D
		BTSC 	STATUS,2 		//0585 	1503
		RETW 	0H 			//0586 	2100
		INCR	7FH,1 			//0587 	09FF
		BTSC 	STATUS,2 		//0588 	1503
		INCR	7EH,1 			//0589 	09FE
		LJUMP 	580H 			//058A 	3D80

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//058B 	1283
		ORG		058CH
		CLRR 	5H 			//058C 	0105

		//;sysinit.c: 35: TRISA = 0B01110011;
		LDWI 	73H 			//058D 	2A73
		BSR 	STATUS,5 		//058E 	1A83
		STR 	5H 			//058F 	0185

		//;sysinit.c: 36: WPUA = 0B10010000;
		LDWI 	90H 			//0590 	2A90
		STR 	15H 			//0591 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0592 	2A02
		BCR 	STATUS,5 		//0593 	1283
		ORG		0594H
		STR 	7H 			//0594 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0595 	2AFE
		BSR 	STATUS,5 		//0596 	1A83
		STR 	7H 			//0597 	0187

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	8H 			//0598 	0108
		RET		 					//0599 	0004
		STR 	74H 			//059A 	01F4
		CLRR 	73H 			//059B 	0173
		ORG		059CH
		LDR 	72H,0 			//059C 	0872
		BTSC 	74H,0 			//059D 	1474
		ADDWR 	73H,1 			//059E 	0BF3
		BCR 	STATUS,0 		//059F 	1003
		RLR 	72H,1 			//05A0 	05F2
		BCR 	STATUS,0 		//05A1 	1003
		RRR	74H,1 			//05A2 	06F4
		LDR 	74H,1 			//05A3 	08F4
		ORG		05A4H
		BTSS 	STATUS,2 		//05A4 	1D03
		LJUMP 	59CH 			//05A5 	3D9C
		LDR 	73H,0 			//05A6 	0873
		RET		 					//05A7 	0004
		LDWI 	5H 			//05A8 	2A05
		STR 	PCLATH 			//05A9 	018A
		LDR 	FSR,0 			//05AA 	0804
		INCR	FSR,1 			//05AB 	0984
		ORG		05ACH
		ADDWR 	PCL,1 			//05AC 	0B82
		RETW 	0H 			//05AD 	2100
		RETW 	AH 			//05AE 	210A
		RETW 	54H 			//05AF 	2154
		RETW 	61H 			//05B0 	2161
		RETW 	67H 			//05B1 	2167
		RETW 	3AH 			//05B2 	213A
		RETW 	20H 			//05B3 	2120
		ORG		05B4H
		RETW 	0H 			//05B4 	2100
		STR 	75H 			//05B5 	01F5

		//;SWUART.C: 36: while(*str){
		LDR 	75H,0 			//05B6 	0875
		STR 	FSR 			//05B7 	0184
		LCALL 	5A8H 			//05B8 	35A8
		IORWI 	0H 			//05B9 	2500
		BTSC 	STATUS,2 		//05BA 	1503
		RET		 					//05BB 	0004
		ORG		05BCH

		//;SWUART.C: 37: swUartSendByte((char)*str);
		LDR 	75H,0 			//05BC 	0875
		STR 	FSR 			//05BD 	0184
		LCALL 	5A8H 			//05BE 	35A8
		LCALL 	3B4H 			//05BF 	33B4

		//;SWUART.C: 38: str++;
		INCR	75H,1 			//05C0 	09F5
		LJUMP 	5B6H 			//05C1 	3DB6
		STR 	74H 			//05C2 	01F4

		//;MAIN.C: 119: mtState = stt;
		BCR 	STATUS,5 		//05C3 	1283
		ORG		05C4H
		BCR 	STATUS,6 		//05C4 	1303
		STR 	5FH 			//05C5 	01DF

		//;MAIN.C: 120: timeTick =0;
		CLRR 	5CH 			//05C6 	015C
		CLRR 	5DH 			//05C7 	015D

		//;MAIN.C: 121: timeOut = _tOut;
		LDR 	73H,0 			//05C8 	0873
		STR 	5BH 			//05C9 	01DB
		LDR 	72H,0 			//05CA 	0872
		STR 	5AH 			//05CB 	01DA
		ORG		05CCH
		RET		 					//05CC 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//05CD 	2A61
		BSR 	STATUS,5 		//05CE 	1A83
		BCR 	STATUS,6 		//05CF 	1303
		STR 	FH 			//05D0 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//05D1 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//05D2 	1A83
		BCR 	STATUS,6 		//05D3 	1303
		ORG		05D4H
		BTSC 	FH,2 			//05D4 	150F
		RET		 					//05D5 	0004
		LJUMP 	5D2H 			//05D6 	3DD2

		//;sysinit.c: 46: OPTION = 0B00000001;
		LDWI 	1H 			//05D7 	2A01
		STR 	1H 			//05D8 	0181

		//;sysinit.c: 59: TMR1H = -5000>>8;
		LDWI 	ECH 			//05D9 	2AEC
		BCR 	STATUS,5 		//05DA 	1283
		STR 	FH 			//05DB 	018F
		ORG		05DCH

		//;sysinit.c: 60: TMR1L = -5000;
		LDWI 	78H 			//05DC 	2A78
		STR 	EH 			//05DD 	018E

		//;sysinit.c: 61: T1CON = 0B00100001;
		LDWI 	21H 			//05DE 	2A21
		STR 	10H 			//05DF 	0190
		RET		 					//05E0 	0004
		STR 	72H 			//05E1 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//05E2 	1A83
		BCR 	STATUS,6 		//05E3 	1303
		ORG		05E4H
		STR 	1BH 			//05E4 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//05E5 	181C

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//05E6 	081A
		STR 	73H 			//05E7 	01F3

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//05E8 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//05E9 	0004
		LJUMP 	112H 			//05EA 	3912
		LJUMP 	D6H 			//05EB 	38D6
		ORG		05ECH
		LJUMP 	D6H 			//05EC 	38D6
		LJUMP 	14FH 			//05ED 	394F
		LJUMP 	199H 			//05EE 	3999
		LJUMP 	16EH 			//05EF 	396E
		LJUMP 	126H 			//05F0 	3926
		LJUMP 	D6H 			//05F1 	38D6
			END
