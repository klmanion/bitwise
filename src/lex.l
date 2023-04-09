/** lex.l
 *	Tokenizer for bitwise
 *	
 *	_Currently_ only reads in number and passes it to the provisional
 *	implementation of binary_str.
 */

%{
#include <stdlib.h>
#include <stdio.h>
#include <err.h>
#include "bitwise.h"
%}

%%

[0-9]+	{
		int n;
		char *bstr;

		n = atoi(yytext);
	
		printf("0x%0x: %s\n", n, (bstr=binary_str(n)));
	
		free(bstr);
	}

.*	{ errx(1,"invalid input"); }

%%

int
yywrap()
{
	return 1;
}

/* vi: set ts=8 sw=8 noexpandtab tw=79: */
