#include "PIC18F4550lib.h"
#include "libCompass.h"
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

    test = 0;

    while(1){
        err = ReadPing(&left, &front, &right);

        UART1_Write(left);
        UART1_Write(front);
        UART1_Write(right);
        
        UART1_Write(0x0D);
        UART1_Write(0x0A);
        
        ReadCompass(1);
        
        Delay_ms(1000);

        if (test == 0) {
           PORTB = 0xFF;
           test = 1;
        } else {
           test = 0;
           PORTB = 0x00;
        }
    }
}