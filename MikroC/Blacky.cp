#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/pic18f4550lib.h"



void ___init_core___();
void main_init();
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libcompass.h"



int ReadCompass(char);
int FindDataFromBuffer(char *buffer, char buffer_length, char data_length);
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
int initial_direction;
int current_direction;
short start;
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/librf.h"



int transmit_rf(char input);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libmotor.h"





void SetSpeed(char speed);

void TurnLeft();
void TurnRight();
void Turn(char delay, char speed, char direction);
void MoveForward (char speed);
#line 8 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
void main() {
 ADCON1 |= 0x0F;
 CMCON |= 7;
 main_init();

 TRISD = 0x2A;
 TRISB = 0x00;
 LATB = 0x00;
 LATD = 0;

 UART1_Init(9600);

 initial_direction = ReadCompass(0);

 Delay_ms(100);
 MoveForward (7);
 test = 0;

 start = 1;

 while(1){
 err = ReadPing(&left, &front, &right);

 transmit_rf(1);
 transmit_rf(left);
 transmit_rf(2);
 transmit_rf(right);
 transmit_rf(3);
 transmit_rf(front);
 transmit_rf(4);
 current_direction = ReadCompass(1);
 transmit_rf(5);
 transmit_rf(start);
 transmit_rf(6);

 if (start != 0) {
 if (front <  25  && right >=  25  && left >=  25 ) {
 if (right > left) {
 TurnRight();
 } else {
 TurnLeft();
 }
 }

 if (right <  25  && front <  25  && left >=  25 ) {
 TurnRight();
 }

 if (left <  25  && front <  25  && right >=  25 ) {
 TurnLeft();
 }

 if (left <  25  && front <  25  && right <  25 ) {
 MoveForward(0);
 }

 if (left >  25  && front >  25  && right >  25 ) {
 if (initial_direction > current_direction) {
 if (initial_direction - current_direction > 180) {
 TurnLeft();
 } else {
 TurnRight();
 }
 } else if (current_direction > initial_direction) {
 if (current_direction - initial_direction > 180) {
 TurnLeft();
 } else {
 TurnRight();
 }
 }

 MoveForward( 0xF );
 }
 }

 if (test == 0) {
 LATB.B0 = 0x01;
 test = 1;
 } else {
 test = 0;
 LATB.B0 = 0x00;
 }


 }
}
