#include "iodefine.h"

void switchLEDon()
{
  P7=(P7|0b10000000);
}

void switchLEDoff()
{
  P7=(P7&0b01111111);
}

void delay(unsigned long time)
{
  unsigned long counter=0;
  for(counter=0; counter<time; counter++);
}

int main(void)
{
    /*
      This code is more readable than the previous one. Readability and 
      reusability of the same code are two benefits of using funtions.
    */

    // Set Port 7, Pin 7 as output
    PM7 = 0b01111111;

    //main loop
    while (1) {
      switchLEDon();
      delay(80000UL);
      switchLEDoff();
      delay(80000UL);
    }
}
