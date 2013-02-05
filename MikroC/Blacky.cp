#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/pic18f4550lib.h"



void ___init_core___();
void main_init();
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/coreping.h"



int ReadPing(int *left, int *front, int *right) ;
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/blacky.h"



sbit Echo_L at PORTD.B0;
sbit Trigger_L at PORTD.B1;

sbit Echo_C at PORTD.B2;
sbit Trigger_C at PORTD.B3;

sbit Echo_R at PORTD.B4;
sbit Trigger_R at PORTD.B5;

int left, right, front, err;
#line 5 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
void main() {
 ADCON1 |= 0x0F;
 CMCON |= 7;
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
