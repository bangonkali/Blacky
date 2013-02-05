#include "libPing.h"
#include "corePing.h"

int ReadPing(int *left, int *front, int *right) 
{
    *left = ReadPing_L();
    *front = ReadPing_F();
    *right = ReadPing_R();
    
    return 0;
}