#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libMotor.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libmotor.h"



void SetSpeed(unsigned char speed);

void TurnLeft();
void TurnRight();
void Turn(unsigned char delay, unsigned char speed, unsigned char direction);
void MoveForward (unsigned char speed);
void MoveBackward (unsigned char speed);


extern unsigned char speed_veryfast;
extern unsigned char speed_veryslow;
#line 3 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libMotor.c"
void SetSpeed(unsigned char speed) {
 TRISA = 0x00;
 LATA = speed;
}

void TurnLeft() {
 Turn (200, speed_veryslow, 0);
}

void TurnRight() {
 Turn (200, speed_veryslow, 1);
}

void Turn(unsigned char delay, unsigned char speed, unsigned char direction) {
 TRISB = 0x00;
 TRISA = 0x00;

 LATA = speed;
 if (direction) {
 LATB.B1 = 1;
 LATB.B2 = 0;

 LATB.B3 = 0;
 LATB.B4 = 0;
 } else {

 LATB.B1 = 0;
 LATB.B2 = 0;

 LATB.B3 = 0;
 LATB.B4 = 1;
 }
}

void MoveForward (unsigned char speed) {
 TRISB = 0x00;
 TRISA = 0x00;

 LATA = speed;

 LATB.B1 = 1;
 LATB.B2 = 0;

 LATB.B3 = 0;
 LATB.B4 = 1;
}

void MoveBackward (unsigned char speed) {
 TRISB = 0x00;
 TRISA = 0x00;

 LATA = speed;

 LATB.B1 = 0;
 LATB.B2 = 1;

 LATB.B3 = 1;
 LATB.B4 = 0;
}
