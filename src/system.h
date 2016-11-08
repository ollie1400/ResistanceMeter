#ifndef __SYSTEM_H
#define	__SYSTEM_H

// Defines ------------------------------------------------------------------------------------------------------------

// system frequency, depends on things in configuration_bits.c
#define SYS_FREQ 40000000L

#define FLASH_SIZE 10

// Function Declarations ----------------------------------------------------------------------------------------------

void InitializeSystem(void);
void delay_us( unsigned t);

#endif
