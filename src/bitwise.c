/** bitwise.c
 */

#include "bitwise.h"

#include <limits.h>
#include <err.h>

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
