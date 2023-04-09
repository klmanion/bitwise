/** main.c
 * 	bitwise:
 *
 * 	A visualisation of bitwise arithmetic
 */

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <err.h>
#include "bitwise.h"

int
main(
    int		argc,
    char *const argv[])
{
	int n;
	char *bstr;

	--argc;	++argv;

	if (argc != 1)
	    errx(1,"pass a number on the command line");

	n = atoi(argv[0]);

	printf("0x%0x: %s\n", n, (bstr=binary_str(n)));

	free(bstr);

	return EXIT_SUCCESS;
}

/* vi: set ts=8 sw=8 noexpandtab tw=79: */
