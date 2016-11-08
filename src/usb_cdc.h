#ifndef __USB_CDC_H
#define	__USB_CDC_H

// Includes -----------------------------------------------------------------------------------------------------------

#include "usb_config.h"

// Variable Declarations ----------------------------------------------------------------------------------------------

char USB_Out_Buffer[CDC_DATA_OUT_EP_SIZE];
char RS232_Out_Data[CDC_DATA_IN_EP_SIZE];

unsigned char NextUSBOut;
unsigned char LastRS232Out;

char USB_In_Buffer[64];
char USB_Out_Buffer[64];

#endif
