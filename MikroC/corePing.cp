#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/corePing.c"
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/libping.h"






extern sfr sbit Echo_L;
extern sfr sbit Echo_F;
extern sfr sbit Echo_R;
extern sfr sbit Trigger_L;
extern sfr sbit Trigger_F;
extern sfr sbit Trigger_R;

unsigned int ReadPing_L();
unsigned int ReadPing_F();
unsigned int ReadPing_R();

unsigned int Count_Distance(double cnt, double max, double scale);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/coreping.h"



unsigned int ReadPing(unsigned int *left, unsigned int *front, unsigned int *right) ;
#line 4 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/corePing.c"
unsigned int ReadPing(unsigned int *left, unsigned int *front, unsigned int *right)
{
 *right = ReadPing_R();
 *left = ReadPing_L();
 *front = ReadPing_F();

 return 0;
}
