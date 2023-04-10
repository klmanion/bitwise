/** parse.y
 *	Grammer for bitwise
 */

%{
#include <stdlib.h>
#include <stdio.h>
#include <err.h>
#include "parse.tab.h"
#include "bitwise.h"

int	yylex (void);
void	yyerror (const char *);
%}

%start prog

%token NUM

%%

prog	:	lines
	;

lines	:	line
	|	lines line
	;

line	:	NUM	{
				char *bstr;

				printf("0x%0X: %s\n", $1, (bstr=binary_str($1)));

				free(bstr);
			}
	;

%%

void
yyerror(
    const char	*errstr)
{
	errx(1,"%s", errstr);
}

/* vi: set ts=8 sw=8 noexpandtab tw=79: */
