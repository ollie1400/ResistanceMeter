#ifndef __PWM_C
#define __PWM_C

// everything to do with pwm
#include <Compiler.h>
#include "HardwareProfile.h"
#include "pwm.h"

// initialise the PWM module using timer 2
void InitialisePWM(void)
{
    //-------------- PWM -----------------

    // setup PWM on RPB7
    // map this pin to OC1 using peripheral select
    RPB7R = 0x0005;
    // Configure standard PWM mode for output compare module 1
    OC1CON = 0x0006;

    // A write to PRy configures the PWM frequency
    // PR = [FPB / (PWM Frequency * TMR Prescale Value)] ? 1
    // : note the TMR Prescaler is 1 and is thus ignored
    PR2 = (SYS_FREQ / DEFAULT_PWM_FREQ) - 1;

    // A write to OCxRS configures the duty cycle
    // : OCxRS / PRy = duty cycle
    OC1RS = mDutyPercentage((float)DEFAULT_DUTY_CYCLE);

    // set output compare module mode
    OC1CONbits.OCM = 6;

    // set up timer 2
    T2CONbits.TCKPS = 0;   // prescaler 1
}

void EnablePWM(void)
{
    // enable output compare module and timer
    T2CONbits.ON = 1;
    OC1CONbits.ON = 1;
}

void DisablePWM(void)
{
    // disable output compare module and timer
    T2CONbits.ON = 0;
    OC1CONbits.ON = 0;
}

// set a new duty cycle, within bounds
float SetPWMDuty(float newDuty)
{
    OC1RS = mDutyPercentage(newDuty);
    if (newDuty > 100.) return 100.;
    if (newDuty < 0.) return 0.;
    return newDuty;
}
#endif