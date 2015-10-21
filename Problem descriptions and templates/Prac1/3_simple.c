#include "iodefine.h"

int main(void)
{
    unsigned long counter = 0;

    /* 
       Set port 7, pin 7 as an output
       See Hardware Manual page 803: 0=output, 1=input
    */
    PM7 = 0b01111111;

    // main loop
    while (1U)
    {
        /* 
           Switch LED on
           Make port 7, pin 7 high
           See Hardware Manual page 187 - 
           "These registers can be set by a 1-bit or 8-bit memory 
            manipulation instruction."
        */

        P7_bit.no7 = 1;               // Shorthand to set pin high.
        //P7 = (P7 | 0b10000000);     // The better way of setting 
                                      // a bit in a registry high.

        // delay
        for (counter=0;counter<800000UL;counter++);
        
        /* 
           Switch LED off
           Make port 7, pin 7 low
           See Hardware Manual page 187
        */
        P7_bit.no7 = 0;              // Shorthand to set a pin low.
        //P7 = (P7 & 0b01111111);    // Or use the better way by reading, 
                            // bitwise AND and saving the register again.

        // delay
        for (counter=0;counter<800000UL;counter++);
    }
}
