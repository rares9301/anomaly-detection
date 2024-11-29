#include <stdio.h>
#define MAX(a, b) a > b ? a : b;

strutct cucumber {
	long long int length;
}

int main(void) {
	cucumber Robert, Sebi;
	Robert.length = 20;
	Sebi.length = 5;

	printf("Maximum cucumber length:%lld", MAX(Robert.length, Sebi.length));
	return 0;
}
