
_main:

;Blacky.c,8 :: 		void main() {
;Blacky.c,9 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Blacky.c,10 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;Blacky.c,11 :: 		main_init();
	CALL        _main_init+0, 0
;Blacky.c,13 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;Blacky.c,14 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;Blacky.c,15 :: 		LATB = 0x00;
	CLRF        LATB+0 
;Blacky.c,16 :: 		LATD = 0;
	CLRF        LATD+0 
;Blacky.c,18 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Blacky.c,19 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	DECFSZ      R11, 1, 1
	BRA         L_main0
	NOP
;Blacky.c,21 :: 		while(1){
L_main1:
;Blacky.c,22 :: 		count_distance[0] =0;
	CLRF        _count_distance+0 
	CLRF        _count_distance+1 
	CLRF        _count_distance+2 
	CLRF        _count_distance+3 
;Blacky.c,23 :: 		count_distance[2] =0;
	CLRF        _count_distance+8 
	CLRF        _count_distance+9 
	CLRF        _count_distance+10 
	CLRF        _count_distance+11 
;Blacky.c,24 :: 		count_distance[1] =0;
	CLRF        _count_distance+4 
	CLRF        _count_distance+5 
	CLRF        _count_distance+6 
	CLRF        _count_distance+7 
;Blacky.c,26 :: 		LATD = 0x01;
	MOVLW       1
	MOVWF       LATD+0 
;Blacky.c,27 :: 		Delay_us(20);
	MOVLW       13
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
;Blacky.c,28 :: 		LATD = 0x00;
	CLRF        LATD+0 
;Blacky.c,29 :: 		while (PORTD.RD1 == 0)
L_main4:
	BTFSC       PORTD+0, 1 
	GOTO        L_main5
;Blacky.c,30 :: 		count_distance[0] = 0;
	CLRF        _count_distance+0 
	CLRF        _count_distance+1 
	CLRF        _count_distance+2 
	CLRF        _count_distance+3 
	GOTO        L_main4
L_main5:
;Blacky.c,31 :: 		while (PORTD.RD1 == 1)
L_main6:
	BTFSS       PORTD+0, 1 
	GOTO        L_main7
;Blacky.c,33 :: 		count_distance[0]++;
	MOVLW       1
	ADDWF       _count_distance+0, 1 
	MOVLW       0
	ADDWFC      _count_distance+1, 1 
	ADDWFC      _count_distance+2, 1 
	ADDWFC      _count_distance+3, 1 
;Blacky.c,34 :: 		}
	GOTO        L_main6
L_main7:
;Blacky.c,35 :: 		if (count_distance[0] > 1000)
	MOVF        _count_distance+3, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        _count_distance+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        _count_distance+1, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main23
	MOVF        _count_distance+0, 0 
	SUBLW       232
L__main23:
	BTFSC       STATUS+0, 0 
	GOTO        L_main8
;Blacky.c,36 :: 		count_distance[0] = 1000;
	MOVLW       232
	MOVWF       _count_distance+0 
	MOVLW       3
	MOVWF       _count_distance+1 
	MOVLW       0
	MOVWF       _count_distance+2 
	MOVWF       _count_distance+3 
L_main8:
;Blacky.c,38 :: 		calculation[0] = (255*count_distance[0]/1000);
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        _count_distance+0, 0 
	MOVWF       R4 
	MOVF        _count_distance+1, 0 
	MOVWF       R5 
	MOVF        _count_distance+2, 0 
	MOVWF       R6 
	MOVF        _count_distance+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	CALL        _Longword2Double+0, 0
	MOVF        R0, 0 
	MOVWF       _calculation+0 
	MOVF        R1, 0 
	MOVWF       _calculation+1 
	MOVF        R2, 0 
	MOVWF       _calculation+2 
	MOVF        R3, 0 
	MOVWF       _calculation+3 
;Blacky.c,39 :: 		finalcount[0] = calculation[0];
	CALL        _Double2Byte+0, 0
	MOVF        R0, 0 
	MOVWF       _finalcount+0 
;Blacky.c,40 :: 		UART1_Write(finalcount[0]);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,42 :: 		LATD = 0x04;
	MOVLW       4
	MOVWF       LATD+0 
;Blacky.c,43 :: 		Delay_us(20);
	MOVLW       13
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
;Blacky.c,44 :: 		LATD = 0x00;
	CLRF        LATD+0 
;Blacky.c,45 :: 		while (PORTD.RD3 == 0)
L_main10:
	BTFSC       PORTD+0, 3 
	GOTO        L_main11
;Blacky.c,46 :: 		count_distance[1] = 0;
	CLRF        _count_distance+4 
	CLRF        _count_distance+5 
	CLRF        _count_distance+6 
	CLRF        _count_distance+7 
	GOTO        L_main10
L_main11:
;Blacky.c,47 :: 		while (PORTD.RD3 == 1)
L_main12:
	BTFSS       PORTD+0, 3 
	GOTO        L_main13
;Blacky.c,49 :: 		count_distance[1]++;
	MOVLW       1
	ADDWF       _count_distance+4, 1 
	MOVLW       0
	ADDWFC      _count_distance+5, 1 
	ADDWFC      _count_distance+6, 1 
	ADDWFC      _count_distance+7, 1 
;Blacky.c,50 :: 		}
	GOTO        L_main12
