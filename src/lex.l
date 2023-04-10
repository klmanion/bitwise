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
#include "parse.tab.h"
%}

%%

[0-9]+	{ yylval = atoi(yytext); return NUM; }

.*	{ warnx("invalid input"); }

%%

int
yywrap()
{
	return 1;
}

/* vi: set ts=8 sw=8 noexpandtab tw=79: */
