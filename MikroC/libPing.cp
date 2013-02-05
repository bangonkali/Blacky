#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libPing.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libping.h"






extern sfr sbit Echo_L;
extern sfr sbit Echo_F;
extern sfr sbit Echo_R;
extern sfr sbit Trigger_L;
extern sfr sbit Trigger_F;
extern sfr sbit Trigger_R;

int ReadPing_L();
int ReadPing_F();
int ReadPing_R();
#line 3 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libPing.c"
int ReadPing_L() {
 int count_distance = 0;

 Trigger_L = 1;
 Delay_us(20);
 Trigger_L = 0;
 while (Echo_L == 0)
 count_distance = 0;
 while (Echo_L == 1)
 {
 count_distance++;
 }
 if (count_distance >  1000 )
 count_distance =  1000 ;

 count_distance = ( 255 *count_distance/ 1000 );
 return count_distance;
}

int ReadPing_R() {
 int count_distance = 0;

 Trigger_R = 1;
 Delay_us(20);
 Trigger_R = 0;
 while (Echo_R == 0)
 count_distance = 0;
 while (Echo_R == 1)
 {
 count_distance++;
 }
 if (count_distance >  1000 )
 count_distance =  1000 ;

 count_distance = ( 255 *count_distance/ 1000 );
 return count_distance;
}

int ReadPing_F() {
 int count_distance = 0;

 Trigger_F = 1;
 Delay_us(20);
 Trigger_F = 0;
 while (Echo_F == 0)
 count_distance = 0;
 while (Echo_F == 1)
 {
 count_distance++;
 }
 if (count_distance >  1000 )
 count_distance =  1000 ;

 count_distance = ( 255 *count_distance/ 1000 );
 return count_distance;
}
