#ifndef __PIC32_USB_C
#define __PIC32_USB_C

// Includes -----------------------------------------------------------------------------------------------------------

#include <xc.h>

#include "HardwareProfile.h"
#include "usb_cdc.h"

#include "system.h"
#include "USB/usb_function_cdc.h"
#include "pwm.h"

#define mUSBMsgIs(str) strcmp(str, USB_Out_Buffer) == 0
#define mUSBMsgContains(str) strstr(USB_Out_Buffer, str) != 0

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
    //InitialiseADC();

    /// this is all unnecessary, just connect how we need it
    //ODCBbits.ODCB5 = 1;
    //CNPUBbits.CNPUB5 = 0;
    //ODCBbits.ODCB7 = 1;
    //CNPUBbits.CNPUB7 = 0;
    
    while(1)
    {
        mLED_USB_GP_On();
        delay_us(1000);
        mLED_USB_GP_Off();
        delay_us(1000);
    }

    
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
    char returnMessage[64];
    int adc = 0;
    int femtoGain;
    const int bufferSize = 64;
    int ledon = 0;
    int memOut;
    int memIn[FLASH_SIZE];
    const char* message = "Hello world!";

    if (USBDeviceState < CONFIGURED_STATE || USBSuspendControl == 1) return;


    
    //mLED_On();

    if (mUSBUSARTIsTxTrfReady()) {

        mLED_USB_Configured_On();
        // try to send data
        //putrsUSBUSART("Hello Computer!");
        
        numBytesRead = getsUSBUSART(USB_Out_Buffer, bufferSize);
        if (numBytesRead > 0) {

            mLED_USB_GP_On();

            // clear the message if there is one
            memset(returnMessage, 0, sizeof(returnMessage));
            
            if (mUSBMsgIs("led:on")) {

                putrsUSBUSART("Turning On LED\r\n");
                ledon = 1;
                //mLED_USB_GP_On();
                
            } else if (mUSBMsgIs("led:off")) {

                putrsUSBUSART("Turning Off LED\r\n");
                ledon = 0;
                //mLED_USB_GP_Off();

            } else if (mUSBMsgIs("pwm:on")) {

                putrsUSBUSART("Turning On PWM\r\n");
                EnablePWM();

            } else if (mUSBMsgIs("pwm:off")) {

                putrsUSBUSART("Turning Off PWM\r\n");
                DisablePWM();

            } else if (mUSBMsgIs("adc:read")) {
                
                adc = analogRead(5);  // read AN5 using ADC
                sprintf(returnMessage, "ADC Value = %u\r\n", adc);
                putrsUSBUSART(returnMessage);
            } else if (mUSBMsgIs("adc:read:temp")) {

                putrsUSBUSART("NOT IMPLEMENTED");
                
            } else if (mUSBMsgContains("pwm:duty ")) {
                // convert the part after "pwm:duty" to a float
                newDuty = atof(&USB_Out_Buffer[9]);
                newDuty = SetPWMDuty(newDuty);
                sprintf(returnMessage, "Setting PWM Duty Cycle to %f \r\n", newDuty);
                putrsUSBUSART(returnMessage);

                // set it
                SetPWMDuty(newDuty);

            } else if (mUSBMsgIs("pullup:on")) {

                CNPUBbits.CNPUB7 = 1;
                sprintf(returnMessage, "Pullup set to %u\r\n", CNPUBbits.CNPUB7);
                putrsUSBUSART(returnMessage);

            } else if (mUSBMsgIs("pullup:off")) {

                CNPUBbits.CNPUB7 = 0;
                sprintf(returnMessage, "Pullup set to %u\r\n", CNPUBbits.CNPUB7);
                putrsUSBUSART(returnMessage);

            } else if (mUSBMsgIs("femto:high")) {

                mFemtoSetHigh();
                putrsUSBUSART("Femto set to High\r\n");

            } else if (mUSBMsgIs("femto:low")) {

                mFemtoSetLow();
                putrsUSBUSART("Femto set to Low\r\n");

            } else if (mUSBMsgIs("femto:ac")) {

                mFemtoSetAC();
                putrsUSBUSART("Femto set to AC\r\n");

            } else if (mUSBMsgIs("femto:dc")) {

                mFemtoSetDC();
                putrsUSBUSART("Femto set to DC\r\n");

            } else if (mUSBMsgIs("femto:overload?")) {

                sprintf(returnMessage, "%u\r\n", mFemtoCheckOverload());
                putrsUSBUSART(returnMessage);

            } else if (mUSBMsgContains("femto:gain ")) {
                // convert the part after "pwm:duty" to a float
                femtoGain = atoi(&USB_Out_Buffer[11]);
                if (femtoGain >=1 && femtoGain <= 7)
                {
                    mFemtoSetGain(femtoGain);
                    sprintf(returnMessage, "Setting Femto Gain to %u \r\n", femtoGain);
                } else {
                    sprintf(returnMessage, "Gain of %u is out of range!\r\n", femtoGain);
                }
                putrsUSBUSART(returnMessage);
                
            } else {

                putrsUSBUSART("Unknown command\r\n");
                // blink LED quickly
                mLED_USB_GP_On();
                delay_us(1000);
                mLED_USB_GP_Off();
            }

            // turn off the access led
            if (ledon == 0) mLED_USB_GP_Off();

            // reset USB output buffer
            memset(USB_Out_Buffer, 0, sizeof(USB_Out_Buffer));
        }
    } else {
        mLED_USB_Configured_Off();
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
        mLED_USB_Configured_On();
    } else {
        mLED_USB_Configured_Off();
    }
}

#endif
