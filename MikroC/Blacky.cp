#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/Blacky.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/pic18f4550lib.h"



void ___init_core___();
void main_init();
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libcompass.h"



unsigned char ReadCompass(unsigned char send_serial, unsigned char * read_data);
unsigned int FindDataFromBuffer(unsigned char *buffer, unsigned char buffer_length, unsigned char data_length, unsigned char * read_data, unsigned char send_serial);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/coreping.h"



unsigned int ReadPing(unsigned int *left, unsigned int *front, unsigned int *right) ;
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/blacky.h"








sbit Echo_L at PORTD.B1;
sbit Trigger_L at LATD.B0;

sbit Echo_F at PORTD.B3;
sbit Trigger_F at LATD.B2;

sbit Echo_R at PORTD.B5;
sbit Trigger_R at LATD.B4;

unsigned int left, right, front, err;
unsigned int test;

unsigned char soft_uart_error;
unsigned char soft_uart_read_error;

unsigned char initial_direction;
unsigned char current_direction;

unsigned char compass_initial[3];
unsigned char compass_current[3];


unsigned char speed_veryfast;
unsigned char speed_veryslow;
unsigned char configuration;
unsigned char start;
unsigned char temp;
unsigned char enable_compass;
unsigned char cycle_compass;
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/librf.h"



unsigned int transmit_rf(unsigned char input);
unsigned char read_rf(unsigned char *error);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libmotor.h"



void SetSpeed(unsigned char speed);

void TurnLeft();
void TurnRight();
void Turn(unsigned char delay, unsigned char speed, unsigned char direction);
void MoveForward (unsigned char speed);
void MoveBackward (unsigned char speed);


extern unsigned char speed_veryfast;
extern unsigned char speed_veryslow;
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

 Delay_ms(100);


 MoveForward (0);
 test = 0;
 cycle_compass = 0;
 start = 0;

 while(1){
 err = ReadPing(&left, &front, &right);

 transmit_rf(1);
 transmit_rf(left);
 transmit_rf(2);
 transmit_rf(right);
 transmit_rf(3);
 transmit_rf(front);
 transmit_rf(4);

 if (enable_compass > 0) {
 if (enable_compass == 1) {
 current_direction = ReadCompass(1, compass_current);
 } else if (enable_compass == 2) {
 if (cycle_compass >  6 ) {
 current_direction = ReadCompass(1, compass_current);
 cycle_compass = 0;
 }
 cycle_compass++;
 }
 } else {
 transmit_rf(compass_initial[0]);
 transmit_rf(compass_initial[1]);
 transmit_rf(compass_initial[2]);
 }

 transmit_rf(5);
 transmit_rf(start);
 transmit_rf(6);

 if (start > 0) {
 transmit_rf(compass_initial[0]);
 transmit_rf(compass_initial[1]);
 transmit_rf(compass_initial[2]);
 } else {
 transmit_rf(compass_current[0]);
 transmit_rf(compass_current[1]);
 transmit_rf(compass_current[2]);
 }

 transmit_rf(current_direction);
 transmit_rf(initial_direction);

 if (start == 0) {
 configuration = read_rf(&temp);
 if (configuration > 0) {
 start = 1;
 initial_direction = ReadCompass(0, compass_initial);
 }
 if (configuration == 1) {
 speed_veryfast = 0xFF;
 speed_veryslow = 3;
 enable_compass = 2;
 } else if (configuration == 2) {
 speed_veryfast = 0xFF;
 speed_veryslow = 3;
 enable_compass = 1;
 } else if (configuration == 3) {
 speed_veryfast = 5;
 speed_veryslow = 2;
 enable_compass = 2;
 } else if (configuration == 4) {
 speed_veryfast = 5;
 speed_veryslow = 2;
 enable_compass = 1;
 } else if (configuration == 5) {
 speed_veryfast = 0xFF;
 speed_veryslow = 3;
 enable_compass = 0;
 } else if (configuration == 6) {
 speed_veryfast = 5;
 speed_veryslow = 2;
 enable_compass = 0;
 } else {
 speed_veryfast = 0;
 speed_veryslow = 0;
 enable_compass = 0;
 }
 }

 if (start > 0) {
 if (front <  20  && right >=  20  && left >=  20 ) {
 if (right > left) {
 if(cycle_compass !=  6 ) {
 TurnRight();
 } else {
 MoveBackward(speed_veryfast);
 Delay_ms(400);
 TurnRight();
 Delay_ms(100);
 }
 } else {
 if(cycle_compass !=  6 ) {
 TurnLeft();
 } else {
 MoveBackward(speed_veryfast);
 Delay_ms(400);
 TurnLeft();
 Delay_ms(100);
 }
 }
 } else if (right <  20  && front <  20  && left >=  20 ) {
 if(cycle_compass !=  6 ) {
 TurnRight();
 } else {
 MoveBackward(speed_veryfast);
 Delay_ms(400);
 TurnRight();
 Delay_ms(100);
 }
 } else if (left <  20  && front <  20  && right >=  20 ) {
 if(cycle_compass !=  6 ) {
 TurnLeft();
 } else {
 MoveBackward(speed_veryfast);
 Delay_ms(400);
 TurnLeft();
 Delay_ms(100);

 }
 } else if (left <  20  && front <  20  && right <  20 ) {
 MoveBackward(speed_veryfast);
 } else if (front >  20  && left >  20  && right >  20 ) {
 if(abs(initial_direction - current_direction) > 4) {
 TurnRight();
 } else {
 MoveForward(speed_veryfast);
 }
 } else if (front >  20 ) {
 MoveForward(speed_veryfast);
 } else {
 MoveBackward(speed_veryfast);
 Delay_ms(400);
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
