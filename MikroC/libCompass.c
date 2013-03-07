#include "libBlacky.h"
#include "libCompass.h"
#include "libRF.h"

unsigned char ReadCompass(unsigned char send_serial, unsigned char * read_data) {
    unsigned char buffer[12] = {0};
    unsigned char soft_uart_error;
    unsigned char skewed_output_integer;
    unsigned int out_buffer_integer;
    
    TRISE = 0x09;
    LATE = 0b1001;
    // Delay_us(20);
    
    if (Soft_UART_Init(&PORTE, 0, 1, 9600, 0) == 0) {
        // Delay_us(20);
    
        // ingon ani nalang para mo work. kai kung mag social2
        // pa ug loop2 murag ma gubot ang Soft_UART_Read tungod
        // sa extra overhead sa looping mechanism. 
        buffer[0] = Soft_UART_Read(soft_uart_error);
        buffer[1] = Soft_UART_Read(soft_uart_error);
        buffer[2] = Soft_UART_Read(soft_uart_error);
        buffer[3] = Soft_UART_Read(soft_uart_error);
        buffer[4] = Soft_UART_Read(soft_uart_error);
        buffer[5] = Soft_UART_Read(soft_uart_error);
        buffer[6] = Soft_UART_Read(soft_uart_error);
        buffer[7] = Soft_UART_Read(soft_uart_error);
        buffer[8] = Soft_UART_Read(soft_uart_error);
        buffer[9] = Soft_UART_Read(soft_uart_error);
        buffer[10] = Soft_UART_Read(soft_uart_error);
        buffer[11] = Soft_UART_Read(soft_uart_error);
        buffer[12] = Soft_UART_Read(soft_uart_error);
        
        // after gikuha ang daghan na data samples, ayha pa
        // pangitaon kung aha dadto ang actual data. 2x ang sample
        // para ma sure2 jud na naay data makuha sa sulod.
        Delay_ms(20);
        out_buffer_integer = FindDataFromBuffer(buffer, 12, 7, read_data, send_serial);
        Delay_ms(20);
        
        return Skew(out_buffer_integer, 359, 124);
    } else {
        if (send_serial == 1) {
            transmit_rf(0xFF);
            transmit_rf(0xFF);
            transmit_rf(0xFF);
        }
    }
    return 0;
}

unsigned int FindDataFromBuffer(unsigned char *buffer, unsigned char buffer_length, unsigned char data_length, unsigned char * read_data, unsigned char send_serial) {
    unsigned int i=0;
    
    for (i; i<buffer_length-data_length; i++) {
        if (
            buffer[0+i] == 3 && 
            buffer[1+i] == 2 && 
            buffer[5+i] == 3 && 
            buffer[6+i] == 2
            ) 
        {
            read_data[0] = buffer[2+i]; 
            read_data[1] = buffer[3+i];
            read_data[2] = buffer[4+i];
            
            if (send_serial) {
                transmit_rf(buffer[2+i]);
                transmit_rf(buffer[3+i]);
                transmit_rf(buffer[4+i]);
            }
            
            return (
                ((buffer[2+i]-48) * 100) +
                ((buffer[3+i]-48) * 10) +
                ((buffer[4+i]-48) * 1)
            );
        }   
            
    }
    
    return 0;
}
