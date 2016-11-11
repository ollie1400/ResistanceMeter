#ifndef __HARDWAREPROFILE_H
#define	__HARDWAREPROFILE_H

// Defines ------------------------------------------------------------------------------------------------------------

#define self_power 1

#define switch_1 PORTBbits.RB14
#define switch_2 PORTBbits.RB15

// which LED is which?
#define LED_CONFIGURED 0b100  // RB2
#define LED_GP BIT_5


// FEMTO ------------------------------------------------------------------------------------------------------------

// Femto ports
#define FEMTO_GAIN_LSB BIT_15
#define FEMTO_GAIN BIT_14
#define FEMTO_GAIN_MSB BIT_13
#define FEMTO_ACDC BIT_9
#define FEMTO_HL BIT_8 //PORTBbits.RB8
#define FEMTO_OVERLOAD BIT_4

// initialise FEMTO ports
#define mInitFemtoPorts()  mPORTBClearBits(FEMTO_GAIN_LSB | FEMTO_GAIN | FEMTO_GAIN_MSB | FEMTO_ACDC | FEMTO_HL); mPORTBSetPinsDigitalOut(FEMTO_GAIN_LSB | FEMTO_GAIN | FEMTO_GAIN_MSB | FEMTO_ACDC | FEMTO_HL); mPORTBSetPinsDigitalIn(FEMTO_OVERLOAD);

#define mFemtoSetHigh() mPORTBSetBits(FEMTO_HL)
#define mFemtoSetLow() mPORTBClearBits(FEMTO_HL)

#define mFemtoCheckOverload() mPORTBReadBits(FEMTO_OVERLOAD)

#define mFemtoSetGain(gain) if ((gain-1) & 0b100) mPORTBSetBits(FEMTO_GAIN_MSB); else mPORTBClearBits(FEMTO_GAIN_MSB); if ((gain-1) & 0b010) mPORTBSetBits(FEMTO_GAIN); else mPORTBClearBits(FEMTO_GAIN); if ((gain-1) & 0b001) mPORTBSetBits(FEMTO_GAIN_LSB); else mPORTBClearBits(FEMTO_GAIN_LSB);

// need to check whether AC is clear or set....
#define mFemtoSetAC() mPORTBSetBits(FEMTO_ACDC);
#define mFemtoSetDC() mPORTBClearBits(FEMTO_ACDC);


// ADC ------------------------------------------------------------------------------------------------------------

// ADC pins


// LEDs ------------------------------------------------------------------------------------------------------------

// initilaise LEDs
#define mInitLEDs() mPORTBClearBits(LED_GP); mPORTBSetPinsDigitalOut(LED_GP); mPORTBSetPinsDigitalOut(LED_CONFIGURED);
//#define mInitButtons() mPORTBSetPinsDigitalIn(BIT_14 | BIT_15)

#define mLED_On(bit) mPORTASetBits(bit)
#define mLED_Off(bit) mPORTAClearBits(bit)

// configured LED set
#define mLED_USB_Configured_On() mPORTBSetBits(LED_CONFIGURED)
#define mLED_USB_Configured_Off() mPORTBClearBits(LED_CONFIGURED)

// general purpose LED set
#define mLED_USB_GP_On() mPORTBClearBits(LED_GP)
#define mLED_USB_GP_Off() mPORTBSetBits(LED_GP)

#endif
