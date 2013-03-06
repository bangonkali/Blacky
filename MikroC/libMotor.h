#ifndef LIBMOTOR_H
#define LIBMOTOR_H
void SetSpeed(char speed);

void TurnLeft();
void TurnRight();
void Turn(char delay, char speed, char direction);
void MoveForward (char speed);

#endif