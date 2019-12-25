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
		LJUMP 	55FH 			//0009 	3D5F
		LJUMP 	513H 			//000A 	3D13
		LDWI 	7H 			//000B 	2A07
		ORG		000CH
		STR 	19H 			//000C 	0199

		//;MAIN.C: 171: unsigned char idop,tmp,idState=0;
		BCR 	STATUS,5 		//000D 	1283
		BCR 	STATUS,6 		//000E 	1303
		CLRR 	57H 			//000F 	0157
		CLRWDT	 			//0010 	0001

		//;MAIN.C: 175: sys_init();
		LCALL 	5D1H 			//0011 	35D1

		//;MAIN.C: 176: gpio_init();
		LCALL 	58FH 			//0012 	358F

		//;MAIN.C: 178: timer_init();
		LCALL 	5DBH 			//0013 	35DB
		ORG		0014H

		//;MAIN.C: 179: int_init();
		LCALL 	53CH 			//0014 	353C

		//;MAIN.C: 185: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0015 	2AAA
		STR 	72H 			//0016 	01F2
		LDWI 	7FH 			//0017 	2A7F
		LCALL 	406H 			//0018 	3406

		//;MAIN.C: 186: eepromWriteByte(0x7F,0xAA);
		LDWI 	AAH 			//0019 	2AAA
		STR 	72H 			//001A 	01F2
		LDWI 	7FH 			//001B 	2A7F
		ORG		001CH
		LCALL 	406H 			//001C 	3406

		//;MAIN.C: 189: TRISC &=0xfe;
		BSR 	STATUS,5 		//001D 	1A83
		BCR 	STATUS,6 		//001E 	1303
		BCR 	7H,0 			//001F 	1007

		//;MAIN.C: 191: SET_EPWM_ON();
		LCALL 	4FBH 			//0020 	34FB

		//;MAIN.C: 195: _delay((unsigned long)((20)*(8000000/4000.0)));
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

		//;MAIN.C: 200: if(eepromReadByte(0x02) == 0xff) eepromWriteByte(0x02,0);
		LDWI 	2H 			//002B 	2A02
		ORG		002CH
		LCALL 	5E5H 			//002C 	35E5
		XORWI 	FFH 			//002D 	26FF
		BTSS 	STATUS,2 		//002E 	1D03
		LJUMP 	33H 			//002F 	3833
		LDWI 	2H 			//0030 	2A02
		CLRR 	72H 			//0031 	0172
		LCALL 	406H 			//0032 	3406

		//;MAIN.C: 201: if(eepromReadByte(0x01)==0xff)eepromWriteByte(0x01,0);
		LDWI 	1H 			//0033 	2A01
		ORG		0034H
		LCALL 	5E5H 			//0034 	35E5
		XORWI 	FFH 			//0035 	26FF
		BTSS 	STATUS,2 		//0036 	1D03
		LJUMP 	3BH 			//0037 	383B
		LDWI 	1H 			//0038 	2A01
		CLRR 	72H 			//0039 	0172
		LCALL 	406H 			//003A 	3406

		//;MAIN.C: 203: if(eepromReadByte(0x06)!=0){
		LDWI 	6H 			//003B 	2A06
		ORG		003CH
		LCALL 	5E5H 			//003C 	35E5
		XORWI 	0H 			//003D 	2600
		BTSC 	STATUS,2 		//003E 	1503
		LJUMP 	52H 			//003F 	3852
		LDWI 	6H 			//0040 	2A06

		//;MAIN.C: 207: eepromWriteByte(0x06,0);
		CLRR 	72H 			//0041 	0172
		LCALL 	406H 			//0042 	3406
		LDWI 	7H 			//0043 	2A07
		ORG		0044H

		//;MAIN.C: 208: eepromWriteByte(0x06+1,0);
		CLRR 	72H 			//0044 	0172
		LCALL 	406H 			//0045 	3406

		//;MAIN.C: 209: eepromWriteByte(0x06+2,0x87);
		LDWI 	87H 			//0046 	2A87
		STR 	72H 			//0047 	01F2
		LDWI 	8H 			//0048 	2A08
		LCALL 	406H 			//0049 	3406

		//;MAIN.C: 210: eepromWriteByte(0x06+3,0x3a);
		LDWI 	3AH 			//004A 	2A3A
		STR 	72H 			//004B 	01F2
		ORG		004CH
		LDWI 	9H 			//004C 	2A09
		LCALL 	406H 			//004D 	3406

		//;MAIN.C: 211: eepromWriteByte(0x06+4,0xf8);
		LDWI 	F8H 			//004E 	2AF8
		STR 	72H 			//004F 	01F2
		LDWI 	AH 			//0050 	2A0A
		LCALL 	406H 			//0051 	3406

		//;MAIN.C: 213: }
		//;MAIN.C: 214: eepromReadBlock(0x06,buffTag,5*5);
		LDWI 	26H 			//0052 	2A26
		STR 	74H 			//0053 	01F4
		ORG		0054H
		LDWI 	19H 			//0054 	2A19
		STR 	75H 			//0055 	01F5
		LDWI 	6H 			//0056 	2A06
		LCALL 	54EH 			//0057 	354E

		//;MAIN.C: 217: {
		//;MAIN.C: 218: if( eepromReadByte(0x00) == 7){
		LDWI 	0H 			//0058 	2A00
		LCALL 	5E5H 			//0059 	35E5
		XORWI 	7H 			//005A 	2607
		BTSS 	STATUS,2 		//005B 	1D03
		ORG		005CH
		LJUMP 	A9H 			//005C 	38A9

		//;MAIN.C: 219: tmp = eepromReadByte(0x02);
		LDWI 	2H 			//005D 	2A02
		LCALL 	5E5H 			//005E 	35E5
		BCR 	STATUS,5 		//005F 	1283
		STR 	59H 			//0060 	01D9

		//;MAIN.C: 220: t1 = tmp;
		STR 	56H 			//0061 	01D6

		//;MAIN.C: 222: if(t1 == 3){
		XORWI 	3H 			//0062 	2603
		BTSS 	STATUS,2 		//0063 	1D03
		ORG		0064H
		LJUMP 	99H 			//0064 	3899

		//;MAIN.C: 227: if((eepromReadByte(0x03)==8) && (eepromReadByte(0x04)==3)&&(eepromReadByte
		//+                          (0x05)==3)){
		LDWI 	3H 			//0065 	2A03
		LCALL 	5E5H 			//0066 	35E5
		XORWI 	8H 			//0067 	2608
		BTSS 	STATUS,2 		//0068 	1D03
		LJUMP 	80H 			//0069 	3880
		LDWI 	4H 			//006A 	2A04
		LCALL 	5E5H 			//006B 	35E5
		ORG		006CH
		XORWI 	3H 			//006C 	2603
		BTSS 	STATUS,2 		//006D 	1D03
		LJUMP 	80H 			//006E 	3880
		LDWI 	5H 			//006F 	2A05
		LCALL 	5E5H 			//0070 	35E5
		XORWI 	3H 			//0071 	2603
		BTSS 	STATUS,2 		//0072 	1D03
		LJUMP 	80H 			//0073 	3880
		ORG		0074H
		LDWI 	1H 			//0074 	2A01

		//;MAIN.C: 228: eepromWriteByte(0x01,1);
		CLRR 	72H 			//0075 	0172
		INCR	72H,1 			//0076 	09F2
		LCALL 	406H 			//0077 	3406
		LDWI 	0H 			//0078 	2A00

		//;MAIN.C: 229: setState(0,0);
		CLRR 	72H 			//0079 	0172
		CLRR 	73H 			//007A 	0173
		LCALL 	5C6H 			//007B 	35C6
		ORG		007CH

		//;MAIN.C: 230: beep(20,2);
		LDWI 	2H 			//007C 	2A02
		STR 	75H 			//007D 	01F5
		LDWI 	14H 			//007E 	2A14
		LJUMP 	88H 			//007F 	3888

		//;MAIN.C: 231: }
		//;MAIN.C: 232: else{
		//;MAIN.C: 233: setState(1,45);
		LDWI 	2DH 			//0080 	2A2D
		STR 	72H 			//0081 	01F2
		LDWI 	1H 			//0082 	2A01
		CLRR 	73H 			//0083 	0173
		ORG		0084H
		LCALL 	5C6H 			//0084 	35C6

		//;MAIN.C: 234: beep(10,5);
		LDWI 	5H 			//0085 	2A05
		STR 	75H 			//0086 	01F5
		LDWI 	AH 			//0087 	2A0A
		LCALL 	4A8H 			//0088 	34A8
		LDWI 	0H 			//0089 	2A00

		//;MAIN.C: 235: }
		//;MAIN.C: 237: eepromWriteByte(0x00,0);
		CLRR 	72H 			//008A 	0172
		LCALL 	406H 			//008B 	3406
		ORG		008CH
		LDWI 	2H 			//008C 	2A02

		//;MAIN.C: 238: eepromWriteByte(0x02,0);
		CLRR 	72H 			//008D 	0172
		LCALL 	406H 			//008E 	3406
		LDWI 	5H 			//008F 	2A05

		//;MAIN.C: 239: eepromWriteByte(0x05,0);
		CLRR 	72H 			//0090 	0172
		LCALL 	406H 			//0091 	3406
		LDWI 	4H 			//0092 	2A04

		//;MAIN.C: 240: eepromWriteByte(0x04,0);
		CLRR 	72H 			//0093 	0172
		ORG		0094H
		LCALL 	406H 			//0094 	3406
		LDWI 	3H 			//0095 	2A03

		//;MAIN.C: 241: eepromWriteByte(0x03,0);
		CLRR 	72H 			//0096 	0172
		LCALL 	406H 			//0097 	3406

		//;MAIN.C: 243: }
		LJUMP 	AEH 			//0098 	38AE

		//;MAIN.C: 244: else{
		//;MAIN.C: 245: tmp = eepromReadByte(0x02) ;
		LDWI 	2H 			//0099 	2A02
		LCALL 	5E5H 			//009A 	35E5
		BCR 	STATUS,5 		//009B 	1283
		ORG		009CH
		STR 	59H 			//009C 	01D9

		//;MAIN.C: 246: tmp++;
		INCR	59H,1 			//009D 	09D9

		//;MAIN.C: 247: eepromWriteByte(0x02,tmp);
		LDR 	59H,0 			//009E 	0859
		STR 	72H 			//009F 	01F2
		LDWI 	2H 			//00A0 	2A02
		LCALL 	406H 			//00A1 	3406
		LDWI 	AH 			//00A2 	2A0A

		//;MAIN.C: 248: PwInNum=0;
		BCR 	STATUS,5 		//00A3 	1283
		ORG		00A4H
		BCR 	STATUS,6 		//00A4 	1303
		CLRR 	5EH 			//00A5 	015E

		//;MAIN.C: 249: setState(7,10);
		STR 	72H 			//00A6 	01F2
		LDWI 	7H 			//00A7 	2A07
		LJUMP 	ACH 			//00A8 	38AC

		//;MAIN.C: 253: else{
		//;MAIN.C: 254: setState(1,45);
		LDWI 	2DH 			//00A9 	2A2D
		STR 	72H 			//00AA 	01F2
		LDWI 	1H 			//00AB 	2A01
		ORG		00ACH
		CLRR 	73H 			//00AC 	0173
		LCALL 	5C6H 			//00AD 	35C6

		//;MAIN.C: 255: }
		//;MAIN.C: 257: if(eepromReadByte(0x01)== 1){
		LDWI 	1H 			//00AE 	2A01
		LCALL 	5E5H 			//00AF 	35E5
		XORWI 	1H 			//00B0 	2601
		BTSS 	STATUS,2 		//00B1 	1D03
		LJUMP 	B7H 			//00B2 	38B7
		LDWI 	0H 			//00B3 	2A00
		ORG		00B4H

		//;MAIN.C: 258: setState(0,0);
		CLRR 	72H 			//00B4 	0172
		CLRR 	73H 			//00B5 	0173
		LCALL 	5C6H 			//00B6 	35C6

		//;MAIN.C: 259: }
		//;MAIN.C: 260: }
		//;MAIN.C: 262: setState(1,45);
		LDWI 	2DH 			//00B7 	2A2D
		STR 	72H 			//00B8 	01F2
		LDWI 	1H 			//00B9 	2A01
		CLRR 	73H 			//00BA 	0173
		LCALL 	5C6H 			//00BB 	35C6
		ORG		00BCH

		//;MAIN.C: 267: tmp=0;
		CLRR 	59H 			//00BC 	0159

		//;MAIN.C: 271: idop = get_RFID();
		LCALL 	230H 			//00BD 	3230
		STR 	58H 			//00BE 	01D8

		//;MAIN.C: 273: if(idop){
		LDR 	58H,0 			//00BF 	0858
		BTSC 	STATUS,2 		//00C0 	1503
		LJUMP 	1ABH 			//00C1 	39AB

		//;MAIN.C: 274: swUartSendString("\nTag: ");
		LDWI 	1H 			//00C2 	2A01
		LCALL 	5B9H 			//00C3 	35B9
		ORG		00C4H

		//;MAIN.C: 276: SendNum(keyID[1]);
		BCR 	STATUS,5 		//00C4 	1283
		BCR 	STATUS,6 		//00C5 	1303
		LDR 	61H,0 			//00C6 	0861
		LCALL 	3E0H 			//00C7 	33E0

		//;MAIN.C: 277: SendNum(keyID[2]);
		BCR 	STATUS,5 		//00C8 	1283
		BCR 	STATUS,6 		//00C9 	1303
		LDR 	62H,0 			//00CA 	0862
		LCALL 	3E0H 			//00CB 	33E0
		ORG		00CCH

		//;MAIN.C: 278: SendNum(keyID[3]);
		BCR 	STATUS,5 		//00CC 	1283
		BCR 	STATUS,6 		//00CD 	1303
		LDR 	63H,0 			//00CE 	0863
		LCALL 	3E0H 			//00CF 	33E0

		//;MAIN.C: 279: SendNum(keyID[4]);
		BCR 	STATUS,5 		//00D0 	1283
		BCR 	STATUS,6 		//00D1 	1303
		LDR 	64H,0 			//00D2 	0864
		LCALL 	3E0H 			//00D3 	33E0
		ORG		00D4H

		//;MAIN.C: 280: idop = id_search(keyID,buffTag);
		LDWI 	26H 			//00D4 	2A26
		STR 	7AH 			//00D5 	01FA
		LDWI 	60H 			//00D6 	2A60
		LCALL 	4C4H 			//00D7 	34C4
		STR 	58H 			//00D8 	01D8

		//;MAIN.C: 281: switch (mtState){
		LJUMP 	192H 			//00D9 	3992

		//;MAIN.C: 284: case 1:
		//;MAIN.C: 285: case 2:
		//;MAIN.C: 287: if((idop>1) && (idop <6))
		LDWI 	2H 			//00DA 	2A02
		SUBWR 	58H,0 			//00DB 	0C58
		ORG		00DCH
		BTSS 	STATUS,0 		//00DC 	1C03
		LJUMP 	105H 			//00DD 	3905
		LDWI 	6H 			//00DE 	2A06
		SUBWR 	58H,0 			//00DF 	0C58
		BTSC 	STATUS,0 		//00E0 	1403
		LJUMP 	105H 			//00E1 	3905

		//;MAIN.C: 288: {
		//;MAIN.C: 289: if( eepromReadByte(0x00) == 7) eepromWriteByte(0x00,0);
		LDWI 	0H 			//00E2 	2A00
		LCALL 	5E5H 			//00E3 	35E5
		ORG		00E4H
		XORWI 	7H 			//00E4 	2607
		BTSS 	STATUS,2 		//00E5 	1D03
		LJUMP 	EAH 			//00E6 	38EA
		LDWI 	0H 			//00E7 	2A00
		CLRR 	72H 			//00E8 	0172
		LCALL 	406H 			//00E9 	3406

		//;MAIN.C: 290: if(mtState==7){
		BCR 	STATUS,5 		//00EA 	1283
		BCR 	STATUS,6 		//00EB 	1303
		ORG		00ECH
		LDR 	5FH,0 			//00EC 	085F
		XORWI 	7H 			//00ED 	2607
		BTSS 	STATUS,2 		//00EE 	1D03
		LJUMP 	FCH 			//00EF 	38FC
		LDWI 	2H 			//00F0 	2A02

		//;MAIN.C: 291: eepromWriteByte(0x02,0);
		CLRR 	72H 			//00F1 	0172
		LCALL 	406H 			//00F2 	3406
		LDWI 	5H 			//00F3 	2A05
		ORG		00F4H

		//;MAIN.C: 292: eepromWriteByte(0x05,0);
		CLRR 	72H 			//00F4 	0172
		LCALL 	406H 			//00F5 	3406
		LDWI 	4H 			//00F6 	2A04

		//;MAIN.C: 293: eepromWriteByte(0x04,0);
		CLRR 	72H 			//00F7 	0172
		LCALL 	406H 			//00F8 	3406
		LDWI 	3H 			//00F9 	2A03

		//;MAIN.C: 294: eepromWriteByte(0x03,0);
		CLRR 	72H 			//00FA 	0172
		LCALL 	406H 			//00FB 	3406
		ORG		00FCH
		LDWI 	0H 			//00FC 	2A00

		//;MAIN.C: 295: }
		//;MAIN.C: 296: setState(0,0);
		CLRR 	72H 			//00FD 	0172
		CLRR 	73H 			//00FE 	0173
		LCALL 	5C6H 			//00FF 	35C6
		LDWI 	AH 			//0100 	2A0A

		//;MAIN.C: 297: beep(10,1);
		CLRR 	75H 			//0101 	0175
		INCR	75H,1 			//0102 	09F5
		LCALL 	4A8H 			//0103 	34A8
		ORG		0104H

		//;MAIN.C: 298: }
		LJUMP 	19DH 			//0104 	399D

		//;MAIN.C: 300: else if(idop==1)
		DECRSZ 	58H,0 		//0105 	0E58
		LJUMP 	19DH 			//0106 	399D

		//;MAIN.C: 301: {
		//;MAIN.C: 303: id_clear(2,5);
		LDWI 	5H 			//0107 	2A05
		STR 	43H 			//0108 	01C3
		LDWI 	2H 			//0109 	2A02
		LCALL 	44AH 			//010A 	344A
		LDWI 	3H 			//010B 	2A03
		ORG		010CH

		//;MAIN.C: 304: setState(3,0);
		CLRR 	72H 			//010C 	0172
		CLRR 	73H 			//010D 	0173
		LCALL 	5C6H 			//010E 	35C6
		LDWI 	3H 			//010F 	2A03

		//;MAIN.C: 305: tmp=1;
		CLRR 	59H 			//0110 	0159
		INCR	59H,1 			//0111 	09D9

		//;MAIN.C: 306: beep(10,3);
		STR 	75H 			//0112 	01F5
		LDWI 	AH 			//0113 	2A0A
		ORG		0114H
		LCALL 	4A8H 			//0114 	34A8
		LJUMP 	19DH 			//0115 	399D

		//;MAIN.C: 312: if(idop<=5 && idop!=1 ){
		LDWI 	6H 			//0116 	2A06
		SUBWR 	58H,0 			//0117 	0C58
		BTSC 	STATUS,0 		//0118 	1403
		LJUMP 	19DH 			//0119 	399D
		DECR 	58H,0 			//011A 	0D58
		BTSC 	STATUS,2 		//011B 	1503
		ORG		011CH
		LJUMP 	19DH 			//011C 	399D

		//;MAIN.C: 313: if(eepromReadByte(0x01)==1){
		LDWI 	1H 			//011D 	2A01
		LCALL 	5E5H 			//011E 	35E5
		XORWI 	1H 			//011F 	2601
		BTSS 	STATUS,2 		//0120 	1D03
		LJUMP 	19DH 			//0121 	399D
		LDWI 	1H 			//0122 	2A01

		//;MAIN.C: 314: eepromWriteByte(0x01,0);
		CLRR 	72H 			//0123 	0172
		ORG		0124H
		LCALL 	406H 			//0124 	3406

		//;MAIN.C: 315: beep(10,2);
		LDWI 	2H 			//0125 	2A02
		STR 	75H 			//0126 	01F5
		LDWI 	AH 			//0127 	2A0A
		LCALL 	4A8H 			//0128 	34A8
		LJUMP 	19DH 			//0129 	399D

		//;MAIN.C: 326: if(idop==1 && idState == 0){
		DECRSZ 	58H,0 		//012A 	0E58
		LJUMP 	13EH 			//012B 	393E
		ORG		012CH
		LDR 	57H,1 			//012C 	08D7
		BTSS 	STATUS,2 		//012D 	1D03
		LJUMP 	13EH 			//012E 	393E

		//;MAIN.C: 328: id_clear(2,5);
		LDWI 	5H 			//012F 	2A05
		STR 	43H 			//0130 	01C3
		LDWI 	2H 			//0131 	2A02
		LCALL 	44AH 			//0132 	344A
		LDWI 	3H 			//0133 	2A03
		ORG		0134H

		//;MAIN.C: 329: setState(3,0);
		CLRR 	72H 			//0134 	0172
		CLRR 	73H 			//0135 	0173
		LCALL 	5C6H 			//0136 	35C6
		LDWI 	3H 			//0137 	2A03

		//;MAIN.C: 330: tmp=1;
		CLRR 	59H 			//0138 	0159
		INCR	59H,1 			//0139 	09D9

		//;MAIN.C: 331: beep(10,3);
		STR 	75H 			//013A 	01F5
		LDWI 	AH 			//013B 	2A0A
		ORG		013CH
		LCALL 	4A8H 			//013C 	34A8

		//;MAIN.C: 332: }
		LJUMP 	19DH 			//013D 	399D

		//;MAIN.C: 334: else if(idop==2 && idState == 0){
		LDR 	58H,0 			//013E 	0858
		XORWI 	2H 			//013F 	2602
		BTSS 	STATUS,2 		//0140 	1D03
		LJUMP 	19DH 			//0141 	399D
		LDR 	57H,1 			//0142 	08D7
		BTSS 	STATUS,2 		//0143 	1D03
		ORG		0144H
		LJUMP 	19DH 			//0144 	399D

		//;MAIN.C: 336: id_clear(3,5);
		LDWI 	5H 			//0145 	2A05
		STR 	43H 			//0146 	01C3
		LDWI 	3H 			//0147 	2A03
		LCALL 	44AH 			//0148 	344A
		LDWI 	5H 			//0149 	2A05

		//;MAIN.C: 337: setState(5,0);
		CLRR 	72H 			//014A 	0172
		CLRR 	73H 			//014B 	0173
		ORG		014CH
		LCALL 	5C6H 			//014C 	35C6

		//;MAIN.C: 338: tmp=2;
		LDWI 	2H 			//014D 	2A02
		STR 	59H 			//014E 	01D9

		//;MAIN.C: 339: beep(10,2);
		STR 	75H 			//014F 	01F5
		LDWI 	AH 			//0150 	2A0A
		LCALL 	4A8H 			//0151 	34A8
		LJUMP 	19DH 			//0152 	399D

		//;MAIN.C: 345: if (idState == 0){
		LDR 	57H,1 			//0153 	08D7
		ORG		0154H
		BTSS 	STATUS,2 		//0154 	1D03
		LJUMP 	16DH 			//0155 	396D

		//;MAIN.C: 352: if( idop !=1){
		DECR 	58H,0 			//0156 	0D58
		BTSC 	STATUS,2 		//0157 	1503
		LJUMP 	19DH 			//0158 	399D
		LDWI 	6H 			//0159 	2A06

		//;MAIN.C: 353: tmp++;
		INCR	59H,1 			//015A 	09D9

		//;MAIN.C: 355: if(tmp <=5){
		SUBWR 	59H,0 			//015B 	0C59
		ORG		015CH
		BTSC 	STATUS,0 		//015C 	1403
		LJUMP 	19DH 			//015D 	399D

		//;MAIN.C: 356: id_replate(tmp,keyID,buffTag);
		LDWI 	60H 			//015E 	2A60
		STR 	3FH 			//015F 	01BF
		LDWI 	26H 			//0160 	2A26
		STR 	40H 			//0161 	01C0
		LDR 	59H,0 			//0162 	0859
		LCALL 	37DH 			//0163 	337D
		ORG		0164H
		LDWI 	AH 			//0164 	2A0A

		//;MAIN.C: 357: timeTick=0;
		BCR 	STATUS,5 		//0165 	1283
		BCR 	STATUS,6 		//0166 	1303
		CLRR 	5CH 			//0167 	015C
		CLRR 	5DH 			//0168 	015D
		CLRR 	75H 			//0169 	0175
		INCR	75H,1 			//016A 	09F5
		LCALL 	4A8H 			//016B 	34A8
		ORG		016CH
		LJUMP 	19DH 			//016C 	399D
		LDWI 	AH 			//016D 	2A0A

		//;MAIN.C: 364: beep(10,1);
		CLRR 	75H 			//016E 	0175
		INCR	75H,1 			//016F 	09F5
		LCALL 	4A8H 			//0170 	34A8
		LJUMP 	19DH 			//0171 	399D

		//;MAIN.C: 370: if(idState == 0){
		LDR 	57H,1 			//0172 	08D7
		BTSS 	STATUS,2 		//0173 	1D03
		ORG		0174H
		LJUMP 	18DH 			//0174 	398D

		//;MAIN.C: 371: if( idop >2){
		LDWI 	3H 			//0175 	2A03
		SUBWR 	58H,0 			//0176 	0C58
		BTSS 	STATUS,0 		//0177 	1C03
		LJUMP 	19DH 			//0178 	399D
		LDWI 	6H 			//0179 	2A06

		//;MAIN.C: 372: tmp++;
		INCR	59H,1 			//017A 	09D9

		//;MAIN.C: 374: if(tmp <=5){
		SUBWR 	59H,0 			//017B 	0C59
		ORG		017CH
		BTSC 	STATUS,0 		//017C 	1403
		LJUMP 	19DH 			//017D 	399D

		//;MAIN.C: 375: id_replate(tmp,keyID,buffTag);
		LDWI 	60H 			//017E 	2A60
		STR 	3FH 			//017F 	01BF
		LDWI 	26H 			//0180 	2A26
		STR 	40H 			//0181 	01C0
		LDR 	59H,0 			//0182 	0859
		LCALL 	37DH 			//0183 	337D
		ORG		0184H
		LDWI 	AH 			//0184 	2A0A

		//;MAIN.C: 376: timeTick=0;
		BCR 	STATUS,5 		//0185 	1283
		BCR 	STATUS,6 		//0186 	1303
		CLRR 	5CH 			//0187 	015C
		CLRR 	5DH 			//0188 	015D
		CLRR 	75H 			//0189 	0175
		INCR	75H,1 			//018A 	09F5
		LCALL 	4A8H 			//018B 	34A8
		ORG		018CH
		LJUMP 	19DH 			//018C 	399D
		LDWI 	AH 			//018D 	2A0A

		//;MAIN.C: 383: beep(10,1);
		CLRR 	75H 			//018E 	0175
		INCR	75H,1 			//018F 	09F5
		LCALL 	4A8H 			//0190 	34A8
		LJUMP 	19DH 			//0191 	399D
		LDR 	5FH,0 			//0192 	085F
		STR 	FSR 			//0193 	0184
		ORG		0194H
		LDWI 	8H 			//0194 	2A08
		SUBWR 	FSR,0 			//0195 	0C04
		BTSC 	STATUS,0 		//0196 	1403
		LJUMP 	19DH 			//0197 	399D
		LDWI 	5H 			//0198 	2A05
		STR 	PCLATH 			//0199 	018A
		LDWI 	EEH 			//019A 	2AEE
		ADDWR 	FSR,0 			//019B 	0B04
		ORG		019CH
		STR 	PCL 			//019C 	0182
		LDWI 	9FH 			//019D 	2A9F

		//;MAIN.C: 408: idState = 1;
		BCR 	STATUS,5 		//019E 	1283
		BCR 	STATUS,6 		//019F 	1303
		CLRR 	57H 			//01A0 	0157
		INCR	57H,1 			//01A1 	09D7

		//;MAIN.C: 409: _delay((unsigned long)((61)*(8000000/4000.0)));
		STR 	54H 			//01A2 	01D4
		LDWI 	6FH 			//01A3 	2A6F
		ORG		01A4H
		STR 	53H 			//01A4 	01D3
		DECRSZ 	53H,1 		//01A5 	0ED3
		LJUMP 	1A5H 			//01A6 	39A5
		DECRSZ 	54H,1 		//01A7 	0ED4
		LJUMP 	1A5H 			//01A8 	39A5
		LJUMP 	1AAH 			//01A9 	39AA

		//;MAIN.C: 410: }
		LJUMP 	1B8H 			//01AA 	39B8
		LDWI 	2H 			//01AB 	2A02
		ORG		01ACH

		//;MAIN.C: 411: else{
		//;MAIN.C: 412: idState =0;
		CLRR 	57H 			//01AC 	0157

		//;MAIN.C: 413: _delay((unsigned long)((150)*(8000000/4000.0)));
		STR 	55H 			//01AD 	01D5
		LDWI 	86H 			//01AE 	2A86
		STR 	54H 			//01AF 	01D4
		LDWI 	99H 			//01B0 	2A99
		STR 	53H 			//01B1 	01D3
		DECRSZ 	53H,1 		//01B2 	0ED3
		LJUMP 	1B2H 			//01B3 	39B2
		ORG		01B4H
		DECRSZ 	54H,1 		//01B4 	0ED4
		LJUMP 	1B2H 			//01B5 	39B2
		DECRSZ 	55H,1 		//01B6 	0ED5
		LJUMP 	1B2H 			//01B7 	39B2

		//;MAIN.C: 414: }
		//;MAIN.C: 418: if((timeOut!=0)&&( timeTick > timeOut)){
		BCR 	STATUS,5 		//01B8 	1283
		BCR 	STATUS,6 		//01B9 	1303
		LDR 	5BH,0 			//01BA 	085B
		IORWR 	5AH,0 			//01BB 	035A
		ORG		01BCH
		BTSC 	STATUS,2 		//01BC 	1503
		LJUMP 	20FH 			//01BD 	3A0F
		LDR 	5DH,0 			//01BE 	085D
		SUBWR 	5BH,0 			//01BF 	0C5B
		BTSS 	STATUS,2 		//01C0 	1D03
		LJUMP 	1C4H 			//01C1 	39C4
		LDR 	5CH,0 			//01C2 	085C
		SUBWR 	5AH,0 			//01C3 	0C5A
		ORG		01C4H
		BTSS 	STATUS,0 		//01C4 	1C03
		LJUMP 	201H 			//01C5 	3A01
		LJUMP 	20FH 			//01C6 	3A0F

		//;MAIN.C: 423: setState(2,80);
		LDWI 	50H 			//01C7 	2A50
		STR 	72H 			//01C8 	01F2
		LDWI 	2H 			//01C9 	2A02
		CLRR 	73H 			//01CA 	0173
		LCALL 	5C6H 			//01CB 	35C6
		ORG		01CCH

		//;MAIN.C: 424: buzFre=0x6a;
		LDWI 	6AH 			//01CC 	2A6A
		STR 	25H 			//01CD 	01A5

		//;MAIN.C: 425: break;
		LJUMP 	20FH 			//01CE 	3A0F

		//;MAIN.C: 427: setState(6,35);
		LDWI 	23H 			//01CF 	2A23
		STR 	72H 			//01D0 	01F2
		LDWI 	6H 			//01D1 	2A06
		CLRR 	73H 			//01D2 	0173
		LCALL 	5C6H 			//01D3 	35C6
		ORG		01D4H

		//;MAIN.C: 428: break;
		LJUMP 	20FH 			//01D4 	3A0F
		LDWI 	2H 			//01D5 	2A02

		//;MAIN.C: 430: setState(2,0);
		CLRR 	72H 			//01D6 	0172
		CLRR 	73H 			//01D7 	0173
		LCALL 	5C6H 			//01D8 	35C6

		//;MAIN.C: 431: buzFre=0x6a;
		LDWI 	6AH 			//01D9 	2A6A
		STR 	25H 			//01DA 	01A5

		//;MAIN.C: 432: eepromWriteByte(0x00,7);
		LDWI 	7H 			//01DB 	2A07
		ORG		01DCH
		STR 	72H 			//01DC 	01F2
		LDWI 	0H 			//01DD 	2A00
		LCALL 	406H 			//01DE 	3406
		LDWI 	2H 			//01DF 	2A02

		//;MAIN.C: 433: eepromWriteByte(0x02,0);
		CLRR 	72H 			//01E0 	0172
		LCALL 	406H 			//01E1 	3406

		//;MAIN.C: 434: break;
		LJUMP 	20FH 			//01E2 	3A0F

		//;MAIN.C: 435: case 7:
		//;MAIN.C: 437: if(RC1==1){
		BTSS 	7H,1 			//01E3 	1C87
		ORG		01E4H
		LJUMP 	20FH 			//01E4 	3A0F
		LDWI 	2H 			//01E5 	2A02

		//;MAIN.C: 438: PwInNum++;
		INCR	5EH,1 			//01E6 	09DE

		//;MAIN.C: 439: tmp = eepromReadByte(0x02);
		LCALL 	5E5H 			//01E7 	35E5
		BCR 	STATUS,5 		//01E8 	1283
		STR 	59H 			//01E9 	01D9

		//;MAIN.C: 440: if(tmp>0&&tmp<4){
		LDR 	59H,0 			//01EA 	0859
		BTSC 	STATUS,2 		//01EB 	1503
		ORG		01ECH
		LJUMP 	1F7H 			//01EC 	39F7
		LDWI 	4H 			//01ED 	2A04
		SUBWR 	59H,0 			//01EE 	0C59
		BTSC 	STATUS,0 		//01EF 	1403
		LJUMP 	1F7H 			//01F0 	39F7

		//;MAIN.C: 441: tmp--;
		DECR 	59H,1 			//01F1 	0DD9

		//;MAIN.C: 442: eepromWriteByte(0x03+tmp,PwInNum);
		LDR 	5EH,0 			//01F2 	085E
		STR 	72H 			//01F3 	01F2
		ORG		01F4H
		LDR 	59H,0 			//01F4 	0859
		ADDWI 	3H 			//01F5 	2703
		LCALL 	406H 			//01F6 	3406
		LDWI 	AH 			//01F7 	2A0A

		//;MAIN.C: 443: }
		//;MAIN.C: 445: beep(10,1);
		CLRR 	75H 			//01F8 	0175
		INCR	75H,1 			//01F9 	09F5
		LCALL 	4A8H 			//01FA 	34A8

		//;MAIN.C: 446: setState(7,10);
		LDWI 	AH 			//01FB 	2A0A
		ORG		01FCH
		STR 	72H 			//01FC 	01F2
		LDWI 	7H 			//01FD 	2A07
		CLRR 	73H 			//01FE 	0173
		LCALL 	5C6H 			//01FF 	35C6
		LJUMP 	20FH 			//0200 	3A0F
		LDR 	5FH,0 			//0201 	085F
		XORWI 	1H 			//0202 	2601
		BTSC 	STATUS,2 		//0203 	1503
		ORG		0204H
		LJUMP 	1C7H 			//0204 	39C7
		XORWI 	3H 			//0205 	2603
		BTSC 	STATUS,2 		//0206 	1503
		LJUMP 	1CFH 			//0207 	39CF
		XORWI 	4H 			//0208 	2604
		BTSC 	STATUS,2 		//0209 	1503
		LJUMP 	1D5H 			//020A 	39D5
		XORWI 	1H 			//020B 	2601
		ORG		020CH
		BTSC 	STATUS,2 		//020C 	1503
		LJUMP 	1E3H 			//020D 	39E3
		LJUMP 	20FH 			//020E 	3A0F

		//;MAIN.C: 464: }
		//;MAIN.C: 467: if(mtState==0) RA3 = 1;
		BCR 	STATUS,5 		//020F 	1283
		BCR 	STATUS,6 		//0210 	1303
		LDR 	5FH,1 			//0211 	08DF
		BTSS 	STATUS,2 		//0212 	1D03
		LJUMP 	216H 			//0213 	3A16
		ORG		0214H
		BSR 	5H,3 			//0214 	1985
		LJUMP 	217H 			//0215 	3A17

		//;MAIN.C: 468: else RA3 =0;
		BCR 	5H,3 			//0216 	1185

		//;MAIN.C: 475: if(mtState == 2) {
		LDR 	5FH,0 			//0217 	085F
		XORWI 	2H 			//0218 	2602
		BTSS 	STATUS,2 		//0219 	1D03
		LJUMP 	22AH 			//021A 	3A2A

		//;MAIN.C: 477: TMR1ON = 1;T0IE = 1;
		BSR 	10H,0 			//021B 	1810
		ORG		021CH
		BSR 	INTCON,5 		//021C 	1A8B

		//;MAIN.C: 478: if(timeTick%4 ==0){
		LDR 	5CH,0 			//021D 	085C
		ANDWI 	3H 			//021E 	2403
		BTSS 	STATUS,2 		//021F 	1D03
		LJUMP 	22CH 			//0220 	3A2C

		//;MAIN.C: 480: if(buzFre==0x6a){
		LDR 	25H,0 			//0221 	0825
		XORWI 	6AH 			//0222 	266A
		BTSS 	STATUS,2 		//0223 	1D03
		ORG		0224H
		LJUMP 	227H 			//0224 	3A27

		//;MAIN.C: 481: buzFre=12;
		LDWI 	CH 			//0225 	2A0C
		LJUMP 	228H 			//0226 	3A28

		//;MAIN.C: 482: }else{
		//;MAIN.C: 483: buzFre=0x6a;
		LDWI 	6AH 			//0227 	2A6A
		STR 	25H 			//0228 	01A5
		LJUMP 	22CH 			//0229 	3A2C
		BCR 	10H,0 			//022A 	1010
		BCR 	INTCON,5 		//022B 	128B
		ORG		022CH

		//;MAIN.C: 490: timeTick++;
		INCR	5CH,1 			//022C 	09DC
		BTSC 	STATUS,2 		//022D 	1503
		INCR	5DH,1 			//022E 	09DD
		LJUMP 	BDH 			//022F 	38BD
		LDWI 	10H 			//0230 	2A10

		//;rfid125.c: 23: unsigned char RF_serial_55bits[11];
		//;rfid125.c: 24: unsigned int timeOutVal;
		//;rfid125.c: 25: unsigned char i,ii,j;
		//;rfid125.c: 26: unsigned char flag_RFID_syn, flag_RFID_last;
		//;rfid125.c: 27: unsigned char even_row, even_col;
		//;rfid125.c: 30: flag_RFID_syn = 0;
		CLRR 	4AH 			//0231 	014A

		//;rfid125.c: 33: i=16;
		STR 	4EH 			//0232 	01CE

		//;rfid125.c: 35: {
		//;rfid125.c: 36: timeOutVal=timerOut(1,600);
		LDWI 	58H 			//0233 	2A58
		ORG		0234H
		STR 	72H 			//0234 	01F2
		LDWI 	2H 			//0235 	2A02
		STR 	73H 			//0236 	01F3
		LDWI 	1H 			//0237 	2A01
		LCALL 	429H 			//0238 	3429

		//;rfid125.c: 37: if(timeOutVal==0) return 0;
		LCALL 	366H 			//0239 	3366
		BTSC 	STATUS,2 		//023A 	1503
		RETW 	0H 			//023B 	2100
		ORG		023CH

		//;rfid125.c: 39: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//023C 	2A58
		LCALL 	379H 			//023D 	3379
		LCALL 	429H 			//023E 	3429

		//;rfid125.c: 40: if(timeOutVal==0) return 0;
		LCALL 	366H 			//023F 	3366
		BTSC 	STATUS,2 		//0240 	1503
		RETW 	0H 			//0241 	2100
		LDWI 	1H 			//0242 	2A01

		//;rfid125.c: 42: i--;
		DECR 	4EH,1 			//0243 	0DCE
		ORG		0244H

		//;rfid125.c: 43: }
		//;rfid125.c: 44: while(timeOutVal<290 && i>0);
		SUBWR 	51H,0 			//0244 	0C51
		LDWI 	22H 			//0245 	2A22
		BTSC 	STATUS,2 		//0246 	1503
		SUBWR 	50H,0 			//0247 	0C50
		BTSC 	STATUS,0 		//0248 	1403
		LJUMP 	24DH 			//0249 	3A4D
		LDR 	4EH,1 			//024A 	08CE
		BTSS 	STATUS,2 		//024B 	1D03
		ORG		024CH
		LJUMP 	233H 			//024C 	3A33

		//;rfid125.c: 45: flag_RFID_last = 1;
		CLRR 	4FH 			//024D 	014F
		INCR	4FH,1 			//024E 	09CF

		//;rfid125.c: 46: i = 0;
		CLRR 	4EH 			//024F 	014E

		//;rfid125.c: 47: while(i<64)
		LDWI 	40H 			//0250 	2A40
		SUBWR 	4EH,0 			//0251 	0C4E
		BTSC 	STATUS,0 		//0252 	1403
		LJUMP 	2A9H 			//0253 	3AA9
		ORG		0254H

		//;rfid125.c: 48: {
		//;rfid125.c: 49: for(ii=0;ii<9;ii++)
		CLRR 	52H 			//0254 	0152

		//;rfid125.c: 50: {
		//;rfid125.c: 51: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	373H 			//0255 	3373
		LCALL 	429H 			//0256 	3429

		//;rfid125.c: 52: if(timeOutVal==0) return 0;
		LCALL 	366H 			//0257 	3366
		BTSC 	STATUS,2 		//0258 	1503
		RETW 	0H 			//0259 	2100

		//;rfid125.c: 54: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 55: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4FH,1 			//025A 	08CF
		BTSS 	STATUS,2 		//025B 	1D03
		ORG		025CH
		LJUMP 	264H 			//025C 	3A64
		LDWI 	1H 			//025D 	2A01
		SUBWR 	51H,0 			//025E 	0C51
		LDWI 	23H 			//025F 	2A23
		BTSC 	STATUS,2 		//0260 	1503
		SUBWR 	50H,0 			//0261 	0C50
		BTSS 	STATUS,0 		//0262 	1C03
		LJUMP 	26DH 			//0263 	3A6D
		ORG		0264H
		DECRSZ 	4FH,0 		//0264 	0E4F
		LJUMP 	27BH 			//0265 	3A7B
		LDWI 	1H 			//0266 	2A01
		SUBWR 	51H,0 			//0267 	0C51
		LDWI 	23H 			//0268 	2A23
		BTSC 	STATUS,2 		//0269 	1503
		SUBWR 	50H,0 			//026A 	0C50
		BTSS 	STATUS,0 		//026B 	1C03
		ORG		026CH
		LJUMP 	27BH 			//026C 	3A7B

		//;rfid125.c: 56: {
		//;rfid125.c: 57: if(!flag_RFID_last)
		LDR 	4FH,1 			//026D 	08CF
		BTSS 	STATUS,2 		//026E 	1D03
		LJUMP 	278H 			//026F 	3A78

		//;rfid125.c: 58: {
		//;rfid125.c: 59: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//0270 	2A22
		STR 	72H 			//0271 	01F2
		LDWI 	1H 			//0272 	2A01
		STR 	73H 			//0273 	01F3
		ORG		0274H
		LCALL 	429H 			//0274 	3429

		//;rfid125.c: 60: if(timeOutVal==0) return 0;
		LCALL 	366H 			//0275 	3366
		BTSC 	STATUS,2 		//0276 	1503
		RETW 	0H 			//0277 	2100

		//;rfid125.c: 61: }
		//;rfid125.c: 62: flag_RFID_last = 0;
		CLRR 	4FH 			//0278 	014F

		//;rfid125.c: 63: i++;
		INCR	4EH,1 			//0279 	09CE

		//;rfid125.c: 64: }
		LJUMP 	29EH 			//027A 	3A9E

		//;rfid125.c: 65: else
		//;rfid125.c: 66: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 67: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4FH,1 			//027B 	08CF
		ORG		027CH
		BTSS 	STATUS,2 		//027C 	1D03
		LJUMP 	285H 			//027D 	3A85
		LDWI 	1H 			//027E 	2A01
		SUBWR 	51H,0 			//027F 	0C51
		LDWI 	23H 			//0280 	2A23
		BTSC 	STATUS,2 		//0281 	1503
		SUBWR 	50H,0 			//0282 	0C50
		BTSC 	STATUS,0 		//0283 	1403
		ORG		0284H
		LJUMP 	28EH 			//0284 	3A8E
		DECRSZ 	4FH,0 		//0285 	0E4F
		LJUMP 	29EH 			//0286 	3A9E
		LDWI 	1H 			//0287 	2A01
		SUBWR 	51H,0 			//0288 	0C51
		LDWI 	23H 			//0289 	2A23
		BTSC 	STATUS,2 		//028A 	1503
		SUBWR 	50H,0 			//028B 	0C50
		ORG		028CH
		BTSC 	STATUS,0 		//028C 	1403
		LJUMP 	29EH 			//028D 	3A9E

		//;rfid125.c: 68: {
		//;rfid125.c: 69: if(flag_RFID_last)
		LDR 	4FH,0 			//028E 	084F
		BTSC 	STATUS,2 		//028F 	1503
		LJUMP 	29AH 			//0290 	3A9A

		//;rfid125.c: 70: {
		//;rfid125.c: 71: timeOutVal=timerOut(0,290);
		LDWI 	22H 			//0291 	2A22
		STR 	72H 			//0292 	01F2
		LDWI 	1H 			//0293 	2A01
		ORG		0294H
		STR 	73H 			//0294 	01F3
		LDWI 	0H 			//0295 	2A00
		LCALL 	429H 			//0296 	3429

		//;rfid125.c: 72: if(timeOutVal==0) return 0;
		LCALL 	366H 			//0297 	3366
		BTSC 	STATUS,2 		//0298 	1503
		RETW 	0H 			//0299 	2100

		//;rfid125.c: 73: }
		//;rfid125.c: 74: flag_RFID_last = 1;
		CLRR 	4FH 			//029A 	014F
		INCR	4FH,1 			//029B 	09CF
		ORG		029CH

		//;rfid125.c: 75: i++;
		INCR	4EH,1 			//029C 	09CE

		//;rfid125.c: 77: break;
		LJUMP 	2A3H 			//029D 	3AA3
		LDWI 	9H 			//029E 	2A09
		INCR	52H,1 			//029F 	09D2
		SUBWR 	52H,0 			//02A0 	0C52
		BTSS 	STATUS,0 		//02A1 	1C03
		LJUMP 	255H 			//02A2 	3A55

		//;rfid125.c: 78: }
		//;rfid125.c: 80: }
		//;rfid125.c: 81: if(9==ii)
		LDR 	52H,0 			//02A3 	0852
		ORG		02A4H
		XORWI 	9H 			//02A4 	2609
		BTSS 	STATUS,2 		//02A5 	1D03
		LJUMP 	250H 			//02A6 	3A50

		//;rfid125.c: 82: {
		//;rfid125.c: 83: flag_RFID_syn = 1;
		CLRR 	4AH 			//02A7 	014A
		INCR	4AH,1 			//02A8 	09CA

		//;rfid125.c: 84: break;
		//;rfid125.c: 85: }
		//;rfid125.c: 86: }
		//;rfid125.c: 88: if(!flag_RFID_syn)
		LDR 	4AH,1 			//02A9 	08CA
		BTSC 	STATUS,2 		//02AA 	1503
		RETW 	0H 			//02AB 	2100
		ORG		02ACH

		//;rfid125.c: 91: }
		//;rfid125.c: 92: for(ii=0;ii<55;ii++)
		CLRR 	52H 			//02AC 	0152

		//;rfid125.c: 93: {
		//;rfid125.c: 94: i = ii/5;
		LDWI 	5H 			//02AD 	2A05
		STR 	72H 			//02AE 	01F2
		LDR 	52H,0 			//02AF 	0852
		LCALL 	4E0H 			//02B0 	34E0
		STR 	4EH 			//02B1 	01CE

		//;rfid125.c: 95: timeOutVal=timerOut(flag_RFID_last,600);
		LCALL 	373H 			//02B2 	3373
		LCALL 	429H 			//02B3 	3429
		ORG		02B4H

		//;rfid125.c: 96: if(timeOutVal==0) return 0;
		LCALL 	366H 			//02B4 	3366
		BTSC 	STATUS,2 		//02B5 	1503
		RETW 	0H 			//02B6 	2100

		//;rfid125.c: 98: if(0==flag_RFID_last && timeOutVal<=290 ||
		//;rfid125.c: 99: 1==flag_RFID_last && timeOutVal>290)
		LDR 	4FH,1 			//02B7 	08CF
		BTSS 	STATUS,2 		//02B8 	1D03
		LJUMP 	2C1H 			//02B9 	3AC1
		LDWI 	1H 			//02BA 	2A01
		SUBWR 	51H,0 			//02BB 	0C51
		ORG		02BCH
		LDWI 	23H 			//02BC 	2A23
		BTSC 	STATUS,2 		//02BD 	1503
		SUBWR 	50H,0 			//02BE 	0C50
		BTSS 	STATUS,0 		//02BF 	1C03
		LJUMP 	2CAH 			//02C0 	3ACA
		DECRSZ 	4FH,0 		//02C1 	0E4F
		LJUMP 	2DCH 			//02C2 	3ADC
		LDWI 	1H 			//02C3 	2A01
		ORG		02C4H
		SUBWR 	51H,0 			//02C4 	0C51
		LDWI 	23H 			//02C5 	2A23
		BTSC 	STATUS,2 		//02C6 	1503
		SUBWR 	50H,0 			//02C7 	0C50
		BTSS 	STATUS,0 		//02C8 	1C03
		LJUMP 	2DCH 			//02C9 	3ADC

		//;rfid125.c: 100: {
		//;rfid125.c: 101: if(!flag_RFID_last)
		LDR 	4FH,1 			//02CA 	08CF
		BTSS 	STATUS,2 		//02CB 	1D03
		ORG		02CCH
		LJUMP 	2D5H 			//02CC 	3AD5

		//;rfid125.c: 102: {
		//;rfid125.c: 103: timeOutVal=timerOut(1,290);
		LDWI 	22H 			//02CD 	2A22
		STR 	72H 			//02CE 	01F2
		LDWI 	1H 			//02CF 	2A01
		STR 	73H 			//02D0 	01F3
		LCALL 	429H 			//02D1 	3429

		//;rfid125.c: 104: if(timeOutVal==0) return 0;
		LCALL 	366H 			//02D2 	3366
		BTSC 	STATUS,2 		//02D3 	1503
		ORG		02D4H
		RETW 	0H 			//02D4 	2100

		//;rfid125.c: 105: }
		//;rfid125.c: 106: flag_RFID_last = 0;
		CLRR 	4FH 			//02D5 	014F

		//;rfid125.c: 107: RF_serial_55bits[i] <<= 1;
		LCALL 	36CH 			//02D6 	336C

		//;rfid125.c: 108: RF_serial_55bits[i] |= 0x01;
		LDR 	4EH,0 			//02D7 	084E
		ADDWI 	3FH 			//02D8 	273F
		STR 	FSR 			//02D9 	0184
		BSR 	INDF,0 			//02DA 	1800

		//;rfid125.c: 109: }
		LJUMP 	2FBH 			//02DB 	3AFB
		ORG		02DCH

		//;rfid125.c: 110: else
		//;rfid125.c: 111: if(0==flag_RFID_last && timeOutVal>290 ||
		//;rfid125.c: 112: 1==flag_RFID_last && timeOutVal<=290)
		LDR 	4FH,1 			//02DC 	08CF
		BTSS 	STATUS,2 		//02DD 	1D03
		LJUMP 	2E6H 			//02DE 	3AE6
		LDWI 	1H 			//02DF 	2A01
		SUBWR 	51H,0 			//02E0 	0C51
		LDWI 	23H 			//02E1 	2A23
		BTSC 	STATUS,2 		//02E2 	1503
		SUBWR 	50H,0 			//02E3 	0C50
		ORG		02E4H
		BTSC 	STATUS,0 		//02E4 	1403
		LJUMP 	2EFH 			//02E5 	3AEF
		DECRSZ 	4FH,0 		//02E6 	0E4F
		LJUMP 	2FBH 			//02E7 	3AFB
		LDWI 	1H 			//02E8 	2A01
		SUBWR 	51H,0 			//02E9 	0C51
		LDWI 	23H 			//02EA 	2A23
		BTSC 	STATUS,2 		//02EB 	1503
		ORG		02ECH
		SUBWR 	50H,0 			//02EC 	0C50
		BTSC 	STATUS,0 		//02ED 	1403
		LJUMP 	2FBH 			//02EE 	3AFB

		//;rfid125.c: 113: {
		//;rfid125.c: 114: if(flag_RFID_last)
		LDR 	4FH,0 			//02EF 	084F
		BTSC 	STATUS,2 		//02F0 	1503
		LJUMP 	2F8H 			//02F1 	3AF8

		//;rfid125.c: 115: {
		//;rfid125.c: 116: timeOutVal=timerOut(0,600);
		LDWI 	58H 			//02F2 	2A58
		LCALL 	379H 			//02F3 	3379
		ORG		02F4H
		LCALL 	429H 			//02F4 	3429

		//;rfid125.c: 117: if(timeOutVal==0) return 0;
		LCALL 	366H 			//02F5 	3366
		BTSC 	STATUS,2 		//02F6 	1503
		RETW 	0H 			//02F7 	2100

		//;rfid125.c: 118: }
		//;rfid125.c: 119: flag_RFID_last = 1;
		CLRR 	4FH 			//02F8 	014F
		INCR	4FH,1 			//02F9 	09CF

		//;rfid125.c: 120: RF_serial_55bits[i] <<= 1;
		LCALL 	36CH 			//02FA 	336C
		LDWI 	37H 			//02FB 	2A37
		ORG		02FCH
		INCR	52H,1 			//02FC 	09D2
		SUBWR 	52H,0 			//02FD 	0C52
		BTSS 	STATUS,0 		//02FE 	1C03
		LJUMP 	2ADH 			//02FF 	3AAD

		//;rfid125.c: 121: }
		//;rfid125.c: 122: }
		//;rfid125.c: 123: if(55==ii)
		LDR 	52H,0 			//0300 	0852
		XORWI 	37H 			//0301 	2637
		BTSS 	STATUS,2 		//0302 	1D03
		RETW 	0H 			//0303 	2100
		ORG		0304H

		//;rfid125.c: 124: {
		//;rfid125.c: 125: even_col = 0;
		CLRR 	4BH 			//0304 	014B

		//;rfid125.c: 126: for(ii=0;ii<10;ii++)
		CLRR 	52H 			//0305 	0152

		//;rfid125.c: 127: {
		//;rfid125.c: 128: even_row = (RF_serial_55bits[ii] & 0x01);
		LDR 	52H,0 			//0306 	0852
		ADDWI 	3FH 			//0307 	273F
		STR 	FSR 			//0308 	0184
		BCR 	STATUS,7 		//0309 	1383
		LDR 	INDF,0 			//030A 	0800
		STR 	4CH 			//030B 	01CC
		ORG		030CH
		LDWI 	1H 			//030C 	2A01
		ANDWR 	4CH,1 			//030D 	02CC

		//;rfid125.c: 129: for(j=1;j<5;j++)
		CLRR 	4DH 			//030E 	014D
		INCR	4DH,1 			//030F 	09CD

		//;rfid125.c: 130: {
		//;rfid125.c: 131: even_row = even_row ^ ((RF_serial_55bits[ii]>>j) & 0x01);
		LDR 	52H,0 			//0310 	0852
		ADDWI 	3FH 			//0311 	273F
		STR 	FSR 			//0312 	0184
		LDR 	INDF,0 			//0313 	0800
		ORG		0314H
		STR 	77H 			//0314 	01F7
		INCR	4DH,0 			//0315 	094D
		LJUMP 	319H 			//0316 	3B19
		BCR 	STATUS,0 		//0317 	1003
		RRR	77H,1 			//0318 	06F7
		ADDWI 	FFH 			//0319 	27FF
		BTSS 	STATUS,2 		//031A 	1D03
		LJUMP 	317H 			//031B 	3B17
		ORG		031CH
		LDR 	77H,0 			//031C 	0877
		ANDWI 	1H 			//031D 	2401
		XORWR 	4CH,1 			//031E 	04CC
		LDWI 	5H 			//031F 	2A05
		INCR	4DH,1 			//0320 	09CD
		SUBWR 	4DH,0 			//0321 	0C4D
		BTSS 	STATUS,0 		//0322 	1C03
		LJUMP 	310H 			//0323 	3B10
		ORG		0324H

		//;rfid125.c: 132: }
		//;rfid125.c: 133: if(even_row & 0x01)
		BTSC 	4CH,0 			//0324 	144C
		RETW 	0H 			//0325 	2100

		//;rfid125.c: 136: }
		//;rfid125.c: 138: RF_serial_55bits[ii] <<= 3;
		LDR 	52H,0 			//0326 	0852
		ADDWI 	3FH 			//0327 	273F
		STR 	FSR 			//0328 	0184
		RLR 	INDF,1 			//0329 	0580
		RLR 	INDF,1 			//032A 	0580
		RLR 	INDF,0 			//032B 	0500
		ORG		032CH
		ANDWI 	F8H 			//032C 	24F8
		STR 	INDF 			//032D 	0180

		//;rfid125.c: 140: i = RF_serial_55bits[ii];
		LDR 	52H,0 			//032E 	0852
		ADDWI 	3FH 			//032F 	273F
		STR 	FSR 			//0330 	0184
		LDR 	INDF,0 			//0331 	0800
		STR 	4EH 			//0332 	01CE

		//;rfid125.c: 141: if( 0==ii%2 )
		BTSC 	52H,0 			//0333 	1452
		ORG		0334H
		LJUMP 	342H 			//0334 	3B42

		//;rfid125.c: 142: {
		//;rfid125.c: 143: keyID[ii/2] = (i & 0xF0);
		BCR 	STATUS,0 		//0335 	1003
		RRR	52H,0 			//0336 	0652
		ADDWI 	60H 			//0337 	2760
		STR 	FSR 			//0338 	0184
		LDR 	4EH,0 			//0339 	084E
		STR 	INDF 			//033A 	0180
		BCR 	STATUS,0 		//033B 	1003
		ORG		033CH
		RRR	52H,0 			//033C 	0652
		ADDWI 	60H 			//033D 	2760
		STR 	FSR 			//033E 	0184
		LDWI 	F0H 			//033F 	2AF0
		ANDWR 	INDF,1 		//0340 	0280

		//;rfid125.c: 144: }
		LJUMP 	34CH 			//0341 	3B4C
		LDWI 	FH 			//0342 	2A0F

		//;rfid125.c: 145: else
		//;rfid125.c: 146: {
		//;rfid125.c: 147: i >>=4;
		SWAPR 	4EH,1 			//0343 	07CE
		ORG		0344H
		ANDWR 	4EH,1 			//0344 	02CE

		//;rfid125.c: 148: keyID[ii/2] |= (i & 0x0F);
		BCR 	STATUS,0 		//0345 	1003
		RRR	52H,0 			//0346 	0652
		ADDWI 	60H 			//0347 	2760
		STR 	FSR 			//0348 	0184
		LDR 	4EH,0 			//0349 	084E
		ANDWI 	FH 			//034A 	240F
		IORWR 	INDF,1 		//034B 	0380
		ORG		034CH

		//;rfid125.c: 149: }
		//;rfid125.c: 150: even_col ^= RF_serial_55bits[ii];
		LDR 	52H,0 			//034C 	0852
		ADDWI 	3FH 			//034D 	273F
		STR 	FSR 			//034E 	0184
		LDR 	INDF,0 			//034F 	0800
		XORWR 	4BH,1 			//0350 	04CB
		LDWI 	AH 			//0351 	2A0A
		INCR	52H,1 			//0352 	09D2
		SUBWR 	52H,0 			//0353 	0C52
		ORG		0354H
		BTSS 	STATUS,0 		//0354 	1C03
		LJUMP 	306H 			//0355 	3B06

		//;rfid125.c: 151: }
		//;rfid125.c: 152: RF_serial_55bits[10] <<= 3;
		RLR 	49H,1 			//0356 	05C9
		RLR 	49H,1 			//0357 	05C9
		RLR 	49H,0 			//0358 	0549
		ANDWI 	F8H 			//0359 	24F8
		STR 	49H 			//035A 	01C9
		LDWI 	F0H 			//035B 	2AF0
		ORG		035CH

		//;rfid125.c: 153: keyID[0] =0x00;
		CLRR 	60H 			//035C 	0160

		//;rfid125.c: 154: if(((RF_serial_55bits[10] & 0xf0)==(even_col & 0xf0)) && (0==(RF_serial
		//+                          _55bits[10]&0x08)))
		ANDWR 	4BH,0 			//035D 	024B
		STR 	77H 			//035E 	01F7
		LDR 	49H,0 			//035F 	0849
		ANDWI 	F0H 			//0360 	24F0
		XORWR 	77H,0 			//0361 	0477
		BTSC 	STATUS,2 		//0362 	1503
		BTSC 	49H,3 			//0363 	15C9
		ORG		0364H
		RETW 	0H 			//0364 	2100

		//;rfid125.c: 155: {
		//;rfid125.c: 157: return 1;
		RETW 	1H 			//0365 	2101
		LDR 	73H,0 			//0366 	0873
		STR 	51H 			//0367 	01D1
		LDR 	72H,0 			//0368 	0872
		STR 	50H 			//0369 	01D0
		IORWR 	51H,0 			//036A 	0351
		RET		 					//036B 	0004
		ORG		036CH
		LDR 	4EH,0 			//036C 	084E
		ADDWI 	3FH 			//036D 	273F
		STR 	FSR 			//036E 	0184
		BCR 	STATUS,7 		//036F 	1383
		BCR 	STATUS,0 		//0370 	1003
		RLR 	INDF,1 			//0371 	0580
		RET		 					//0372 	0004
		LDWI 	58H 			//0373 	2A58
		ORG		0374H
		STR 	72H 			//0374 	01F2
		LDWI 	2H 			//0375 	2A02
		STR 	73H 			//0376 	01F3
		LDR 	4FH,0 			//0377 	084F
		RET		 					//0378 	0004
		STR 	72H 			//0379 	01F2
		LDWI 	2H 			//037A 	2A02
		STR 	73H 			//037B 	01F3
		ORG		037CH
		RETW 	0H 			//037C 	2100
		STR 	7BH 			//037D 	01FB

		//;MAIN.C: 144: id=(id-1)*5;
		LDWI 	5H 			//037E 	2A05
		STR 	72H 			//037F 	01F2
		LDR 	7BH,0 			//0380 	087B
		ADDWI 	FFH 			//0381 	27FF
		LCALL 	59EH 			//0382 	359E
		STR 	7BH 			//0383 	01FB
		ORG		0384H

		//;MAIN.C: 145: {
		//;MAIN.C: 146: {
		//;MAIN.C: 147: *(buff+id) = *Cont;
		LDR 	3FH,0 			//0384 	083F
		STR 	FSR 			//0385 	0184
		BCR 	STATUS,7 		//0386 	1383
		LDR 	INDF,0 			//0387 	0800
		STR 	41H 			//0388 	01C1
		LDR 	7BH,0 			//0389 	087B
		ADDWR 	40H,0 			//038A 	0B40
		STR 	42H 			//038B 	01C2
		ORG		038CH
		STR 	FSR 			//038C 	0184
		LDR 	41H,0 			//038D 	0841
		STR 	INDF 			//038E 	0180

		//;MAIN.C: 148: *(buff+1+id) = *(Cont+1);
		LDR 	3FH,0 			//038F 	083F
		ADDWI 	1H 			//0390 	2701
		LCALL 	3B1H 			//0391 	33B1
		ADDWI 	1H 			//0392 	2701
		STR 	FSR 			//0393 	0184
		ORG		0394H
		LDR 	41H,0 			//0394 	0841
		STR 	INDF 			//0395 	0180

		//;MAIN.C: 149: *(buff+2+id) = *(Cont+2);
		LDR 	3FH,0 			//0396 	083F
		ADDWI 	2H 			//0397 	2702
		LCALL 	3B1H 			//0398 	33B1
		ADDWI 	2H 			//0399 	2702
		STR 	FSR 			//039A 	0184
		LDR 	41H,0 			//039B 	0841
		ORG		039CH
		STR 	INDF 			//039C 	0180

		//;MAIN.C: 150: *(buff+3+id) = *(Cont+3);
		LDR 	3FH,0 			//039D 	083F
		ADDWI 	3H 			//039E 	2703
		LCALL 	3B1H 			//039F 	33B1
		ADDWI 	3H 			//03A0 	2703
		STR 	FSR 			//03A1 	0184
		LDR 	41H,0 			//03A2 	0841
		STR 	INDF 			//03A3 	0180
		ORG		03A4H

		//;MAIN.C: 151: *(buff+4+id) = *(Cont+4);
		LDR 	3FH,0 			//03A4 	083F
		ADDWI 	4H 			//03A5 	2704
		LCALL 	3B1H 			//03A6 	33B1
		ADDWI 	4H 			//03A7 	2704
		STR 	FSR 			//03A8 	0184
		LDR 	41H,0 			//03A9 	0841
		STR 	INDF 			//03AA 	0180

		//;MAIN.C: 152: }
		//;MAIN.C: 153: }
		//;MAIN.C: 155: eepromWriteBlock(0x06,buffTag,25);
		LDWI 	26H 			//03AB 	2A26
		ORG		03ACH
		STR 	76H 			//03AC 	01F6
		LDWI 	19H 			//03AD 	2A19
		STR 	77H 			//03AE 	01F7
		LDWI 	6H 			//03AF 	2A06
		LJUMP 	52AH 			//03B0 	3D2A
		STR 	FSR 			//03B1 	0184
		LDR 	INDF,0 			//03B2 	0800
		STR 	41H 			//03B3 	01C1
		ORG		03B4H
		LDR 	7BH,0 			//03B4 	087B
		ADDWR 	40H,0 			//03B5 	0B40
		STR 	42H 			//03B6 	01C2
		RET		 					//03B7 	0004
		STR 	73H 			//03B8 	01F3
		LDWI 	8AH 			//03B9 	2A8A

		//;SWUART.C: 14: unsigned char i;
		//;SWUART.C: 16: RA2 = 0;
		BCR 	STATUS,5 		//03BA 	1283
		BCR 	STATUS,6 		//03BB 	1303
		ORG		03BCH
		BCR 	5H,2 			//03BC 	1105

		//;SWUART.C: 18: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
		STR 	72H 			//03BD 	01F2
		DECRSZ 	72H,1 		//03BE 	0EF2
		LJUMP 	3BEH 			//03BF 	3BBE
		CLRWDT	 			//03C0 	0001

		//;SWUART.C: 19: for(i=0;i<8;i++){
		CLRR 	74H 			//03C1 	0174

		//;SWUART.C: 20: RA2 = (dat&1);
		BTSS 	73H,0 			//03C2 	1C73
		LJUMP 	3C8H 			//03C3 	3BC8
		ORG		03C4H
		BCR 	STATUS,5 		//03C4 	1283
		BCR 	STATUS,6 		//03C5 	1303
		BSR 	5H,2 			//03C6 	1905
		LJUMP 	3CBH 			//03C7 	3BCB
		BCR 	STATUS,5 		//03C8 	1283
		BCR 	STATUS,6 		//03C9 	1303
		BCR 	5H,2 			//03CA 	1105
		LDWI 	8AH 			//03CB 	2A8A
		ORG		03CCH

		//;SWUART.C: 21: dat=dat>>1;
		BCR 	STATUS,0 		//03CC 	1003
		RRR	73H,1 			//03CD 	06F3

		//;SWUART.C: 23: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
		STR 	72H 			//03CE 	01F2
		DECRSZ 	72H,1 		//03CF 	0EF2
		LJUMP 	3CFH 			//03D0 	3BCF
		CLRWDT	 			//03D1 	0001
		LDWI 	8H 			//03D2 	2A08
		INCR	74H,1 			//03D3 	09F4
		ORG		03D4H
		SUBWR 	74H,0 			//03D4 	0C74
		BTSS 	STATUS,0 		//03D5 	1C03
		LJUMP 	3C2H 			//03D6 	3BC2
		LDWI 	8AH 			//03D7 	2A8A

		//;SWUART.C: 24: }
		//;SWUART.C: 29: RA2 = 1;
		BCR 	STATUS,5 		//03D8 	1283
		BCR 	STATUS,6 		//03D9 	1303
		BSR 	5H,2 			//03DA 	1905

		//;SWUART.C: 31: _delay((unsigned long)(((2000000/9600))*(8000000/4000000.0)));
		STR 	72H 			//03DB 	01F2
		ORG		03DCH
		DECRSZ 	72H,1 		//03DC 	0EF2
		LJUMP 	3DCH 			//03DD 	3BDC
		CLRWDT	 			//03DE 	0001
		RET		 					//03DF 	0004
		STR 	79H 			//03E0 	01F9

		//;SWUART.C: 43: unsigned char nib = num>>4;
		SWAPR 	79H,0 			//03E1 	0779
		ANDWI 	FH 			//03E2 	240F
		STR 	7AH 			//03E3 	01FA
		ORG		03E4H

		//;SWUART.C: 44: swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
		LDWI 	AH 			//03E4 	2A0A
		SUBWR 	7AH,0 			//03E5 	0C7A
		LDR 	7AH,0 			//03E6 	087A
		STR 	75H 			//03E7 	01F5
		BTSS 	STATUS,0 		//03E8 	1C03
		LJUMP 	3ECH 			//03E9 	3BEC
		LDWI 	37H 			//03EA 	2A37
		LJUMP 	3EDH 			//03EB 	3BED
		ORG		03ECH
		LDWI 	30H 			//03EC 	2A30
		CLRR 	76H 			//03ED 	0176
		ADDWR 	75H,1 			//03EE 	0BF5
		BTSC 	STATUS,0 		//03EF 	1403
		INCR	76H,1 			//03F0 	09F6
		LDR 	75H,0 			//03F1 	0875
		LCALL 	3B8H 			//03F2 	33B8

		//;SWUART.C: 45: nib = num&0x0f;
		LDR 	79H,0 			//03F3 	0879
		ORG		03F4H
		STR 	7AH 			//03F4 	01FA
		LDWI 	FH 			//03F5 	2A0F
		ANDWR 	7AH,1 			//03F6 	02FA

		//;SWUART.C: 46: swUartSendByte(nib <10 ? (nib+'0') :(nib+'A'-10));
		LDWI 	AH 			//03F7 	2A0A
		SUBWR 	7AH,0 			//03F8 	0C7A
		LDR 	7AH,0 			//03F9 	087A
		STR 	77H 			//03FA 	01F7
		BTSS 	STATUS,0 		//03FB 	1C03
		ORG		03FCH
		LJUMP 	3FFH 			//03FC 	3BFF
		LDWI 	37H 			//03FD 	2A37
		LJUMP 	400H 			//03FE 	3C00
		LDWI 	30H 			//03FF 	2A30
		CLRR 	78H 			//0400 	0178
		ADDWR 	77H,1 			//0401 	0BF7
		BTSC 	STATUS,0 		//0402 	1403
		INCR	78H,1 			//0403 	09F8
		ORG		0404H
		LDR 	77H,0 			//0404 	0877
		LJUMP 	3B8H 			//0405 	3BB8
		STR 	75H 			//0406 	01F5

		//;ms82_eeprom.c: 27: GIE = 0;
		BCR 	INTCON,7 		//0407 	138B

		//;ms82_eeprom.c: 29: {
		//;ms82_eeprom.c: 30: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//0408 	1F8B
		LJUMP 	40CH 			//0409 	3C0C
		CLRWDT	 			//040A 	0001
		LJUMP 	408H 			//040B 	3C08
		ORG		040CH

		//;ms82_eeprom.c: 31: EEADR = EEAddr;
		LDR 	75H,0 			//040C 	0875
		BSR 	STATUS,5 		//040D 	1A83
		BCR 	STATUS,6 		//040E 	1303
		STR 	1BH 			//040F 	019B

		//;ms82_eeprom.c: 32: EEDAT = EEData;
		LDR 	72H,0 			//0410 	0872
		STR 	1AH 			//0411 	019A
		LDWI 	34H 			//0412 	2A34

		//;ms82_eeprom.c: 33: EEIF = 0;
		BCR 	STATUS,5 		//0413 	1283
		ORG		0414H
		BCR 	CH,7 			//0414 	138C

		//;ms82_eeprom.c: 34: EECON1 = 0x34;
		BSR 	STATUS,5 		//0415 	1A83
		STR 	1CH 			//0416 	019C

		//;ms82_eeprom.c: 35: WR = 1;
		BSR 	1DH,0 			//0417 	181D

		//;ms82_eeprom.c: 36: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//0418 	1A83
		BCR 	STATUS,6 		//0419 	1303
		BTSS 	1DH,0 			//041A 	1C1D
		LJUMP 	41EH 			//041B 	3C1E
		ORG		041CH
		CLRWDT	 			//041C 	0001
		LJUMP 	418H 			//041D 	3C18

		//;ms82_eeprom.c: 37: _delay((unsigned long)((2)*(8000000/4000.0)));
		LDWI 	6H 			//041E 	2A06
		STR 	74H 			//041F 	01F4
		LDWI 	30H 			//0420 	2A30
		STR 	73H 			//0421 	01F3
		DECRSZ 	73H,1 		//0422 	0EF3
		LJUMP 	422H 			//0423 	3C22
		ORG		0424H
		DECRSZ 	74H,1 		//0424 	0EF4
		LJUMP 	422H 			//0425 	3C22
		CLRWDT	 			//0426 	0001

		//;ms82_eeprom.c: 38: }
		//;ms82_eeprom.c: 39: GIE = 1;
		BSR 	INTCON,7 		//0427 	1B8B
		RET		 					//0428 	0004
		STR 	74H 			//0429 	01F4

		//;rfid125.c: 7: unsigned int CurTimer;
		//;rfid125.c: 8: TMR1ON = 0;
		BCR 	10H,0 			//042A 	1010

		//;rfid125.c: 9: TMR1H = 0;
		CLRR 	FH 			//042B 	010F
		ORG		042CH

		//;rfid125.c: 10: TMR1L = 0;
		CLRR 	EH 			//042C 	010E

		//;rfid125.c: 11: TMR1IF = 0;
		BCR 	CH,0 			//042D 	100C

		//;rfid125.c: 12: TMR1ON = 1;
		BSR 	10H,0 			//042E 	1810

		//;rfid125.c: 13: while(RA4==Logic){
		LDWI 	0H 			//042F 	2A00
		BTSC 	5H,4 			//0430 	1605
		LDWI 	1H 			//0431 	2A01
		XORWR 	74H,0 			//0432 	0474
		BTSS 	STATUS,2 		//0433 	1D03
		ORG		0434H
		LJUMP 	445H 			//0434 	3C45

		//;rfid125.c: 14: CurTimer= (TMR1H <<8 )| TMR1L;
		LDR 	FH,0 			//0435 	080F
		STR 	76H 			//0436 	01F6
		CLRR 	75H 			//0437 	0175
		LDR 	EH,0 			//0438 	080E
		IORWR 	75H,1 			//0439 	03F5

		//;rfid125.c: 15: if(CurTimer>time)
		LDR 	76H,0 			//043A 	0876
		SUBWR 	73H,0 			//043B 	0C73
		ORG		043CH
		BTSS 	STATUS,2 		//043C 	1D03
		LJUMP 	440H 			//043D 	3C40
		LDR 	75H,0 			//043E 	0875
		SUBWR 	72H,0 			//043F 	0C72
		BTSC 	STATUS,0 		//0440 	1403
		LJUMP 	42FH 			//0441 	3C2F

		//;rfid125.c: 16: return 0;
		CLRR 	72H 			//0442 	0172
		CLRR 	73H 			//0443 	0173
		ORG		0444H
		RET		 					//0444 	0004

		//;rfid125.c: 17: }
		//;rfid125.c: 18: return CurTimer;
		LDR 	76H,0 			//0445 	0876
		STR 	73H 			//0446 	01F3
		LDR 	75H,0 			//0447 	0875
		STR 	72H 			//0448 	01F2
		RET		 					//0449 	0004
		STR 	49H 			//044A 	01C9

		//;MAIN.C: 158: unsigned char tmp[5]={0xff,0xff,0xff,0xff,0xff};
		LDWI 	44H 			//044B 	2A44
		ORG		044CH
		STR 	FSR 			//044C 	0184
		LDR 	20H,0 			//044D 	0820
		BCR 	STATUS,7 		//044E 	1383
		STR 	INDF 			//044F 	0180
		INCR	FSR,1 			//0450 	0984
		LDR 	21H,0 			//0451 	0821
		STR 	INDF 			//0452 	0180
		INCR	FSR,1 			//0453 	0984
		ORG		0454H
		LDR 	22H,0 			//0454 	0822
		STR 	INDF 			//0455 	0180
		INCR	FSR,1 			//0456 	0984
		LDR 	23H,0 			//0457 	0823
		STR 	INDF 			//0458 	0180
		INCR	FSR,1 			//0459 	0984
		LDR 	24H,0 			//045A 	0824
		STR 	INDF 			//045B 	0180
		ORG		045CH
		LDR 	49H,0 			//045C 	0849
		SUBWR 	43H,0 			//045D 	0C43
		BTSS 	STATUS,0 		//045E 	1C03
		RET		 					//045F 	0004

		//;MAIN.C: 160: id_replate(idMin,tmp,buffTag);
		LDWI 	44H 			//0460 	2A44
		STR 	3FH 			//0461 	01BF
		LDWI 	26H 			//0462 	2A26
		STR 	40H 			//0463 	01C0
		ORG		0464H
		LDR 	49H,0 			//0464 	0849
		LCALL 	37DH 			//0465 	337D
		BCR 	STATUS,5 		//0466 	1283
		BCR 	STATUS,6 		//0467 	1303
		INCR	49H,1 			//0468 	09C9
		LJUMP 	45CH 			//0469 	3C5C
		RETW 	FFH 			//046A 	21FF
		RETW 	FFH 			//046B 	21FF
		ORG		046CH
		RETW 	FFH 			//046C 	21FF
		RETW 	FFH 			//046D 	21FF
		RETW 	FFH 			//046E 	21FF
		RETW 	CH 			//046F 	210C
		RETW 	0H 			//0470 	2100
		RETW 	0H 			//0471 	2100
		RETW 	11H 			//0472 	2111
		RETW 	BH 			//0473 	210B
		ORG		0474H
		RETW 	4FH 			//0474 	214F
		RETW 	0H 			//0475 	2100
		RETW 	0H 			//0476 	2100
		RETW 	81H 			//0477 	2181
		RETW 	2FH 			//0478 	212F
		RETW 	22H 			//0479 	2122
		RETW 	0H 			//047A 	2100
		RETW 	0H 			//047B 	2100
		ORG		047CH
		RETW 	7DH 			//047C 	217D
		RETW 	67H 			//047D 	2167
		RETW 	5H 			//047E 	2105
		RETW 	0H 			//047F 	2100
		RETW 	0H 			//0480 	2100
		RETW 	7EH 			//0481 	217E
		RETW 	31H 			//0482 	2131
		RETW 	E7H 			//0483 	21E7
		ORG		0484H
		RETW 	0H 			//0484 	2100
		RETW 	0H 			//0485 	2100
		RETW 	7EH 			//0486 	217E
		RETW 	51H 			//0487 	2151
		RETW 	E6H 			//0488 	21E6
		STR 	78H 			//0489 	01F8

		//;ms82_eeprom.c: 53: unsigned char i;
		//;ms82_eeprom.c: 55: if(len1!=len2)
		LDR 	73H,0 			//048A 	0873
		XORWR 	74H,0 			//048B 	0474
		ORG		048CH
		BTSS 	STATUS,2 		//048C 	1D03

		//;ms82_eeprom.c: 56: return 0;
		RETW 	0H 			//048D 	2100

		//;ms82_eeprom.c: 57: else{
		//;ms82_eeprom.c: 58: for(i=0;i<len1;i++){
		CLRR 	79H 			//048E 	0179
		LDR 	73H,0 			//048F 	0873
		SUBWR 	79H,0 			//0490 	0C79

		//;ms82_eeprom.c: 59: if(*(arr1+i) != *(arr2+i)){
		LDR 	79H,0 			//0491 	0879
		BTSC 	STATUS,0 		//0492 	1403
		LJUMP 	4A4H 			//0493 	3CA4
		ORG		0494H
		ADDWR 	72H,0 			//0494 	0B72
		STR 	75H 			//0495 	01F5
		STR 	FSR 			//0496 	0184
		BCR 	STATUS,7 		//0497 	1383
		LDR 	INDF,0 			//0498 	0800
		STR 	76H 			//0499 	01F6
		LDR 	79H,0 			//049A 	0879
		ADDWR 	78H,0 			//049B 	0B78
		ORG		049CH
		STR 	77H 			//049C 	01F7
		STR 	FSR 			//049D 	0184
		LDR 	INDF,0 			//049E 	0800
		XORWR 	76H,0 			//049F 	0476
		BTSS 	STATUS,2 		//04A0 	1D03
		RETW 	0H 			//04A1 	2100
		INCR	79H,1 			//04A2 	09F9
		LJUMP 	48FH 			//04A3 	3C8F
		ORG		04A4H

		//;ms82_eeprom.c: 61: }
		//;ms82_eeprom.c: 62: }
		//;ms82_eeprom.c: 63: if(i==len1)
		XORWR 	73H,0 			//04A4 	0473
		BTSC 	STATUS,2 		//04A5 	1503

		//;ms82_eeprom.c: 64: return 1;
		RETW 	1H 			//04A6 	2101
		RETW 	0H 			//04A7 	2100
		STR 	76H 			//04A8 	01F6

		//;MAIN.C: 57: TMR1ON = 1;T0IE = 1;
		BCR 	STATUS,5 		//04A9 	1283
		BCR 	STATUS,6 		//04AA 	1303
		BSR 	10H,0 			//04AB 	1810
		ORG		04ACH
		BSR 	INTCON,5 		//04AC 	1A8B

		//;MAIN.C: 59: while(rep--){
		DECR 	75H,1 			//04AD 	0DF5
		LDR 	75H,0 			//04AE 	0875
		XORWI 	FFH 			//04AF 	26FF
		BTSC 	STATUS,2 		//04B0 	1503
		LJUMP 	4C2H 			//04B1 	3CC2
		LDWI 	2AH 			//04B2 	2A2A

		//;MAIN.C: 60: TMR1ON = 1;T0IE = 1;
		BCR 	STATUS,5 		//04B3 	1283
		ORG		04B4H
		BCR 	STATUS,6 		//04B4 	1303
		BSR 	10H,0 			//04B5 	1810
		BSR 	INTCON,5 		//04B6 	1A8B

		//;MAIN.C: 61: buzFre=42;
		STR 	25H 			//04B7 	01A5

		//;MAIN.C: 62: delay_x10ms(delay);
		LDR 	76H,0 			//04B8 	0876
		LCALL 	570H 			//04B9 	3570
		LDWI 	14H 			//04BA 	2A14

		//;MAIN.C: 63: T0IE = 0;
		BCR 	INTCON,5 		//04BB 	128B
		ORG		04BCH

		//;MAIN.C: 64: TMR1ON = 0;RC0 =0;
		BCR 	STATUS,5 		//04BC 	1283
		BCR 	STATUS,6 		//04BD 	1303
		BCR 	10H,0 			//04BE 	1010
		BCR 	7H,0 			//04BF 	1007

		//;MAIN.C: 65: delay_x10ms(20);
		LCALL 	570H 			//04C0 	3570
		LJUMP 	4ADH 			//04C1 	3CAD

		//;MAIN.C: 66: }
		//;MAIN.C: 68: T0IE = 0;
		BCR 	INTCON,5 		//04C2 	128B
		RET		 					//04C3 	0004
		ORG		04C4H
		BCR 	STATUS,5 		//04C4 	1283
		BCR 	STATUS,6 		//04C5 	1303
		STR 	3FH 			//04C6 	01BF

		//;MAIN.C: 136: unsigned char i;
		//;MAIN.C: 137: for(i=0;i<21;i+=5){
		CLRR 	40H 			//04C7 	0140

		//;MAIN.C: 138: if(comArr(id_input,buff+i,5,5))
		LDR 	40H,0 			//04C8 	0840
		ADDWR 	7AH,0 			//04C9 	0B7A
		STR 	72H 			//04CA 	01F2
		LDWI 	5H 			//04CB 	2A05
		ORG		04CCH
		STR 	73H 			//04CC 	01F3
		STR 	74H 			//04CD 	01F4
		LDR 	3FH,0 			//04CE 	083F
		LCALL 	489H 			//04CF 	3489
		XORWI 	0H 			//04D0 	2600

		//;MAIN.C: 139: return i/5 +1;
		LDWI 	5H 			//04D1 	2A05
		BTSC 	STATUS,2 		//04D2 	1503
		LJUMP 	4DAH 			//04D3 	3CDA
		ORG		04D4H
		STR 	72H 			//04D4 	01F2
		LDR 	40H,0 			//04D5 	0840
		LCALL 	4E0H 			//04D6 	34E0
		STR 	7BH 			//04D7 	01FB
		INCR	7BH,0 			//04D8 	097B
		RET		 					//04D9 	0004
		ADDWR 	40H,1 			//04DA 	0BC0
		LDWI 	15H 			//04DB 	2A15
		ORG		04DCH
		SUBWR 	40H,0 			//04DC 	0C40
		BTSC 	STATUS,0 		//04DD 	1403

		//;MAIN.C: 140: }
		//;MAIN.C: 141: return 255;
		RETW 	FFH 			//04DE 	21FF
		LJUMP 	4C8H 			//04DF 	3CC8
		STR 	73H 			//04E0 	01F3
		CLRR 	75H 			//04E1 	0175
		LDR 	72H,0 			//04E2 	0872
		BTSC 	STATUS,2 		//04E3 	1503
		ORG		04E4H
		LJUMP 	4F9H 			//04E4 	3CF9
		CLRR 	74H 			//04E5 	0174
		INCR	74H,1 			//04E6 	09F4
		BTSC 	72H,7 			//04E7 	17F2
		LJUMP 	4ECH 			//04E8 	3CEC
		BCR 	STATUS,0 		//04E9 	1003
		RLR 	72H,1 			//04EA 	05F2
		LJUMP 	4E6H 			//04EB 	3CE6
		ORG		04ECH
		BCR 	STATUS,0 		//04EC 	1003
		RLR 	75H,1 			//04ED 	05F5
		LDR 	72H,0 			//04EE 	0872
		SUBWR 	73H,0 			//04EF 	0C73
		BTSS 	STATUS,0 		//04F0 	1C03
		LJUMP 	4F6H 			//04F1 	3CF6
		LDR 	72H,0 			//04F2 	0872
		SUBWR 	73H,1 			//04F3 	0CF3
		ORG		04F4H
		BSR 	75H,0 			//04F4 	1875
		BCR 	STATUS,0 		//04F5 	1003
		RRR	72H,1 			//04F6 	06F2
		DECRSZ 	74H,1 		//04F7 	0EF4
		LJUMP 	4ECH 			//04F8 	3CEC
		LDR 	75H,0 			//04F9 	0875
		RET		 					//04FA 	0004

		//;ms82_pwm.c: 12: TRISC |= 0b00000100;
		BSR 	7H,2 			//04FB 	1907
		ORG		04FCH

		//;ms82_pwm.c: 13: PR2 = 15;
		LDWI 	FH 			//04FC 	2A0F
		STR 	12H 			//04FD 	0192

		//;ms82_pwm.c: 14: EPWMR1L =0;
		BCR 	STATUS,5 		//04FE 	1283
		CLRR 	13H 			//04FF 	0113

		//;ms82_pwm.c: 15: EPWM1CON = 0b10011100;
		LDWI 	9CH 			//0500 	2A9C
		STR 	15H 			//0501 	0195

		//;ms82_pwm.c: 16: TMR2 = 0;
		CLRR 	11H 			//0502 	0111
		LDWI 	4H 			//0503 	2A04
		ORG		0504H

		//;ms82_pwm.c: 17: TMR2IF = 0;
		BCR 	CH,1 			//0504 	108C

		//;ms82_pwm.c: 18: T2CON = 0B00000100;
		STR 	12H 			//0505 	0192

		//;ms82_pwm.c: 19: while(TMR2IF==1) asm("clrwdt");
		BCR 	STATUS,5 		//0506 	1283
		BCR 	STATUS,6 		//0507 	1303
		BTSS 	CH,1 			//0508 	1C8C
		LJUMP 	50CH 			//0509 	3D0C
		CLRWDT	 			//050A 	0001
		LJUMP 	506H 			//050B 	3D06
		ORG		050CH

		//;ms82_pwm.c: 20: PWM1CON = 0b00010000;
		LDWI 	10H 			//050C 	2A10
		STR 	16H 			//050D 	0196

		//;ms82_pwm.c: 21: EPWM1AUX = 0b10001000;
		LDWI 	88H 			//050E 	2A88
		BSR 	STATUS,5 		//050F 	1A83
		STR 	10H 			//0510 	0190

		//;ms82_pwm.c: 22: TRISC &= 0b11111011;
		BCR 	7H,2 			//0511 	1107
		RET		 					//0512 	0004
		LDWI 	3FH 			//0513 	2A3F
		ORG		0514H
		CLRR 	5AH 			//0514 	015A
		CLRR 	5BH 			//0515 	015B
		CLRR 	5CH 			//0516 	015C
		CLRR 	5DH 			//0517 	015D
		CLRR 	5EH 			//0518 	015E
		CLRR 	5FH 			//0519 	015F
		CLRR 	60H 			//051A 	0160
		CLRR 	61H 			//051B 	0161
		ORG		051CH
		CLRR 	62H 			//051C 	0162
		CLRR 	63H 			//051D 	0163
		CLRR 	64H 			//051E 	0164
		BCR 	STATUS,7 		//051F 	1383
		STR 	7DH 			//0520 	01FD
		LDWI 	4H 			//0521 	2A04
		STR 	7EH 			//0522 	01FE
		LDWI 	6AH 			//0523 	2A6A
		ORG		0524H
		STR 	7FH 			//0524 	01FF
		LDWI 	20H 			//0525 	2A20
		STR 	FSR 			//0526 	0184
		LCALL 	584H 			//0527 	3584
		CLRR 	STATUS 			//0528 	0103
		LJUMP 	0BH 			//0529 	380B
		STR 	79H 			//052A 	01F9

		//;ms82_eeprom.c: 44: unsigned char i;
		//;ms82_eeprom.c: 45: for(i=0;i<len;i++){
		CLRR 	7AH 			//052B 	017A
		ORG		052CH
		LDR 	77H,0 			//052C 	0877
		SUBWR 	7AH,0 			//052D 	0C7A
		BTSC 	STATUS,0 		//052E 	1403
		RET		 					//052F 	0004

		//;ms82_eeprom.c: 46: eepromWriteByte(addStart+i,buff[i]);
		LDR 	7AH,0 			//0530 	087A
		ADDWR 	76H,0 			//0531 	0B76
		STR 	78H 			//0532 	01F8
		STR 	FSR 			//0533 	0184
		ORG		0534H
		BCR 	STATUS,7 		//0534 	1383
		LDR 	INDF,0 			//0535 	0800
		STR 	72H 			//0536 	01F2
		LDR 	7AH,0 			//0537 	087A
		ADDWR 	79H,0 			//0538 	0B79
		LCALL 	406H 			//0539 	3406
		INCR	7AH,1 			//053A 	09FA
		LJUMP 	52CH 			//053B 	3D2C
		ORG		053CH

		//;sysinit.c: 71: INTCON = 0B00000000;
		CLRR 	INTCON 			//053C 	010B

		//;sysinit.c: 72: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//053D 	1A83
		CLRR 	CH 			//053E 	010C

		//;sysinit.c: 73: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//053F 	1283
		CLRR 	CH 			//0540 	010C

		//;sysinit.c: 85: T0IF = 0;
		BCR 	INTCON,2 		//0541 	110B

		//;sysinit.c: 86: T0IE = 0;
		BCR 	INTCON,5 		//0542 	128B

		//;sysinit.c: 87: TMR1ON = 0;
		BCR 	10H,0 			//0543 	1010
		ORG		0544H

		//;sysinit.c: 89: TMR2IF = 0;
		BCR 	CH,1 			//0544 	108C

		//;sysinit.c: 90: TMR2IE = 0;
		BSR 	STATUS,5 		//0545 	1A83
		BCR 	CH,1 			//0546 	108C

		//;sysinit.c: 93: TMR1IF = 0;
		BCR 	STATUS,5 		//0547 	1283
		BCR 	CH,0 			//0548 	100C

		//;sysinit.c: 94: TMR1IE = 0;
		BSR 	STATUS,5 		//0549 	1A83
		BCR 	CH,0 			//054A 	100C

		//;sysinit.c: 96: PEIE = 0;
		BCR 	INTCON,6 		//054B 	130B
		ORG		054CH

		//;sysinit.c: 98: GIE = 1;
		BSR 	INTCON,7 		//054C 	1B8B
		RET		 					//054D 	0004
		STR 	77H 			//054E 	01F7

		//;ms82_eeprom.c: 19: unsigned char i;
		//;ms82_eeprom.c: 20: for(i=0;i<len;i++){
		CLRR 	78H 			//054F 	0178
		LDR 	75H,0 			//0550 	0875
		SUBWR 	78H,0 			//0551 	0C78
		BTSC 	STATUS,0 		//0552 	1403
		RET		 					//0553 	0004
		ORG		0554H

		//;ms82_eeprom.c: 21: buff[i] = eepromReadByte(addStart+i);
		LDR 	78H,0 			//0554 	0878
		ADDWR 	74H,0 			//0555 	0B74
		STR 	76H 			//0556 	01F6
		STR 	FSR 			//0557 	0184
		LDR 	78H,0 			//0558 	0878
		ADDWR 	77H,0 			//0559 	0B77
		LCALL 	5E5H 			//055A 	35E5
		BCR 	STATUS,7 		//055B 	1383
		ORG		055CH
		STR 	INDF 			//055C 	0180
		INCR	78H,1 			//055D 	09F8
		LJUMP 	550H 			//055E 	3D50

		//;MAIN.C: 98: if(T0IE&&T0IF)
		BTSC 	INTCON,5 		//055F 	168B
		BTSS 	INTCON,2 		//0560 	1D0B
		LJUMP 	569H 			//0561 	3D69

		//;MAIN.C: 99: {
		//;MAIN.C: 100: T0IF = 0;
		BCR 	INTCON,2 		//0562 	110B

		//;MAIN.C: 101: TMR0 = buzFre;
		BCR 	STATUS,5 		//0563 	1283
		ORG		0564H
		BCR 	STATUS,6 		//0564 	1303
		LDR 	25H,0 			//0565 	0825
		STR 	1H 			//0566 	0181

		//;MAIN.C: 102: RC0 = ~RC0;
		LDWI 	1H 			//0567 	2A01
		XORWR 	7H,1 			//0568 	0487
		LDR 	71H,0 			//0569 	0871
		STR 	PCLATH 			//056A 	018A
		SWAPR 	70H,0 			//056B 	0770
		ORG		056CH
		STR 	STATUS 			//056C 	0183
		SWAPR 	7EH,1 			//056D 	07FE
		SWAPR 	7EH,0 			//056E 	077E
		RETI		 			//056F 	0009
		STR 	74H 			//0570 	01F4

		//;MAIN.C: 53: while(t--)
		DECR 	74H,1 			//0571 	0DF4
		LDR 	74H,0 			//0572 	0874
		XORWI 	FFH 			//0573 	26FF
		ORG		0574H
		BTSC 	STATUS,2 		//0574 	1503
		RET		 					//0575 	0004

		//;MAIN.C: 54: _delay((unsigned long)((10)*(8000000/4000.0)));
		LDWI 	1AH 			//0576 	2A1A
		STR 	73H 			//0577 	01F3
		LDWI 	F8H 			//0578 	2AF8
		STR 	72H 			//0579 	01F2
		DECRSZ 	72H,1 		//057A 	0EF2
		LJUMP 	57AH 			//057B 	3D7A
		ORG		057CH
		DECRSZ 	73H,1 		//057C 	0EF3
		LJUMP 	57AH 			//057D 	3D7A
		CLRWDT	 			//057E 	0001
		LJUMP 	571H 			//057F 	3D71
		LDR 	7EH,0 			//0580 	087E
		STR 	PCLATH 			//0581 	018A
		LDR 	7FH,0 			//0582 	087F
		STR 	PCL 			//0583 	0182
		ORG		0584H
		LCALL 	580H 			//0584 	3580
		STR 	INDF 			//0585 	0180
		INCR	FSR,1 			//0586 	0984
		LDR 	FSR,0 			//0587 	0804
		XORWR 	7DH,0 			//0588 	047D
		BTSC 	STATUS,2 		//0589 	1503
		RETW 	0H 			//058A 	2100
		INCR	7FH,1 			//058B 	09FF
		ORG		058CH
		BTSC 	STATUS,2 		//058C 	1503
		INCR	7EH,1 			//058D 	09FE
		LJUMP 	584H 			//058E 	3D84

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//058F 	1283
		CLRR 	5H 			//0590 	0105

		//;sysinit.c: 35: TRISA = 0B01110011;
		LDWI 	73H 			//0591 	2A73
		BSR 	STATUS,5 		//0592 	1A83
		STR 	5H 			//0593 	0185
		ORG		0594H

		//;sysinit.c: 36: WPUA = 0B10010000;
		LDWI 	90H 			//0594 	2A90
		STR 	15H 			//0595 	0195

		//;sysinit.c: 37: PORTC = 0B00000010;
		LDWI 	2H 			//0596 	2A02
		BCR 	STATUS,5 		//0597 	1283
		STR 	7H 			//0598 	0187

		//;sysinit.c: 38: TRISC = 0B11111110;
		LDWI 	FEH 			//0599 	2AFE
		BSR 	STATUS,5 		//059A 	1A83
		STR 	7H 			//059B 	0187
		ORG		059CH

		//;sysinit.c: 39: WPUC = 0B00000000;
		CLRR 	8H 			//059C 	0108
		RET		 					//059D 	0004
		STR 	74H 			//059E 	01F4
		CLRR 	73H 			//059F 	0173
		LDR 	72H,0 			//05A0 	0872
		BTSC 	74H,0 			//05A1 	1474
		ADDWR 	73H,1 			//05A2 	0BF3
		BCR 	STATUS,0 		//05A3 	1003
		ORG		05A4H
		RLR 	72H,1 			//05A4 	05F2
		BCR 	STATUS,0 		//05A5 	1003
		RRR	74H,1 			//05A6 	06F4
		LDR 	74H,1 			//05A7 	08F4
		BTSS 	STATUS,2 		//05A8 	1D03
		LJUMP 	5A0H 			//05A9 	3DA0
		LDR 	73H,0 			//05AA 	0873
		RET		 					//05AB 	0004
		ORG		05ACH
		LDWI 	5H 			//05AC 	2A05
		STR 	PCLATH 			//05AD 	018A
		LDR 	FSR,0 			//05AE 	0804
		INCR	FSR,1 			//05AF 	0984
		ADDWR 	PCL,1 			//05B0 	0B82
		RETW 	0H 			//05B1 	2100
		RETW 	AH 			//05B2 	210A
		RETW 	54H 			//05B3 	2154
		ORG		05B4H
		RETW 	61H 			//05B4 	2161
		RETW 	67H 			//05B5 	2167
		RETW 	3AH 			//05B6 	213A
		RETW 	20H 			//05B7 	2120
		RETW 	0H 			//05B8 	2100
		STR 	75H 			//05B9 	01F5

		//;SWUART.C: 36: while(*str){
		LDR 	75H,0 			//05BA 	0875
		STR 	FSR 			//05BB 	0184
		ORG		05BCH
		LCALL 	5ACH 			//05BC 	35AC
		IORWI 	0H 			//05BD 	2500
		BTSC 	STATUS,2 		//05BE 	1503
		RET		 					//05BF 	0004

		//;SWUART.C: 37: swUartSendByte((char)*str);
		LDR 	75H,0 			//05C0 	0875
		STR 	FSR 			//05C1 	0184
		LCALL 	5ACH 			//05C2 	35AC
		LCALL 	3B8H 			//05C3 	33B8
		ORG		05C4H

		//;SWUART.C: 38: str++;
		INCR	75H,1 			//05C4 	09F5
		LJUMP 	5BAH 			//05C5 	3DBA
		STR 	74H 			//05C6 	01F4

		//;MAIN.C: 130: mtState = stt;
		BCR 	STATUS,5 		//05C7 	1283
		BCR 	STATUS,6 		//05C8 	1303
		STR 	5FH 			//05C9 	01DF

		//;MAIN.C: 131: timeTick =0;
		CLRR 	5CH 			//05CA 	015C
		CLRR 	5DH 			//05CB 	015D
		ORG		05CCH

		//;MAIN.C: 132: timeOut = _tOut;
		LDR 	73H,0 			//05CC 	0873
		STR 	5BH 			//05CD 	01DB
		LDR 	72H,0 			//05CE 	0872
		STR 	5AH 			//05CF 	01DA
		RET		 					//05D0 	0004

		//;sysinit.c: 21: OSCCON = 0B01100001;
		LDWI 	61H 			//05D1 	2A61
		BSR 	STATUS,5 		//05D2 	1A83
		BCR 	STATUS,6 		//05D3 	1303
		ORG		05D4H
		STR 	FH 			//05D4 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//05D5 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//05D6 	1A83
		BCR 	STATUS,6 		//05D7 	1303
		BTSC 	FH,2 			//05D8 	150F
		RET		 					//05D9 	0004
		LJUMP 	5D6H 			//05DA 	3DD6

		//;sysinit.c: 46: OPTION = 0B00000001;
		LDWI 	1H 			//05DB 	2A01
		ORG		05DCH
		STR 	1H 			//05DC 	0181

		//;sysinit.c: 59: TMR1H = -5000>>8;
		LDWI 	ECH 			//05DD 	2AEC
		BCR 	STATUS,5 		//05DE 	1283
		STR 	FH 			//05DF 	018F

		//;sysinit.c: 60: TMR1L = -5000;
		LDWI 	78H 			//05E0 	2A78
		STR 	EH 			//05E1 	018E

		//;sysinit.c: 61: T1CON = 0B00100001;
		LDWI 	21H 			//05E2 	2A21
		STR 	10H 			//05E3 	0190
		ORG		05E4H
		RET		 					//05E4 	0004
		STR 	72H 			//05E5 	01F2

		//;ms82_eeprom.c: 8: unsigned char ReEepromData;
		//;ms82_eeprom.c: 10: EEADR = EEAddr;
		BSR 	STATUS,5 		//05E6 	1A83
		BCR 	STATUS,6 		//05E7 	1303
		STR 	1BH 			//05E8 	019B

		//;ms82_eeprom.c: 11: RD = 1;
		BSR 	1CH,0 			//05E9 	181C

		//;ms82_eeprom.c: 12: ReEepromData = EEDAT;
		LDR 	1AH,0 			//05EA 	081A
		STR 	73H 			//05EB 	01F3
		ORG		05ECH

		//;ms82_eeprom.c: 13: RD = 0;
		BCR 	1CH,0 			//05EC 	101C

		//;ms82_eeprom.c: 14: return ReEepromData;
		RET		 					//05ED 	0004
		LJUMP 	116H 			//05EE 	3916
		LJUMP 	DAH 			//05EF 	38DA
		LJUMP 	DAH 			//05F0 	38DA
		LJUMP 	153H 			//05F1 	3953
		LJUMP 	19DH 			//05F2 	399D
		LJUMP 	172H 			//05F3 	3972
		ORG		05F4H
		LJUMP 	12AH 			//05F4 	392A
		LJUMP 	DAH 			//05F5 	38DA
			END
