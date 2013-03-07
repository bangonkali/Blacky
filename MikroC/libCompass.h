#ifndef LIBCOMPASS_H
#define LIBCOMPASS_H

unsigned char ReadCompass(unsigned char send_serial, unsigned char * read_data);
unsigned int FindDataFromBuffer(unsigned char *buffer, unsigned char buffer_length, unsigned char data_length, unsigned char * read_data, unsigned char send_serial);

#endif