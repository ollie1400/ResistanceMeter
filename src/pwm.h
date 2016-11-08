/* 
 * PWM stuff
 */

#include "system.h"

#ifndef PWM_H
#define	PWM_H

#define DEFAULT_PWM_FREQ    1000
#define DEFAULT_DUTY_CYCLE  50

// functions
void InisialisePWM(void);
void EnablePWM(void);
void DisablePWM(void);
float SetPWMDuty(float newDuty);

// macros
#define mDutyPercentage(p) p > 100. ? (PR2 + 1) : (p < 0. ? 0 : (PR2 + 1) * (p / 100));
//#define mSetPWMDuty(p) OC1RS = mDutyPercentage(p);

#endif	/* PWM_H */

