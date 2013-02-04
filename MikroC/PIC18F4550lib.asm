
____init_core___:

;PIC18F4550lib.c,3 :: 		void ___init_core___() {
;PIC18F4550lib.c,4 :: 		ADCON1 = 0x0F; // page 268, disable analaog
	MOVLW       15
	MOVWF       ADCON1+0 
;PIC18F4550lib.c,5 :: 		CMCON = 0x07; // disable comparator
	MOVLW       7
	MOVWF       CMCON+0 
;PIC18F4550lib.c,6 :: 		INTCON2 = 0x80; // disable pull up in port b
	MOVLW       128
	MOVWF       INTCON2+0 
;PIC18F4550lib.c,8 :: 		LATA = 0x00; // Make all output ports 0
	CLRF        LATA+0 
;PIC18F4550lib.c,9 :: 		LATC = 0x00; // Make all output ports 0
	CLRF        LATC+0 
;PIC18F4550lib.c,10 :: 		LATD = 0x00; // Make all output ports 0
	CLRF        LATD+0 
;PIC18F4550lib.c,11 :: 		LATE = 0x00; // Make all output ports 0
	CLRF        LATE+0 
;PIC18F4550lib.c,13 :: 		TRISA = 0x03; // Make 00000011 directional ports.
	MOVLW       3
	MOVWF       TRISA+0 
;PIC18F4550lib.c,14 :: 		TRISC = 0x00; // Make all ports output
	CLRF        TRISC+0 
;PIC18F4550lib.c,15 :: 		TRISD = 0x00; // Make all ports output
	CLRF        TRISD+0 
;PIC18F4550lib.c,16 :: 		TRISE = 0x00; // Make all ports output
	CLRF        TRISE+0 
;PIC18F4550lib.c,18 :: 		PORTA = 0x00; // Make all ports 0
	CLRF        PORTA+0 
;PIC18F4550lib.c,19 :: 		PORTC = 0x00; // Make all ports 0
	CLRF        PORTC+0 
;PIC18F4550lib.c,20 :: 		PORTD = 0x00; // Make all ports 0
	CLRF        PORTD+0 
;PIC18F4550lib.c,21 :: 		PORTE = 0x00; // Make all ports 0
	CLRF        PORTE+0 
;PIC18F4550lib.c,23 :: 		LATA = 0x03;
	MOVLW       3
	MOVWF       LATA+0 
;PIC18F4550lib.c,24 :: 		}
L_end____init_core___:
	RETURN      0
; end of ____init_core___

_main_init:

;PIC18F4550lib.c,26 :: 		void main_init() {
;PIC18F4550lib.c,27 :: 		___init_core___();
	CALL        ____init_core___+0, 0
;PIC18F4550lib.c,28 :: 		}
L_end_main_init:
	RETURN      0
; end of _main_init
