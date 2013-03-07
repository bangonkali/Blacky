#ifndef LIBPING_H
#define LIBPING_H

#define MaxDistance 2000
#define MaxDistanceScaled 255

extern sfr sbit Echo_L;    // Echo bit for the left sensor
extern sfr sbit Echo_F;    // Echo bit for the front sensor
extern sfr sbit Echo_R;    // Echo bit for the right sensor
extern sfr sbit Trigger_L; // Trigger bit for the left sensor
extern sfr sbit Trigger_F; // Trigger bit for the front sensor
extern sfr sbit Trigger_R; // Trigger bit for the right sensor

unsigned int ReadPing_L();
unsigned int ReadPing_F();
unsigned int ReadPing_R();

unsigned int Count_Distance(double cnt, double max, double scale);

#endif