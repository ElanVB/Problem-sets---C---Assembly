#include "iodefine.h"

//tell the compiler we defined these functions in another file
extern switchLEDon();
extern switchLEDoff();

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
