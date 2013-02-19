#include "libPing.h"
#include "corePing.h"

int ReadPing(int *left, int *front, int *right) 
{
    *left = ReadPing_L();
    *right = ReadPing_R();
    *front = ReadPing_F();
    
    return 0;
}