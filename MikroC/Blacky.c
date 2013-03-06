#include "PIC18F4550lib.h"
#include "libCompass.h"
#include "corePing.h"
#include "Blacky.h"
#include "libRF.h"
#include "libMotor.h"

void main() {
    ADCON1 |= 0x0F;
    CMCON  |= 7;
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
            if (front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
                if (right > left) {
                    TurnRight();
                }  else {
                    TurnLeft();
                }
            }
            
            if (right < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
                TurnRight();
            }
            
            if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE) {
                TurnLeft();
            }
            
            if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right < MIN_SAFE_DISTANCE) {
                MoveForward(0);
            }

            if (left > MIN_SAFE_DISTANCE && front > MIN_SAFE_DISTANCE && right > MIN_SAFE_DISTANCE) {
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
                
                MoveForward(DEFAULT_SPEED);
            }
        }
        
        if (test == 0) {
           LATB.B0 = 0x01;
           test = 1;
        } else {
           test = 0;
           LATB.B0 = 0x00;
        }
        
        //Delay_ms(1000);
    }
}