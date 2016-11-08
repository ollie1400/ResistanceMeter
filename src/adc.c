// adc stuff

#include <Compiler.h>
#include "HardwareProfile.h"
#include "adc.h"


// initialise
void InitialiseADC(void)
{
    //AD1CON1bits.CLRASAM = 0;
    /*
    AD1CON1CLR = 0x8000;    // disable ADC before configuration

    // set AN5 to input
    ANSELBbits.ANSB3 = 1;   // set RB3 (AN5) to analog in
    
    // set input pin
    AD1CHSbits.CH0SA = 5;

    // mode
    AD1CON1bits.SSRC = 7;   // internal counter ends sampling and starts conversion (auto-convert), manual sample (See P.205 of DS)

    AD1CON3bits.ADRC = 1;  // clock is FRC
    AD1CON3bits.ADCS = 1;  // TAD = 4*TPB
    AD1CON3bits.SAMC = 15; // acquisition time = 15*TAD

    AD1CON2bits.VCFG = 0;  // use AVSS/AVDD as references
    */


    //ANSELAbits.ANSA0 = 1;
    //ANSELAbits.ANSA1 = 1;
    //TRISAbits.TRISA0 = 1;
    //TRISAbits.TRISA1 = 1;
    
    ANSELBbits.ANSB3 = 1;   // set RB3 (AN5) to analog
    AD1CON1CLR = 0x8000;    // disable ADC before configuration
    AD1CON1 = 0x00E0;       // internal counter ends sampling and starts conversion (auto-convert), manual sample
    //AD1CON2bits.VCFG = 0;   // AD1CON2<15:13> set voltage reference to pins AVSS/AVDD
    AD1CON2bits.VCFG = 0b011;   // AD1CON2<15:13> set voltage reference to pins External Vref + and -
    AD1CON3 = 0x0f01;       // TAD = 4*TPB, acquisition time = 15*TAD

    // configure pins as inputs maybe?
    //mPORTASetPinsAnalog(BIT_0);
    
    AD1CON1SET = 0x8000;    // Enable ADC
}

// manually ask for a read (blocking)
/*
int analogRead(char analogPIN)
{
    //AD1CHS = analogPIN << 16;       // AD1CHS<16:19> controls which analog pin goes to the ADC
    AD1CHSbits.CH0SA = ADCPIN;

    AD1CON1bits.SAMP = 1;           // Begin sampling
    while( AD1CON1bits.SAMP );      // wait until acquisition is done
    while( ! AD1CON1bits.DONE );    // wait until conversion done

    return ADC1BUF0;                // result stored in ADC1BUF0
}*/

int analogRead(char analogPIN){
    AD1CHS = analogPIN << 16;       // AD1CHS<16:19> controls which analog pin goes to the ADC

    //AD1CHSbits.CH0SA = 0b1101;

    AD1CON1bits.SAMP = 1;           // Begin sampling
    while( AD1CON1bits.SAMP );      // wait until acquisition is done
    while( ! AD1CON1bits.DONE );    // wait until conversion done

    return ADC1BUF0;                // result stored in ADC1BUF0
}