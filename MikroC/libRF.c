unsigned int transmit_rf(unsigned char input) {
    if (Soft_UART_Init(&PORTD, 6, 7, 9600, 0) == 0) {
        Soft_UART_Write(input);
        return 0;
    } else {
        return 1;
    }
}

unsigned char read_rf(unsigned char *error) {
    if (Soft_UART_Init(&PORTD, 6, 7, 9600, 0) == 0) {
        return Soft_UART_Read(error);
    } else {
        return 0;
    }
}

