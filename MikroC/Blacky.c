#include "PIC18F4550lib.h"
#include "corePing.h"
#include "Blacky.h"

void main() {
    ADCON1 |= 0x0F;
    CMCON  |= 7;
    main_init();

    TRISD = 0x2A;
    TRISB = 0x00;
    LATB = 0x00;
    LATD = 0;

    UART1_Init(9600);
    Delay_ms(100);

    while(1){
        err = ReadPing(&left, &front, &right);

        UART1_Write(0);
        Delay_ms(1000);
        LATB = !PORTB;
    }
}