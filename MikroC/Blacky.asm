
_main:

;Blacky.c,5 :: 		void main() {
;Blacky.c,6 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Blacky.c,7 :: 		CMCON  |= 7;
	MOVLW       7
	IORWF       CMCON+0, 1 
;Blacky.c,8 :: 		main_init();
	CALL        _main_init+0, 0
;Blacky.c,10 :: 		TRISD = 0x2A;
	MOVLW       42
	MOVWF       TRISD+0 
;Blacky.c,11 :: 		TRISB = 0x00;
	CLRF        TRISB+0 
;Blacky.c,12 :: 		LATB = 0x00;
	CLRF        LATB+0 
;Blacky.c,13 :: 		LATD = 0;
	CLRF        LATD+0 
;Blacky.c,15 :: 		UART1_Init(115200);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       16
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Blacky.c,16 :: 		Delay_ms(100);
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
;Blacky.c,18 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,19 :: 		soft_uart_error = Soft_UART_Init(&PORTE, 0, 1, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW       PORTE+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	CLRF        FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       1
	MOVWF       FARG_Soft_UART_Init_tx_pin+0 
	MOVLW       128
	MOVWF       FARG_Soft_UART_Init_baud_rate+0 
	MOVLW       37
	MOVWF       FARG_Soft_UART_Init_baud_rate+1 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Init_baud_rate+2 
	MOVWF       FARG_Soft_UART_Init_baud_rate+3 
	CLRF        FARG_Soft_UART_Init_inverted+0 
	CALL        _Soft_UART_Init+0, 0
	MOVF        R0, 0 
	MOVWF       _soft_uart_error+0 
	MOVLW       0
	MOVWF       _soft_uart_error+1 
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
;Blacky.c,27 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,28 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,29 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,31 :: 		while (Soft_UART_Read(&soft_uart_read_error) != 2){}
L_main3:
	MOVLW       _soft_uart_read_error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_soft_uart_read_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;Blacky.c,32 :: 		UART1_Write(Soft_UART_Read(&soft_uart_read_error));
	MOVLW       _soft_uart_read_error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_soft_uart_read_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,33 :: 		UART1_Write(Soft_UART_Read(&soft_uart_read_error));
	MOVLW       _soft_uart_read_error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_soft_uart_read_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,34 :: 		UART1_Write(Soft_UART_Read(&soft_uart_read_error));
	MOVLW       _soft_uart_read_error+0
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       hi_addr(_soft_uart_read_error+0)
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,36 :: 		UART1_Write(0xFF);
	MOVLW       255
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,37 :: 		UART1_Write(0x00);
	CLRF        FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,38 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,39 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Blacky.c,41 :: 		Delay_ms(5000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;Blacky.c,43 :: 		if (test == 0) {
	MOVLW       0
	XORWF       _test+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main9
	MOVLW       0
	XORWF       _test+0, 0 
L__main9:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Blacky.c,44 :: 		PORTB = 0xFF;
	MOVLW       255
	MOVWF       PORTB+0 
;Blacky.c,45 :: 		test = 1;
	MOVLW       1
	MOVWF       _test+0 
	MOVLW       0
	MOVWF       _test+1 
;Blacky.c,46 :: 		} else {
	GOTO        L_main7
L_main6:
;Blacky.c,47 :: 		test = 0;
	CLRF        _test+0 
	CLRF        _test+1 
;Blacky.c,48 :: 		PORTB = 0x00;
	CLRF        PORTB+0 
;Blacky.c,49 :: 		}
L_main7:
;Blacky.c,50 :: 		}
	GOTO        L_main1
;Blacky.c,51 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
