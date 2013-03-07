#line 1 "C:/Users/Bangonkali/Desktop/Projects/Blacky/MikroC/libBlacky.c"
unsigned int Skew(double cnt, double max, double scale) {
 if (cnt > max)
 cnt = max;

 return (unsigned int)(scale*(cnt/max));
}
