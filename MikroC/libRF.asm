
_transmit_rf:

;libRF.c,1 :: 		unsigned int transmit_rf(unsigned char input) {
;libRF.c,2 :: 		if (Soft_UART_Init(&PORTD, 6, 7, 9600, 0) == 0) {
	MOVLW       PORTD+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       6
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       7
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
	GOTO        L_transmit_rf0
;libRF.c,3 :: 		Soft_UART_Write(input);
	MOVF        FARG_transmit_rf_input+0, 0 
	MOVWF       FARG_Soft_UART_Write_udata+0 
	CALL        _Soft_UART_Write+0, 0
;libRF.c,4 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_transmit_rf
;libRF.c,5 :: 		} else {
L_transmit_rf0:
;libRF.c,6 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
;libRF.c,8 :: 		}
L_end_transmit_rf:
	RETURN      0
; end of _transmit_rf

_read_rf:

;libRF.c,10 :: 		unsigned char read_rf(unsigned char *error) {
;libRF.c,11 :: 		if (Soft_UART_Init(&PORTD, 6, 7, 9600, 0) == 0) {
	MOVLW       PORTD+0
	MOVWF       FARG_Soft_UART_Init_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Soft_UART_Init_port+1 
	MOVLW       6
	MOVWF       FARG_Soft_UART_Init_rx_pin+0 
	MOVLW       7
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
	GOTO        L_read_rf2
;libRF.c,12 :: 		return Soft_UART_Read(error);
	MOVF        FARG_read_rf_error+0, 0 
	MOVWF       FARG_Soft_UART_Read_error+0 
	MOVF        FARG_read_rf_error+1, 0 
	MOVWF       FARG_Soft_UART_Read_error+1 
	CALL        _Soft_UART_Read+0, 0
	GOTO        L_end_read_rf
;libRF.c,13 :: 		} else {
L_read_rf2:
;libRF.c,14 :: 		return 0;
	CLRF        R0 
;libRF.c,16 :: 		}
L_end_read_rf:
	RETURN      0
; end of _read_rf
