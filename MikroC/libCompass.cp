#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libCompass.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libblacky.h"



char Skew(int input, int maximum, int scaled_max);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libcompass.h"



int ReadCompass(char);
int FindDataFromBuffer(char *buffer, char buffer_length, char data_length);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/librf.h"



int transmit_rf(char input);
#line 5 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libCompass.c"
int ReadCompass(char send_serial) {
 char buffer[12] = {0};
 char soft_uart_error;
 char skewed_output_integer;
 int out_buffer_integer;

 TRISE = 0x09;
 LATE = 0b1001;


 if (Soft_UART_Init(&PORTE, 0, 1, 9600, 0) == 0) {





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




 Delay_ms(20);
 out_buffer_integer = FindDataFromBuffer(buffer, 12, 7);
 Delay_ms(20);


 if (send_serial == 1) {

 skewed_output_integer = Skew(out_buffer_integer, 360, 255);






 }
 } else {
 if (send_serial == 1) {
 transmit_rf(0xFF);
 transmit_rf(0xFF);
 transmit_rf(0xFF);
 }
 }
 return 0;
}

int FindDataFromBuffer(char *buffer, char buffer_length, char data_length) {
 int i=0;
 char j[5] = {0};

 for (i; i<buffer_length-data_length; i++) {
 if (
 buffer[0+i] == 3 &&
 buffer[1+i] == 2 &&
 buffer[5+i] == 3 &&
 buffer[6+i] == 2
 )
 {
 j[0] = buffer[2+i];
 j[1] = buffer[3+i];
 j[2] = buffer[4+i];
 j[3] = '\0';

 transmit_rf(j[0]);
 transmit_rf(j[1]);
 transmit_rf(j[2]);

 return atoi(j);
 }

 }
}
