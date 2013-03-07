#ifndef LIBMOTOR_H
#define LIBMOTOR_H

void SetSpeed(unsigned char speed);

void TurnLeft();
void TurnRight();
void Turn(unsigned char delay, unsigned char speed, unsigned char direction);
void MoveForward (unsigned char speed);
void MoveBackward (unsigned char speed);

// these variables are at Blacky.h
extern unsigned char speed_veryfast;
extern unsigned char speed_veryslow;

#endif