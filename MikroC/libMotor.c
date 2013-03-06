#include "libMotor.h"

void SetSpeed(char speed) {
    TRISA = 0x00;
    LATA = speed;
}

void TurnLeft() {
    Turn (200, 3, 0);
}

void TurnRight() {
    Turn (200, 3, 1);
}

void Turn(char delay, char speed, char direction) {
        TRISB = 0x00;
        TRISA = 0x00;
        
        LATA = speed;
    if (direction) {
        LATB.B1 = 1;
        LATB.B2 = 0;
        
        LATB.B3 = 1;
        LATB.B4 = 0;
    } else {
    
        LATB.B1 = 0;
        LATB.B2 = 1;
        
        LATB.B3 = 0;
        LATB.B4 = 1;
    }
    
    Delay_ms(10);
}

void MoveForward (char speed) {
    TRISB = 0x00;
    TRISA = 0x00;
    
    LATA = speed;
    
    LATB.B1 = 1;
    LATB.B2 = 0;
    
    LATB.B3 = 0;
    LATB.B4 = 1;
}