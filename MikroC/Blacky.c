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
    
    Delay_ms(100);
    
    // initialize defaults.
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
                if (cycle_compass > COMPASS_SPARCE) {
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
                speed_veryfast = 7;
                speed_veryslow = 3;
                enable_compass = 2; // sparce compass (every COMPASS_SPARCE cycle);
            } else if (configuration == 2) {
                speed_veryfast = 7;
                speed_veryslow = 3;
                enable_compass = 1; // compass reading after each cycle
            } else if (configuration == 3) {
                speed_veryfast = 5;
                speed_veryslow = 2;
                enable_compass = 2; // sparce compass (every COMPASS_SPARCE cycle);
            } else if (configuration == 4) {
                speed_veryfast = 5;
                speed_veryslow = 2;
                enable_compass = 1; // compass reading after each cycle
            } else if (configuration == 5) {
                speed_veryfast = 7;
                speed_veryslow = 3;
                enable_compass = 0; // no compass after each cycle
            } else if (configuration == 6) {
                speed_veryfast = 5;
                speed_veryslow = 2;
                enable_compass = 0; // no compass after each cycle
            } else {
                speed_veryfast = 0;
                speed_veryslow = 0;
                enable_compass = 0; // no compass after each cycle
            }
        }
        
        if (start > 0) {
            if (front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
                if (right > left) {
                    if(cycle_compass != COMPASS_SPARCE) {
                        TurnRight();
                    } else {
                        MoveBackward(speed_veryfast);
                        Delay_ms(500);
                    }
                }  else {
                    if(cycle_compass != COMPASS_SPARCE) {
                        TurnLeft();
                    } else {
                        MoveBackward(speed_veryfast);
                        Delay_ms(500);
                    }
                }
            } else if (right < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && left >= MIN_SAFE_DISTANCE) {
                if(cycle_compass != COMPASS_SPARCE) {
                    TurnRight();
                } else {
                    MoveBackward(speed_veryfast);
                    Delay_ms(500);
                }
            } else if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right >= MIN_SAFE_DISTANCE) {
                if(cycle_compass != COMPASS_SPARCE) {
                    TurnLeft();
                } else {
                    MoveBackward(speed_veryfast);
                    Delay_ms(500);
                }
            } else if (left < MIN_SAFE_DISTANCE && front < MIN_SAFE_DISTANCE && right < MIN_SAFE_DISTANCE) {
                MoveBackward(speed_veryfast);
            } else if (front > MIN_SAFE_DISTANCE && left > MIN_SAFE_DISTANCE && right > MIN_SAFE_DISTANCE) {
                if (initial_direction > current_direction && abs(initial_direction - current_direction) > 3) {
                    if(cycle_compass != COMPASS_SPARCE) {
                        TurnRight();
                    }
                } else if (current_direction > initial_direction && abs(initial_direction - current_direction) > 3) {
                    if(cycle_compass != COMPASS_SPARCE) {
                        TurnLeft();
                    }
                } else {
                    if (cycle_compass == COMPASS_SPARCE) {
                        MoveForward(0);
                    } else if (front < MIN_SLOW_DISTANCE){
                        MoveForward(speed_veryslow);
                    } else {
                        MoveForward(speed_veryfast);
                    }
                }
            } else if (front > MIN_SAFE_DISTANCE) {
                MoveForward(speed_veryfast);
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