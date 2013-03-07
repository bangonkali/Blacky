#include "libPing.h"
#include "corePing.h"

unsigned int ReadPing(unsigned int *left, unsigned int *front, unsigned int *right) 
{
    *right = ReadPing_R();
    *left = ReadPing_L();
    *front = ReadPing_F();
    
    return 0;
}