L_main13:
;Blacky.c,51 :: 		if (count_distance[1] > 1000)
	MOVF        _count_distance+7, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVF        _count_distance+6, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVF        _count_distance+5, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main24
	MOVF        _count_distance+4, 0 
	SUBLW       232
L__main24:
	BTFSC       STATUS+0, 0 
	GOTO        L_main14
;Blacky.c,52 :: 		count_distance[1] = 1000;
	MOVLW       232
	MOVWF       _count_distance+4 
	MOVLW       3
	MOVWF       _count_distance+5 
	MOVLW       0
	MOVWF       _count_distance+6 
	MOVWF       _count_distance+7 
L_main14:
;Blacky.c,54 :: 		calculation[1] = (255*count_distance[1]/1000);
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        _count_distance+4, 0 
	MOVWF       R4 
	MOVF        _count_distance+5, 0 
	MOVWF       R5 
	MOVF        _count_distance+6, 0 
	MOVWF       R6 
	MOVF        _count_distance+7, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	CALL        _Longword2Double+0, 0
	MOVF        R0, 0 
	MOVWF       _calculation+4 
	MOVF        R1, 0 
	MOVWF       _calculation+5 
	MOVF        R2, 0 
	MOVWF       _calculation+6 
	MOVF        R3, 0 
	MOVWF       _calculation+7 
;Blacky.c,55 :: 		finalcount[1] = calculation[1];
	CALL        _Double2Byte+0, 0
	MOVF        R0, 0 
	MOVWF       _finalcount+1 
;Blacky.c,56 :: 		UART1_Write(finalcount[1]);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,58 :: 		LATD = 0x10;
	MOVLW       16
	MOVWF       LATD+0 
;Blacky.c,59 :: 		Delay_us(20);
	MOVLW       13
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
;Blacky.c,61 :: 		LATD = 0x00;
	CLRF        LATD+0 
;Blacky.c,62 :: 		while (PORTD.RD5 == 0)
L_main16:
	BTFSC       PORTD+0, 5 
	GOTO        L_main17
;Blacky.c,63 :: 		count_distance[2] = 0;
	CLRF        _count_distance+8 
	CLRF        _count_distance+9 
	CLRF        _count_distance+10 
	CLRF        _count_distance+11 
	GOTO        L_main16
L_main17:
;Blacky.c,64 :: 		while (PORTD.RD5 == 1)
L_main18:
	BTFSS       PORTD+0, 5 
	GOTO        L_main19
;Blacky.c,66 :: 		count_distance[2]++;
	MOVLW       1
	ADDWF       _count_distance+8, 1 
	MOVLW       0
	ADDWFC      _count_distance+9, 1 
	ADDWFC      _count_distance+10, 1 
	ADDWFC      _count_distance+11, 1 
;Blacky.c,67 :: 		}
	GOTO        L_main18
L_main19:
;Blacky.c,68 :: 		if (count_distance[2] > 1000)
	MOVF        _count_distance+11, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVF        _count_distance+10, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVF        _count_distance+9, 0 
	SUBLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L__main25
	MOVF        _count_distance+8, 0 
	SUBLW       232
L__main25:
	BTFSC       STATUS+0, 0 
	GOTO        L_main20
;Blacky.c,69 :: 		count_distance[2] = 1000;
	MOVLW       232
	MOVWF       _count_distance+8 
	MOVLW       3
	MOVWF       _count_distance+9 
	MOVLW       0
	MOVWF       _count_distance+10 
	MOVWF       _count_distance+11 
L_main20:
;Blacky.c,71 :: 		calculation[2] = (255*count_distance[2]/1000);
	MOVLW       255
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVWF       R2 
	MOVWF       R3 
	MOVF        _count_distance+8, 0 
	MOVWF       R4 
	MOVF        _count_distance+9, 0 
	MOVWF       R5 
	MOVF        _count_distance+10, 0 
	MOVWF       R6 
	MOVF        _count_distance+11, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_U+0, 0
	MOVLW       232
	MOVWF       R4 
	MOVLW       3
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVWF       R7 
	CALL        _Div_32x32_U+0, 0
	CALL        _Longword2Double+0, 0
	MOVF        R0, 0 
	MOVWF       _calculation+8 
	MOVF        R1, 0 
	MOVWF       _calculation+9 
	MOVF        R2, 0 
	MOVWF       _calculation+10 
	MOVF        R3, 0 
	MOVWF       _calculation+11 
;Blacky.c,72 :: 		finalcount[2] = calculation[2];
	CALL        _Double2Byte+0, 0
	MOVF        R0, 0 
	MOVWF       _finalcount+2 
;Blacky.c,73 :: 		UART1_Write(finalcount[2]);
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,76 :: 		UART1_Write(0);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,77 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main21:
	DECFSZ      R13, 1, 1
	BRA         L_main21
	DECFSZ      R12, 1, 1
	BRA         L_main21
	DECFSZ      R11, 1, 1
	BRA         L_main21
	NOP
	NOP
;Blacky.c,78 :: 		LATB = !PORTB;
	MOVF        PORTB+0, 1 
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       LATB+0 
;Blacky.c,79 :: 		}
	GOTO        L_main1
;Blacky.c,80 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
