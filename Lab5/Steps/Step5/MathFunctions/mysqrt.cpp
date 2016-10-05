#include <math.h>

double mysqrt(double x) {
#if defined (HAVE_LOG) && defined (HAVE_EXP)
	return exp(log(x)*.5);
#else //Define the sqrt function another way
	return sqrt(x);
#endif
}

