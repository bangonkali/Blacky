#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libRF.c"
int transmit_rf(char input) {
 if (Soft_UART_Init(&PORTD, 6, 7, 9600, 0) == 0) {
 Soft_UART_Write(input);
 return 0;
 } else {
 return 1;
 }
}
