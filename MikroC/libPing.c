#include "libPing.h"

int ReadPing_L() {
    int count_distance = 0;
    
    Trigger_L = 1;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_L = 0; 
    while (Echo_L == 0)
    count_distance = 0;
    while (Echo_L == 1)
    {
        count_distance++;
    }
    if (count_distance > MaxDistance)
        count_distance = MaxDistance;

    count_distance = (MaxDistanceScaled*count_distance/MaxDistance);
    return count_distance;
}

int ReadPing_R() {
    int count_distance = 0;
    
    Trigger_R = 1;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_R = 0; 
    while (Echo_R == 0)
    count_distance = 0;
    while (Echo_R == 1)
    {
        count_distance++;
    }
    if (count_distance > MaxDistance)
        count_distance = MaxDistance;

    count_distance = (MaxDistanceScaled*count_distance/MaxDistance);
    return count_distance;
}

int ReadPing_F() {
    int count_distance = 0;
    
    Trigger_F = 1;
    Delay_us(20); // Delay 20us to wait for rising edge.
    Trigger_F = 0; 
    while (Echo_F == 0)
    count_distance = 0;
    while (Echo_F == 1)
    {
        count_distance++;
    }
    if (count_distance > MaxDistance)
        count_distance = MaxDistance;

    count_distance = (MaxDistanceScaled*count_distance/MaxDistance);
    return count_distance;
}