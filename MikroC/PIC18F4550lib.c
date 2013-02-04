#include "PIC18F4550lib.h"

void ___init_core___() {
	ADCON1 = 0x0F; // page 268, disable analaog
	CMCON = 0x07; // disable comparator
	INTCON2 = 0x80; // disable pull up in port b

	LATA = 0x00; // Make all output ports 0
	LATC = 0x00; // Make all output ports 0
	LATD = 0x00; // Make all output ports 0
	LATE = 0x00; // Make all output ports 0

	TRISA = 0x03; // Make 00000011 directional ports.
	TRISC = 0x00; // Make all ports output
	TRISD = 0x00; // Make all ports output
	TRISE = 0x00; // Make all ports output

	PORTA = 0x00; // Make all ports 0
	PORTC = 0x00; // Make all ports 0
	PORTD = 0x00; // Make all ports 0
	PORTE = 0x00; // Make all ports 0

	LATA = 0x03;
}

void main_init() {
     ___init_core___();
}

