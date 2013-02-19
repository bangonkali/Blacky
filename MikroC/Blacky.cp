#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/pic18f4550lib.h"



void ___init_core___();
void main_init();
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/coreping.h"



int ReadPing(int *left, int *front, int *right) ;
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/blacky.h"



sbit Echo_L at PORTD.B1;
sbit Trigger_L at LATD.B0;

sbit Echo_F at PORTD.B3;
sbit Trigger_F at LATD.B2;

sbit Echo_R at PORTD.B5;
sbit Trigger_R at LATD.B4;

int left, right, front, err;
int test;

int soft_uart_error;
int soft_uart_read_error;
#line 5 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
void main() {
 ADCON1 |= 0x0F;
 CMCON |= 7;
 main_init();

 TRISD = 0x2A;
 TRISB = 0x00;
 LATB = 0x00;
 LATD = 0;

 UART1_Init(115200);
 Delay_ms(100);

 test = 0;
 soft_uart_error = Soft_UART_Init(&PORTE, 0, 1, 9600, 0);

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
