#include "iodefine.h"

// extern int calculateUniqueNumber(int, int, int, int, int, int, int, int);
extern int generate_checksum(char*);
extern int validate_checksum(int);
extern void bubble_sort(char*);

int main(void)
{
	int uniqueNumber = 0;
	int checksum = 0;
	int valid = 0;

	// uniqueNumber = calculateUniqueNumber( 1, 8, 2, 7, 3, 6, 4, 5);

	char studentNr[] = "15312704";
	checksum = generate_checksum(studentNr);

	valid = validate_checksum(checksum);


	bubble_sort(studentNr);

	/* Let's switch an LED on if the checksum is valid */
	if (valid==1)
	{
		// Set Port 7, Pin 7 as output
		PM7 = 0b01111111;
		/*
		  If we look at the circuit diagram of the demo board we will see
		  that we need to ground the one side of the LED to switch it on.
		  Grounding, or pulling to 0V is done by setting the pin to 0.
		*/
		P7=(P7&0b01111111);
	}

  while (1);
}
