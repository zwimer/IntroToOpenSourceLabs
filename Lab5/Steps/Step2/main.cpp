#include <stdio.h>
#include <stdlib.h>
#include <math.h>

//Include version and settings info
#include "TutorialConfig.h"

//If you wish, use custom math functions
#ifdef USE_MYMATH
#include "MathFunctions.h"
#endif

//Main
int main (int argc, char *argv[]) {

	//Check usage
	if (argc < 2) {
		fprintf(stdout,"%s Version %d.%d\n", argv[0], Tutorial_VERSION_MAJOR,
													  Tutorial_VERSION_MINOR);

		fprintf(stdout,"Usage: %s number\n",argv[0]);
		return 1;
	}
	
	//The actual program
	double inputValue = atof(argv[1]), outputValue = sqrt(inputValue);
	fprintf(stdout,"The square root of %g is %g\n",
			inputValue, outputValue);
	
	//Success
	return 0;
}
