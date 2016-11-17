#ifndef __PIC32_USB_C
#define __PIC32_USB_C

// Includes -----------------------------------------------------------------------------------------------------------

#include <xc.h>
#include "HardwareProfile.h"
#include "usb_cdc.h"

#include "general.h"
#include "system.h"
#include "USB/usb_function_cdc.h"
#include "pwm.h"
#include "adc.h"

#define mUSBMsgIs(str) strcmp(str, USB_Out_Buffer) == 0
#define mUSBMsgIndexOf(str) strstr(USB_Out_Buffer, str) - USB_Out_Buffer

// Function Declarations ----------------------------------------------------------------------------------------------

static void ProcessIO(void);
void UpdateStatusDisplay(void);

// Function Definitions -----------------------------------------------------------------------------------------------

/**
 * Main application entry point.
 */
int main(void)
{
    InitializeSystem();
    //InitialisePWM();
    InitialiseADC();

    mLED_USB_GP_Off();
    mTransistorOff();
    /// this is all unnecessary, just connect how we need it
    //ODCBbits.ODCB5 = 1;
    //CNPUBbits.CNPUB5 = 0;
    //ODCBbits.ODCB7 = 1;
    //CNPUBbits.CNPUB7 = 0;
    
//    int adc;
//    while(1)
//    {
//        mLED_USB_GP_On();
//        delay_us(100);
//        
//        //adc = analogRead(5)
//        
//        mLED_USB_GP_Off();
//        delay_us(100);
//    }

    
    while(1)
    {


        #if defined(USB_INTERRUPT)
            if(USBGetDeviceState() == DETACHED_STATE)
            {
                USBDeviceAttach();
            }
        #elif defined(USB_POLLING)
            USBDeviceTasks();
        #endif

        //UpdateStatusDisplay();
        ProcessIO();

//        if(!switch_1) {
//            mLED_On();
//        }
//
//        if(!switch_2) {
//            mLED_Off();
//        }

        
    }
}

/**
 * ProcessIO
 */
static void ProcessIO(void)
{
    BYTE numBytesRead;
    float newDuty;
    int pos;
    char returnMessage[64] = {0};
    char scratch[5] = {0};
    int scratchLength = 5;
    int adc = 0;
    const int bufferSize = 64;

    // reply to message?
    BOOL reply = TRUE;
    
    if (USBDeviceState < CONFIGURED_STATE || USBSuspendControl == 1) return;


    
    //mLED_On();

    if (mUSBUSARTIsTxTrfReady()) {

        mLED_USB_GP_On();
        // try to send data
        //putrsUSBUSART("Hello Computer!");
        
        numBytesRead = getsUSBUSART(USB_Out_Buffer, bufferSize);
        if (numBytesRead > 0) {

            // clear the message if there is one
            memset(returnMessage, 0, sizeof(returnMessage));
            
            if (mUSBMsgIndexOf(ADC_READ_COMSTR) == 0)
            {
                int len = strlen(USB_Out_Buffer);
                if (len == ADC_READ_COMSTR_LEN)
                {
                    strcpy(returnMessage, ADC_READ_COMSTR " <channel>" TERMCHAR);
                }
                else
                {
                    int numToCopy = len - ADC_READ_COMSTR_LEN;
                    memset(scratch,0,scratchLength);
                    numToCopy = numToCopy > scratchLength ? scratchLength : numToCopy;
                    strncpy(scratch,USB_Out_Buffer + ADC_READ_COMSTR_LEN + 1, numToCopy);  // copy from the message + command length +1 to skip space
                    int channel = atoi(scratch);
//    
                    if (!(channel == 4 || channel == 5 || channel == 9))
                    {
                        strcpy(returnMessage, "<channel> can be 4, 5 or 9" TERMCHAR);
                    }
                    else
                    {
//    
                        adc = analogRead(channel);  // read AN5 using ADC
                        sprintf(returnMessage, "channel %u = %u" TERMCHAR, channel, adc);
                    }
                }
                
                putrsUSBUSART(returnMessage);
                
            } else if (mUSBMsgIs("*IDN?"))
            {
                putrsUSBUSART("ResistanceMeter" TERMCHAR);
                
            }
            
            // turn transistor on
            else if (mUSBMsgIs("transistor on"))
            {
                mTransistorOn();
                if(reply) putrsUSBUSART("transistor on" TERMCHAR);
            }
            
            // turn transistor off
            else if (mUSBMsgIs("transistor off"))
            {
                mTransistorOff();
                if(reply) putrsUSBUSART("transistor off" TERMCHAR);  
            }
            
            // respond to ping
            else if (mUSBMsgIs("ping"))
            {
                putrsUSBUSART("pong" TERMCHAR);
            } else {

                putrsUSBUSART("Unknown command" TERMCHAR);
                // blink LED quickly
                mLED_USB_GP_Off();
                delay_us(1000);
                mLED_USB_GP_On();
            }

            // turn off the access led
            //if (ledon == 0) mLED_USB_GP_Off();

            // reset USB output buffer
            memset(USB_Out_Buffer, 0, sizeof(USB_Out_Buffer));
        }
    } else {
        //mLED_USB_Configured_Off();
    }

    CDCTxService();
}

/**
 * UpdateStatusDisplay
 */
void UpdateStatusDisplay(void)
{
    //return;
    
    if (USBDeviceState == CONFIGURED_STATE)
    {
        //mLED_USB_Configured_On();
    } else {
        //mLED_USB_Configured_Off();
    }
}



/*!
	Check <commandLine> for something of the form "<name> <number>"
	If it is found, extract the <numer> and put it in <param>, and return true
*/
//BOOL CheckSingleParameter(const char* commandLine, const char* name, int &param, BOOL *ok, const char* errorMessage)
//{
//	if (commandLine.indexOf(name) == 0)
//	{
//		// setting
//		bool ok = false;
//		String part;
//		int val = 0;
//		while (1)
//		{
//			int pos = commandLine.indexOf(' ', pos);
//			if (pos == -1) break;
//			part = commandLine.substring(pos + 1);
//			//Serial.println(part);
//			val = part.toInt();
//			if (val < 0) break;
//
//			ok = true;
//			break;
//		}
//
//		if (ok)
//		{
//			//Serial.println("OK");
//			param = val;
//			//Serial.println(param);
//		}
//		else
//		{
//			if (reply) Serial.println(errorMessage);
//		}
//
//		return true;
//	}
//	return false;
//}

#endif
