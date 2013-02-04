#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/pic18f4550lib.h"



void ___init_core___();
void main_init();
#line 2 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
unsigned long count_distance[3];
unsigned char finalcount[3];
double calculation[3];
char txt[15];
char msg[40];

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
 count_distance[0] =0;
 count_distance[2] =0;
 count_distance[1] =0;

 LATD = 0x01;
 Delay_us(20);
 LATD = 0x00;
 while (PORTD.RD1 == 0)
 count_distance[0] = 0;
 while (PORTD.RD1 == 1)
 {
 count_distance[0]++;
 }
 if (count_distance[0] > 1000)
 count_distance[0] = 1000;

 calculation[0] = (255*count_distance[0]/1000);
 finalcount[0] = calculation[0];
 UART1_Write(finalcount[0]);

 LATD = 0x04;
 Delay_us(20);
 LATD = 0x00;
 while (PORTD.RD3 == 0)
 count_distance[1] = 0;
 while (PORTD.RD3 == 1)
 {
 count_distance[1]++;
 }
 if (count_distance[1] > 1000)
 count_distance[1] = 1000;

 calculation[1] = (255*count_distance[1]/1000);
 finalcount[1] = calculation[1];
 UART1_Write(finalcount[1]);

 LATD = 0x10;
 Delay_us(20);

 LATD = 0x00;
 while (PORTD.RD5 == 0)
 count_distance[2] = 0;
 while (PORTD.RD5 == 1)
 {
 count_distance[2]++;
 }
 if (count_distance[2] > 1000)
 count_distance[2] = 1000;

 calculation[2] = (255*count_distance[2]/1000);
 finalcount[2] = calculation[2];
 UART1_Write(finalcount[2]);


 UART1_Write(0);
 Delay_ms(1000);
 LATB = !PORTB;
 }
}
