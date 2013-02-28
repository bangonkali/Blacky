#include "libPing.h"

int ReadPing_L() {
    int count_distance = 0;
    TRISD = 0x2A;
    
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

int ReadPing_R() {
    int count_distance = 0;
    TRISD = 0x2A;
    
    //UART1_Write(0x45); // signal E
    
    Trigger_R = 1;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_R = 0; 
    while (PORTD == 0)
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

int ReadPing_F() {
    int count_distance = 0;
    TRISD = 0x2A;
    //UART1_Write(0x66);
    
    Trigger_F = 1;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_F = 0; 
    while (PORTD == 0)
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

int Count_Distance(double cnt, double max, double scale) {
    if (cnt > max)
        cnt = max;

    return (int)(scale*(cnt/max));
}