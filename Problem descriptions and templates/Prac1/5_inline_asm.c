#include "iodefine.h"

void switchLEDon()
{
	/* The following block does the same as	
		P7=(P7|0b10000000);
	   but rewritten in assembly.
	   | means bitwise OR
	   To understand this piece of code you will need to 
	   search for the keywords (mov, or) in the Software Manual.
	   
	   0xFF07 is the memory mapped IO address of register P7.
	   It is also called a special function register.
	   See Hardware Manual page 138.
	*/
	
	asm(";; Switch LED on         \n\t"
	    "movw bc, #0xff07         \n\t"
	    "mov a, [bc]              \n\t"
	    "or a, #10000000B ;; Bitwise OR \n\t"
	    "mov [bc], a              \n\t"
	   );
}

void switchLEDoff()
{
	/* The following block does the same as	
		P7=(P7&0b01111111);
	   but rewritten in assembly.
	   & means bitwise AND
	*/

	asm(";; Switch LED off          \n\t"
	    "movw bc, #0xff07           \n\t"
	    "mov a, [bc]                \n\t"
	    "and a, #01111111B ;; Bitwise AND \n\t"
	    "mov [bc], a                \n\t"
	   );
}

void delay(unsigned long time)
{
	/*
	  We leave this piece of code in C for now, 
	  as it is complex to rewrite in asm.
	*/
	unsigned long counter=0;
	for(counter=0; counter<time; counter++)
	{
		asm("nop"); // assembly for No Operation
	}
}

int main(void)
{
    // Set Port 7, Pin 7 as output
    PM7=0x7F;

    // main loop 
    while (1) {
    	switchLEDon();
    	delay(80000UL);
    	switchLEDoff();
    	delay(80000UL);
    }
}
