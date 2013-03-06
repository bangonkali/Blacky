#include "libPing.h"
#include "corePing.h"

int ReadPing(int *left, int *front, int *right) 
{
    *right = ReadPing_R();
    *left = ReadPing_L();
    *front = ReadPing_F();
    
    return 0;
}