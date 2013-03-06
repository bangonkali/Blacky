#ifndef BLACKY_H
#define BLACKY_H

#define MIN_SAFE_DISTANCE 25

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

#endif