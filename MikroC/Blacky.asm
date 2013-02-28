
_main:

;Blacky.c,6 :: 		void main() {
;Blacky.c,7 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Blacky.c,8 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;Blacky.c,9 :: 		main_init();
	CALL        _main_init+0, 0
;Blacky.c,11 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;Blacky.c,12 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;Blacky.c,13 :: 		LATB = 0x00;
	CLRF        LATB+0 
;Blacky.c,14 :: 		LATD = 0;
	CLRF        LATD+0 
;Blacky.c,16 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Blacky.c,17 :: 		Delay_ms(100);
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
;Blacky.c,19 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,21 :: 		while(1){
L_main1:
;Blacky.c,22 :: 		err = ReadPing(&left, &front, &right);
	MOVLW       _left+0
	MOVWF       FARG_ReadPing_left+0 
	MOVLW       hi_addr(_left+0)
	MOVWF       FARG_ReadPing_left+1 
	MOVLW       _front+0
	MOVWF       FARG_ReadPing_front+0 
	MOVLW       hi_addr(_front+0)
	MOVWF       FARG_ReadPing_front+1 
	MOVLW       _right+0
	MOVWF       FARG_ReadPing_right+0 
	MOVLW       hi_addr(_right+0)
	MOVWF       FARG_ReadPing_right+1 
	CALL        _ReadPing+0, 0
	MOVF        R0, 0 
	MOVWF       _err+0 
	MOVF        R1, 0 
	MOVWF       _err+1 
;Blacky.c,24 :: 		UART1_Write(left);
	MOVF        _left+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,25 :: 		UART1_Write(front);
	MOVF        _front+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,26 :: 		UART1_Write(right);
	MOVF        _right+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,28 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,29 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,31 :: 		ReadCompass(1);
	MOVLW       1
	MOVWF       FARG_ReadCompass+0 
	CALL        _ReadCompass+0, 0
;Blacky.c,33 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;Blacky.c,35 :: 		if (test == 0) {
	MOVLW       0
	XORWF       _test+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVLW       0
	XORWF       _test+0, 0 
L__main7:
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
;Blacky.c,36 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Blacky.c,37 :: 		test = 1;
	MOVLW       1
	MOVWF       _test+0 
	MOVLW       0
	MOVWF       _test+1 
;Blacky.c,38 :: 		} else {
	GOTO        L_main5
L_main4:
;Blacky.c,39 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,40 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;Blacky.c,41 :: 		}
L_main5:
;Blacky.c,42 :: 		}
	GOTO        L_main1
;Blacky.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
