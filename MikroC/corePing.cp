#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/corePing.c"
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

int Count_Distance(int cnt, int max, int scale);
#line 1 "c:/users/bangonkali/desktop/projects/blacky/mikroc/coreping.h"



int ReadPing(int *left, int *front, int *right) ;
#line 4 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/corePing.c"
int ReadPing(int *left, int *front, int *right)
{
 *left = ReadPing_L();
 *right = ReadPing_R();
 *front = ReadPing_F();

 return 0;
}
