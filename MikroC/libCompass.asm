
_ReadCompass:

;libCompass.c,5 :: 		unsigned char ReadCompass(unsigned char send_serial, unsigned char * read_data) {
;libCompass.c,6 :: 		unsigned char buffer[12] = {0};
	CLRF        ReadCompass_buffer_L0+0 
	CLRF        ReadCompass_buffer_L0+1 
	CLRF        ReadCompass_buffer_L0+2 
	CLRF        ReadCompass_buffer_L0+3 
	CLRF        ReadCompass_buffer_L0+4 
	CLRF        ReadCompass_buffer_L0+5 
	CLRF        ReadCompass_buffer_L0+6 
	CLRF        ReadCompass_buffer_L0+7 
	CLRF        ReadCompass_buffer_L0+8 
	CLRF        ReadCompass_buffer_L0+9 
	CLRF        ReadCompass_buffer_L0+10 
	CLRF        ReadCompass_buffer_L0+11 
;libCompass.c,11 :: 		TRISE = 0x09;
	MOVLW       9
	MOVWF       TRISE+0 
;libCompass.c,12 :: 		LATE = 0b1001;
	MOVLW       9
	MOVWF       LATE+0 
;libCompass.c,15 :: 		if (Soft_UART_Init(&PORTE, 0, 1, 9600, 0) == 0) {
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
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadCompass0
;libCompass.c,21 :: 		buffer[0] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+0 
;libCompass.c,22 :: 		buffer[1] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+1 
;libCompass.c,23 :: 		buffer[2] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+2 
;libCompass.c,24 :: 		buffer[3] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+3 
;libCompass.c,25 :: 		buffer[4] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+4 
;libCompass.c,26 :: 		buffer[5] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+5 
;libCompass.c,27 :: 		buffer[6] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+6 
;libCompass.c,28 :: 		buffer[7] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+7 
;libCompass.c,29 :: 		buffer[8] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+8 
;libCompass.c,30 :: 		buffer[9] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+9 
;libCompass.c,31 :: 		buffer[10] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+10 
;libCompass.c,32 :: 		buffer[11] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+11 
;libCompass.c,33 :: 		buffer[12] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+12 
;libCompass.c,38 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_ReadCompass1:
	DECFSZ      R13, 1, 1
	BRA         L_ReadCompass1
	DECFSZ      R12, 1, 1
	BRA         L_ReadCompass1
	NOP
	NOP
;libCompass.c,39 :: 		out_buffer_integer = FindDataFromBuffer(buffer, 12, 7, read_data, send_serial);
	MOVLW       ReadCompass_buffer_L0+0
	MOVWF       FARG_FindDataFromBuffer_buffer+0 
	MOVLW       hi_addr(ReadCompass_buffer_L0+0)
	MOVWF       FARG_FindDataFromBuffer_buffer+1 
	MOVLW       12
	MOVWF       FARG_FindDataFromBuffer_buffer_length+0 
	MOVLW       7
	MOVWF       FARG_FindDataFromBuffer_data_length+0 
	MOVF        FARG_ReadCompass_read_data+0, 0 
	MOVWF       FARG_FindDataFromBuffer_read_data+0 
	MOVF        FARG_ReadCompass_read_data+1, 0 
	MOVWF       FARG_FindDataFromBuffer_read_data+1 
	MOVF        FARG_ReadCompass_send_serial+0, 0 
	MOVWF       FARG_FindDataFromBuffer_send_serial+0 
	CALL        _FindDataFromBuffer+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_out_buffer_integer_L0+0 
	MOVF        R1, 0 
	MOVWF       ReadCompass_out_buffer_integer_L0+1 
;libCompass.c,40 :: 		Delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_ReadCompass2:
	DECFSZ      R13, 1, 1
	BRA         L_ReadCompass2
	DECFSZ      R12, 1, 1
	BRA         L_ReadCompass2
	NOP
	NOP
;libCompass.c,42 :: 		return Skew(out_buffer_integer, 359, 124);
	MOVF        ReadCompass_out_buffer_integer_L0+0, 0 
	MOVWF       R0 
	MOVF        ReadCompass_out_buffer_integer_L0+1, 0 
	MOVWF       R1 
	CALL        _Word2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Skew_cnt+0 
	MOVF        R1, 0 
	MOVWF       FARG_Skew_cnt+1 
	MOVF        R2, 0 
	MOVWF       FARG_Skew_cnt+2 
	MOVF        R3, 0 
	MOVWF       FARG_Skew_cnt+3 
	MOVLW       0
	MOVWF       FARG_Skew_max+0 
	MOVLW       128
	MOVWF       FARG_Skew_max+1 
	MOVLW       51
	MOVWF       FARG_Skew_max+2 
	MOVLW       135
	MOVWF       FARG_Skew_max+3 
	MOVLW       0
	MOVWF       FARG_Skew_scale+0 
	MOVLW       0
	MOVWF       FARG_Skew_scale+1 
	MOVLW       120
	MOVWF       FARG_Skew_scale+2 
	MOVLW       133
	MOVWF       FARG_Skew_scale+3 
	CALL        _Skew+0, 0
	GOTO        L_end_ReadCompass
;libCompass.c,43 :: 		} else {
L_ReadCompass0:
;libCompass.c,44 :: 		if (send_serial == 1) {
	MOVF        FARG_ReadCompass_send_serial+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadCompass4
;libCompass.c,45 :: 		transmit_rf(0xFF);
	MOVLW       255
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;libCompass.c,46 :: 		transmit_rf(0xFF);
	MOVLW       255
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;libCompass.c,47 :: 		transmit_rf(0xFF);
	MOVLW       255
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;libCompass.c,48 :: 		}
L_ReadCompass4:
;libCompass.c,50 :: 		return 0;
	CLRF        R0 
;libCompass.c,51 :: 		}
L_end_ReadCompass:
	RETURN      0
; end of _ReadCompass

_FindDataFromBuffer:

;libCompass.c,53 :: 		unsigned int FindDataFromBuffer(unsigned char *buffer, unsigned char buffer_length, unsigned char data_length, unsigned char * read_data, unsigned char send_serial) {
;libCompass.c,54 :: 		unsigned int i=0;
	CLRF        FindDataFromBuffer_i_L0+0 
	CLRF        FindDataFromBuffer_i_L0+1 
;libCompass.c,56 :: 		for (i; i<buffer_length-data_length; i++) {
L_FindDataFromBuffer5:
	MOVF        FARG_FindDataFromBuffer_data_length+0, 0 
	SUBWF       FARG_FindDataFromBuffer_buffer_length+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVF        R2, 0 
	SUBWF       FindDataFromBuffer_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FindDataFromBuffer15
	MOVF        R1, 0 
	SUBWF       FindDataFromBuffer_i_L0+0, 0 
L__FindDataFromBuffer15:
	BTFSC       STATUS+0, 0 
	GOTO        L_FindDataFromBuffer6
;libCompass.c,58 :: 		buffer[0+i] == 3 &&
	MOVF        FindDataFromBuffer_i_L0+0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        FindDataFromBuffer_i_L0+1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
;libCompass.c,59 :: 		buffer[1+i] == 2 &&
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_FindDataFromBuffer10
	MOVLW       1
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_FindDataFromBuffer10
;libCompass.c,60 :: 		buffer[5+i] == 3 &&
	MOVLW       5
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_FindDataFromBuffer10
;libCompass.c,61 :: 		buffer[6+i] == 2
	MOVLW       6
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_FindDataFromBuffer10
;libCompass.c,62 :: 		)
L__FindDataFromBuffer12:
;libCompass.c,64 :: 		read_data[0] = buffer[2+i];
	MOVLW       2
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVFF       FARG_FindDataFromBuffer_read_data+0, FSR1
	MOVFF       FARG_FindDataFromBuffer_read_data+1, FSR1H
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;libCompass.c,65 :: 		read_data[1] = buffer[3+i];
	MOVLW       1
	ADDWF       FARG_FindDataFromBuffer_read_data+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_FindDataFromBuffer_read_data+1, 0 
	MOVWF       FSR1H 
	MOVLW       3
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;libCompass.c,66 :: 		read_data[2] = buffer[4+i];
	MOVLW       2
	ADDWF       FARG_FindDataFromBuffer_read_data+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_FindDataFromBuffer_read_data+1, 0 
	MOVWF       FSR1H 
	MOVLW       4
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;libCompass.c,68 :: 		if (send_serial) {
	MOVF        FARG_FindDataFromBuffer_send_serial+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_FindDataFromBuffer11
;libCompass.c,69 :: 		transmit_rf(buffer[2+i]);
	MOVLW       2
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;libCompass.c,70 :: 		transmit_rf(buffer[3+i]);
	MOVLW       3
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;libCompass.c,71 :: 		transmit_rf(buffer[4+i]);
	MOVLW       4
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_transmit_rf_input+0 
	CALL        _transmit_rf+0, 0
;libCompass.c,72 :: 		}
L_FindDataFromBuffer11:
;libCompass.c,75 :: 		((buffer[2+i]-48) * 100) +
	MOVLW       2
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       100
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__FindDataFromBuffer+0 
	MOVF        R1, 0 
	MOVWF       FLOC__FindDataFromBuffer+1 
	MOVLW       3
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
;libCompass.c,76 :: 		((buffer[3+i]-48) * 10) +
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       10
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__FindDataFromBuffer+0, 0 
	MOVWF       R2 
	MOVF        R1, 0 
	ADDWFC      FLOC__FindDataFromBuffer+1, 0 
	MOVWF       R3 
;libCompass.c,77 :: 		((buffer[4+i]-48) * 1)
	MOVLW       4
	ADDWF       FindDataFromBuffer_i_L0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        R1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
	MOVLW       48
	SUBWF       POSTINC0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R2, 0 
	ADDWF       R0, 1 
	MOVF        R3, 0 
	ADDWFC      R1, 1 
;libCompass.c,78 :: 		);
	GOTO        L_end_FindDataFromBuffer
;libCompass.c,79 :: 		}
L_FindDataFromBuffer10:
;libCompass.c,56 :: 		for (i; i<buffer_length-data_length; i++) {
	INFSNZ      FindDataFromBuffer_i_L0+0, 1 
	INCF        FindDataFromBuffer_i_L0+1, 1 
;libCompass.c,81 :: 		}
	GOTO        L_FindDataFromBuffer5
L_FindDataFromBuffer6:
;libCompass.c,83 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
;libCompass.c,84 :: 		}
L_end_FindDataFromBuffer:
	RETURN      0
; end of _FindDataFromBuffer
