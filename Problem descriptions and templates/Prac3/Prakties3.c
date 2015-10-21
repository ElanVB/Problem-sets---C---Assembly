#include "iodefine.h"

extern int calculate(char operand,int numA, int numB);
extern void reverse(char* string);

int main(void)
{
	int added = 0;
	int subed = 0;
	int muled = 0;

	char text[] = "!dlroW olleH";

	added = calculate('+',5,16);
	subed = calculate('-',42,13);
	muled = calculate('*',2,7);

	reverse(text);

	while (1);
}
