#ifndef __USB_CDC_H
#define	__USB_CDC_H

// Includes -----------------------------------------------------------------------------------------------------------

#include "usb_config.h"

// Variable Declarations ----------------------------------------------------------------------------------------------

char USB_Out_Buffer[CDC_DATA_OUT_EP_SIZE];
char RS232_Out_Data[CDC_DATA_IN_EP_SIZE];

unsigned char NextUSBOut;
unsigned char LastRS232Out;

#define USB_IN_BUFFER_SIZE 64
#define USB_OUT_BUFFER_SIZE 64
char USB_In_Buffer[USB_IN_BUFFER_SIZE];
char USB_Out_Buffer[USB_OUT_BUFFER_SIZE];

#endif
