#ifndef __USB_INTERRUPTS_C
#define __USB_INTERRUPTS_C

// Includes -----------------------------------------------------------------------------------------------------------

#include "usb_config.h"
#include "USB/usb.h"
#include "USB/usb_function_cdc.h"

// Interrupt Procedures -----------------------------------------------------------------------------------------------

/**
 * USBCBSuspend
 */
void USBCBSuspend(void)
{
}

/**
 * USBCBWakeFromSuspend
 */
void USBCBWakeFromSuspend(void)
{
}

/**
 * USBCB_SOF_Handler
 */
void USBCB_SOF_Handler(void)
{
}

/**
 * USBCBErrorHandler
 */
void USBCBErrorHandler(void)
{

}

/**
 * USBCBCheckOtherReq
 */
void USBCBCheckOtherReq(void)
{
    USBCheckCDCRequest();
}

/**
 * USBCBStdSetDscHandler
 */
void USBCBStdSetDscHandler(void)
{
}

/**
 * USBCBInitEP
 */
void USBCBInitEP(void)
{
    USBEnableEndpoint(CDC_COMM_EP, USB_OUT_ENABLED | USB_IN_ENABLED | USB_HANDSHAKE_ENABLED | USB_DISALLOW_SETUP);
    CDCInitEP();
}

/**
 * USBCBSendResume
 */
void USBCBSendResume(void)
{
    static WORD delay_count;
    if(USBGetRemoteWakeupStatus() == TRUE)
    {
        if(USBIsBusSuspended() == TRUE)
        {
            USBMaskInterrupts();
            USBCBWakeFromSuspend();
            USBSuspendControl = 0;
            USBBusIsSuspended = FALSE;
            delay_count = 3600U;
            do
            {
                delay_count--;
            } while(delay_count);

            USBResumeControl = 1;
            delay_count = 1800U;
            do
            {
                delay_count--;
            } while(delay_count);
            USBResumeControl = 0;
            USBUnmaskInterrupts();
        }
    }
}

/**
 * USER_USB_CALLBACK_EVENT_HANDLER
 * @param event
 * @param pdata
 * @param size
 * @return
 */
BOOL USER_USB_CALLBACK_EVENT_HANDLER(int event, void *pdata, WORD size)
{
    switch (event)
    {
        case EVENT_TRANSFER:
            break;
        case EVENT_SOF:
            USBCB_SOF_Handler();
            break;
        case EVENT_SUSPEND:
            USBCBSuspend();
            break;
        case EVENT_RESUME:
            USBCBWakeFromSuspend();
            break;
        case EVENT_CONFIGURED:
            USBCBInitEP();
            break;
        case EVENT_SET_DESCRIPTOR:
            USBCBStdSetDscHandler();
            break;
        case EVENT_EP0_REQUEST:
            USBCBCheckOtherReq();
            break;
        case EVENT_BUS_ERROR:
            USBCBErrorHandler();
            break;
        case EVENT_TRANSFER_TERMINATED:
            break;
        default:
            break;
    }
    return TRUE;
}

#endif
