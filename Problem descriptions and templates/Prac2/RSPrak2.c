/***************************************************************/
/*                                                             */
/*      PROJECT NAME :  RSPrak2                                */
/*      FILE         :  RSPrak2.c                              */
/*      DESCRIPTION  :  Main Program                           */
/*      CPU SERIES   :  RL78 - G13                             */
/*      CPU TYPE     :  R5F100LE                               */
/*                                                             */
/***************************************************************/

#include "iodefine.h"

extern adder(int a, int b, int c, int d);
extern verander_kas(char string[]);

char asciiz[] = "mOET VERKIESLIK TEEN vRYDAG @ 17:00 VOLTOOI WEES![{'ok'}]";

void main(void)
{
	int answer = 0;
	char* answerString;

	while(1)
	{
		answer = adder(1,2,3,4);
		verander_kas(asciiz);
		answerString = asciiz;
	}
}
