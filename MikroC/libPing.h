#ifndef LIBPING_H
#define LIBPING_H

#define MaxDistance 1000
#define MaxDistanceScaled 255

extern sfr sbit Echo_L;    // Echo bit for the left sensor
extern sfr sbit Echo_F;    // Echo bit for the front sensor
extern sfr sbit Echo_R;    // Echo bit for the right sensor
extern sfr sbit Trigger_L; // Trigger bit for the left sensor
extern sfr sbit Trigger_F; // Trigger bit for the front sensor
extern sfr sbit Trigger_R; // Trigger bit for the right sensor

int ReadPing_L();
int ReadPing_F();
int ReadPing_R();
#endif

