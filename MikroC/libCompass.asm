
_ReadCompass:

;libCompass.c,4 :: 		int ReadCompass(char send_serial) {
;libCompass.c,5 :: 		char buffer[12] = {0};
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
	CLRF        ReadCompass_out_buffer_integer_L0+0 
	CLRF        ReadCompass_out_buffer_integer_L0+1 
;libCompass.c,12 :: 		TRISE = 0x09;
	MOVLW       9
	MOVWF       TRISE+0 
;libCompass.c,13 :: 		LATE = 0b1001;
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
;libCompass.c,20 :: 		buffer[0] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+0 
;libCompass.c,21 :: 		buffer[1] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+1 
;libCompass.c,22 :: 		buffer[2] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+2 
;libCompass.c,23 :: 		buffer[3] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+3 
;libCompass.c,24 :: 		buffer[4] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+4 
;libCompass.c,25 :: 		buffer[5] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+5 
;libCompass.c,26 :: 		buffer[6] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+6 
;libCompass.c,27 :: 		buffer[7] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+7 
;libCompass.c,28 :: 		buffer[8] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+8 
;libCompass.c,29 :: 		buffer[9] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+9 
;libCompass.c,30 :: 		buffer[10] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+10 
;libCompass.c,31 :: 		buffer[11] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+11 
;libCompass.c,32 :: 		buffer[12] = Soft_UART_Read(soft_uart_error);
	MOVF        ReadCompass_soft_uart_error_L0+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVLW       0
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_buffer_L0+12 
;libCompass.c,37 :: 		out_buffer_integer = FindDataFromBuffer(buffer, 12, 7);
	MOVLW       ReadCompass_buffer_L0+0
	MOVWF       FARG_FindDataFromBuffer_buffer+0 
	MOVLW       hi_addr(ReadCompass_buffer_L0+0)
	MOVWF       FARG_FindDataFromBuffer_buffer+1 
	MOVLW       12
	MOVWF       FARG_FindDataFromBuffer_buffer_length+0 
	MOVLW       7
	MOVWF       FARG_FindDataFromBuffer_data_length+0 
	CALL        _FindDataFromBuffer+0, 0
	MOVF        R0, 0 
	MOVWF       ReadCompass_out_buffer_integer_L0+0 
	MOVF        R1, 0 
	MOVWF       ReadCompass_out_buffer_integer_L0+1 
;libCompass.c,40 :: 		if (send_serial == 1) {
	MOVF        FARG_ReadCompass_send_serial+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ReadCompass1
;libCompass.c,41 :: 		UART1_Write(Skew(out_buffer_integer, 360, 255));
	MOVF        ReadCompass_out_buffer_integer_L0+0, 0 
	MOVWF       FARG_Skew_input+0 
	MOVF        ReadCompass_out_buffer_integer_L0+1, 0 
	MOVWF       FARG_Skew_input+1 
	MOVLW       104
	MOVWF       FARG_Skew_maximum+0 
	MOVLW       1
	MOVWF       FARG_Skew_maximum+1 
	MOVLW       255
	MOVWF       FARG_Skew_scaled_max+0 
	MOVLW       0
	MOVWF       FARG_Skew_scaled_max+1 
	CALL        _Skew+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;libCompass.c,42 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;libCompass.c,43 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;libCompass.c,44 :: 		}
L_ReadCompass1:
;libCompass.c,45 :: 		} else {
	GOTO        L_ReadCompass2
L_ReadCompass0:
;libCompass.c,46 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_ReadCompass
;libCompass.c,47 :: 		}
L_ReadCompass2:
;libCompass.c,48 :: 		}
L_end_ReadCompass:
	RETURN      0
; end of _ReadCompass

_FindDataFromBuffer:

;libCompass.c,50 :: 		int FindDataFromBuffer(char *buffer, char buffer_length, char data_length) {
;libCompass.c,51 :: 		int i=0;
	CLRF        FindDataFromBuffer_i_L0+0 
	CLRF        FindDataFromBuffer_i_L0+1 
	CLRF        FindDataFromBuffer_j_L0+0 
	CLRF        FindDataFromBuffer_j_L0+1 
	CLRF        FindDataFromBuffer_j_L0+2 
	CLRF        FindDataFromBuffer_j_L0+3 
	CLRF        FindDataFromBuffer_j_L0+4 
;libCompass.c,54 :: 		for (i; i<buffer_length-data_length; i++) {
L_FindDataFromBuffer3:
	MOVF        FARG_FindDataFromBuffer_data_length+0, 0 
	SUBWF       FARG_FindDataFromBuffer_buffer_length+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	XORWF       FindDataFromBuffer_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__FindDataFromBuffer12
	MOVF        R1, 0 
	SUBWF       FindDataFromBuffer_i_L0+0, 0 
L__FindDataFromBuffer12:
	BTFSC       STATUS+0, 0 
	GOTO        L_FindDataFromBuffer4
;libCompass.c,56 :: 		buffer[0+i] == 3 &&
	MOVF        FindDataFromBuffer_i_L0+0, 0 
	ADDWF       FARG_FindDataFromBuffer_buffer+0, 0 
	MOVWF       FSR0 
	MOVF        FindDataFromBuffer_i_L0+1, 0 
	ADDWFC      FARG_FindDataFromBuffer_buffer+1, 0 
	MOVWF       FSR0H 
;libCompass.c,57 :: 		buffer[1+i] == 2 &&
	MOVF        POSTINC0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_FindDataFromBuffer8
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
	GOTO        L_FindDataFromBuffer8
;libCompass.c,58 :: 		buffer[5+i] == 3 &&
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
	GOTO        L_FindDataFromBuffer8
;libCompass.c,59 :: 		buffer[6+i] == 2
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
	GOTO        L_FindDataFromBuffer8
;libCompass.c,60 :: 		)
L__FindDataFromBuffer9:
;libCompass.c,62 :: 		j[0] = buffer[2+i];
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
	MOVWF       FindDataFromBuffer_j_L0+0 
;libCompass.c,63 :: 		j[1] = buffer[3+i];
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
	MOVWF       FindDataFromBuffer_j_L0+1 
;libCompass.c,64 :: 		j[2] = buffer[4+i];
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
	MOVWF       FindDataFromBuffer_j_L0+2 
;libCompass.c,65 :: 		j[3] = '\0';
	CLRF        FindDataFromBuffer_j_L0+3 
;libCompass.c,67 :: 		return atoi(j);
	MOVLW       FindDataFromBuffer_j_L0+0
	MOVWF       FARG_atoi_s+0 
	MOVLW       hi_addr(FindDataFromBuffer_j_L0+0)
	MOVWF       FARG_atoi_s+1 
	CALL        _atoi+0, 0
	GOTO        L_end_FindDataFromBuffer
;libCompass.c,68 :: 		}
L_FindDataFromBuffer8:
;libCompass.c,54 :: 		for (i; i<buffer_length-data_length; i++) {
	INFSNZ      FindDataFromBuffer_i_L0+0, 1 
	INCF        FindDataFromBuffer_i_L0+1, 1 
;libCompass.c,70 :: 		}
	GOTO        L_FindDataFromBuffer3
L_FindDataFromBuffer4:
;libCompass.c,71 :: 		}
L_end_FindDataFromBuffer:
	RETURN      0
; end of _FindDataFromBuffer
