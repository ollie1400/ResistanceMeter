/* 
 * ADC stuff
 */

#ifndef ADC_H
#define	ADC_H


// functions
void InitialiseADC(void);
int analogRead(char analogPIN);

// define pin
#define ADCPIN 5;

#endif	/* ADC_H */

