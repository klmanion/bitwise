/** bitwise
 * 	A visualisation of bitwise arithmetic
 */

#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <err.h>

char*	binary_str (const int);

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

/** binary_str()
 * 	This implementation is _very_ simplified for prototyping purposes.
 *
 * 	Returns a string representing a number in binary.
 * 	Must be freed.
 */
char*
binary_str(
    const int	N)
{
	int n;
	char *bstr;

	n = N;

	if (!(bstr = (char *)malloc(CHAR_BIT * (8+1))))
	    errx(1,"malloc error: %s:%d", __FILE__, __LINE__);

	for (size_t i=0; i<8; ++i)
	    {
		bstr[i] = (!!(n & 0x80)) + '0';

		n <<= 1;
	    }

	bstr[8] = '\0';

	return bstr;
}

/* vi: set ts=8 sw=8 noexpandtab tw=79: */
