#ifndef __HARDWAREPROFILE_H
#define	__HARDWAREPROFILE_H

// Defines ------------------------------------------------------------------------------------------------------------

#define self_power 1

#define switch_1 PORTBbits.RB14
#define switch_2 PORTBbits.RB15

#define LED_GP BIT_5

// transistor port
#define TRANSISTOR_PORT BIT_7

// ADC ------------------------------------------------------------------------------------------------------------



// LEDs ------------------------------------------------------------------------------------------------------------

// initilaise LEDs
#define mInitLEDs() mPORTBClearBits(LED_GP); mPORTBSetPinsDigitalOut(LED_GP);
//#define mInitButtons() mPORTBSetPinsDigitalIn(BIT_14 | BIT_15)

#define mLED_On(bit) mPORTASetBits(bit)
#define mLED_Off(bit) mPORTAClearBits(bit)

// general purpose LED set
#define mLED_USB_GP_On() mPORTBClearBits(LED_GP)
#define mLED_USB_GP_Off() mPORTBSetBits(LED_GP)

// voltage transistor pin
#define mInitTransistor() mPORTBClearBits(TRANSISTOR_PORT); mPORTBSetPinsDigitalOut(TRANSISTOR_PORT);
#define mTransistorOn() mPORTBSetBits(TRANSISTOR_PORT)
#define mTransistorOff() mPORTBClearBits(TRANSISTOR_PORT)

#endif
