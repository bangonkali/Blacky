#ifndef BLACKY_H
#define BLACKY_H

#define MIN_SAFE_DISTANCE 25
#define MIN_SLOW_DISTANCE 35
#define MIN_LONG_DISTANCE 60
#define COMPASS_SPARCE 6

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

// Configuration
unsigned char speed_veryfast;
unsigned char speed_veryslow;
unsigned char configuration;
unsigned char start;
unsigned char temp;
unsigned char enable_compass;
unsigned char cycle_compass;

#endif