#ifndef _GENERAL_
#define _GENERAL_

// termination character(s) for communication
#define TERMCHAR "\n"//"\r\n"

#define STRLEN(s) (sizeof(s)/sizeof(s[0])) - 1

// command strings
#define ADC_READ_COMSTR "adc:read"
#define ADC_READ_COMSTR_LEN 8

#endif