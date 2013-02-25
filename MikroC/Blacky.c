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

    UART1_Init(115200);
    Delay_ms(100);

    test = 0;
    soft_uart_error = Soft_UART_Init(&PORTE, 0, 1, 9600, 0); // Initialize Soft UART at 14400 bps

    while(1){
        err = ReadPing(&left, &front, &right);

        UART1_Write(left);
        UART1_Write(front);
        UART1_Write(right);
        
        
        
        UART1_Write(0x00);
        UART1_Write(0x0D);
        UART1_Write(0x0A);
        
        while (Soft_UART_Read(&soft_uart_read_error) != 2){}
        UART1_Write(Soft_UART_Read(&soft_uart_read_error));
        UART1_Write(Soft_UART_Read(&soft_uart_read_error));
        UART1_Write(Soft_UART_Read(&soft_uart_read_error));

        UART1_Write(0xFF);
        UART1_Write(0x00);
        UART1_Write(0x0D);
        UART1_Write(0x0A);
        
        Delay_ms(5000);

        if (test == 0) {
           PORTB = 0xFF;
           test = 1;
        } else {
           test = 0;
           PORTB = 0x00;
        }
    }
}