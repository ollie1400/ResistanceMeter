#ifndef __CDC_INTERRUPTS_C
#define __CDC_INTERRUPTS_C

// Includes -----------------------------------------------------------------------------------------------------------

#include "usb_config.h"
#include "USB/usb_function_cdc.h"

// Interrupt Procedures -----------------------------------------------------------------------------------------------

#if defined (USB_CDC_SET_LINE_CODING_HANDLER)
/**
 * mySetLineCodingHandler
 */
void mySetLineCodingHandler(void)
{
    if (cdc_notice.GetLineCoding.dwDTERate.Val > 115200) {
        // USBStallEndpoint(0,1);
    } else {
        CDCSetBaudRate(cdc_notice.GetLineCoding.dwDTERate.Val);
    }
}
#endif

#endif