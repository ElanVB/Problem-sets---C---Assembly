#include "iodefine.h"

extern int calculateUniqueNumber(int, int, int, int, int, int, int, int);
extern int generate_checksum(char*);
extern int validate_checksum(int);
extern void bubble_sort(char*);

int main(void)
{
	int uniqueNumber = 0;
	int checksum = 0;
	int valid = 0;

	uniqueNumber = calculateUniqueNumber( 1, 8, 2, 7, 3, 6, 4, 5);

	char studentNr[] = "18273645";
	checksum = generate_checksum(studentNr);

	while (1);
}
