#ifndef BLACKY_H
#define BLACKY_H

sbit Echo_L at PORTD.B0;
sbit Trigger_L at PORTD.B1;

sbit Echo_C at PORTD.B2;
sbit Trigger_C at PORTD.B3;

sbit Echo_R at PORTD.B4;
sbit Trigger_R at PORTD.B5;

int left, right, front, err;

#endif