#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/PIC18F4550lib.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/pic18f4550lib.h"



void ___init_core___();
void main_init();
#line 3 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/PIC18F4550lib.c"
void ___init_core___() {
 ADCON1 = 0x0F;
 CMCON = 0x07;
 INTCON2 = 0x80;

 LATA = 0x00;
 LATC = 0x00;
 LATD = 0x00;
 LATE = 0x00;

 TRISA = 0x03;
 TRISC = 0x00;
 TRISD = 0x00;
 TRISE = 0x00;

 PORTA = 0x00;
 PORTC = 0x00;
 PORTD = 0x00;
 PORTE = 0x00;

 LATA = 0x03;
}

void main_init() {
 ___init_core___();
}
