#include "libPing.h"

unsigned int ReadPing_L() {
    long count_distance = 0;
    TRISD = 0x6A;
    
    //UART1_Write(0x41);  // signal A
    
    Trigger_L = 0x01;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_L = 0x00;
    while (Echo_L == 0)
    {
        //UART1_Write(0x42); // signal B
    }
    while (Echo_L == 1)
    {
        count_distance++;
        //UART1_Write(0x43); // signal C
    }
    return Count_Distance((double)count_distance, (double)MaxDistance, (double)MaxDistanceScaled);
}

unsigned int ReadPing_R() {
    long count_distance = 0;
    TRISD = 0x6A;
    
    //UART1_Write(0x45); // signal E
    
    Trigger_R = 0x01;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_R = 0x00; 
    while (Echo_R == 0)
    {
        //UART1_Write(0x46); // signal F
    }
    while (Echo_R == 1)
    {
        count_distance++;
        //UART1_Write(0x47); // signal E
    }
    return Count_Distance((double)count_distance, (double)MaxDistance, (double)MaxDistanceScaled);
}

unsigned int ReadPing_F() {
    long count_distance = 0;
    TRISD = 0x6A;
    //UART1_Write(0x66);
    
    Trigger_F = 0x01;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_F = 0x00; 
    while (Echo_F == 0)
    {
        //UART1_Write(0x50); // signal P
    }
    while (Echo_F == 1)
    {
        count_distance++;
        //UART1_Write(0x49); // signal G
    }
    
    return Count_Distance((double)count_distance, (double)MaxDistance, (double)MaxDistanceScaled);
}

unsigned int Count_Distance(double cnt, double max, double scale) {
    if (cnt > max)
        cnt = max;

    return (unsigned int)(scale*(cnt/max));
}