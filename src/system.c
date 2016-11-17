#ifndef __SYSTEM_C
#define __SYSTEM_C

// Includes -----------------------------------------------------------------------------------------------------------

#include <Compiler.h>
#include "HardwareProfile.h"
#include "system.h"
#include "usb_cdc.h"

// Function Definitions -----------------------------------------------------------------------------------------------

/**
 * InitializeSystem
 */
void InitializeSystem(void)
{
    SYSTEMConfigPerformance(SYS_FREQ);

    //TRISBbits.TRISB2 = 0;
    //LATBbits.LATB2 = 1;
    //ODCBbits.ODCB5 = 1;
    mInitLEDs();
    mInitTransistor();
    // set pins to open drain config
    //ODCBbits.ODCB5 = 1;
    //ODCBbits.ODCB7 = 1;

    // initialise the ports for the Femto control
    //mInitFemtoPorts();

    unsigned char i;
    for (i = 0; i < sizeof(USB_Out_Buffer); i++) {
        USB_Out_Buffer[i] = 0;
    }
    
    NextUSBOut = 0;
    LastRS232Out = 0;
//    lastTransmission = 0;

    USBDeviceInit();
//    DataEEInit();  // initialise EEPROM emulator
}


// a delay function using TIMER1
void delay_us( unsigned t)          // See Timers tutorial for more info on this function
{
    T1CON = 0x8000;                 // enable Timer1, source PBCLK, 1:1 prescaler

    // delay 100us per loop until less than 100us remain
    while( t >= 100){
        t-=100;
        TMR1 = 0;
        while( TMR1 < SYS_FREQ/10000);
    }

    // delay 10us per loop until less than 10us remain
    while( t >= 10){
        t-=10;
        TMR1 = 0;
        while( TMR1 < SYS_FREQ/100000);
    }

    // delay 1us per loop until finished
    while( t > 0)
    {
        t--;
        TMR1 = 0;
        while( TMR1 < SYS_FREQ/1000000);
    }

    // turn off Timer1 so function is self-contained
    T1CONCLR = 0x8000;
} // END delay_us()

#endif
