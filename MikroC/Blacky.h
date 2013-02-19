#ifndef BLACKY_H
#define BLACKY_H

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
#endif