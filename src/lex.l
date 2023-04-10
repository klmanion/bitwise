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

#define YY_NO_UNPUT
#define YY_NO_INPUT
%}

%%

[0-9]+	{ yylval = (YYSTYPE)atoi(yytext); return NUM; }

.*	{ warnx("invalid input"); }

%%

int
yywrap()
{
	return 1;
}

/* vi: set ts=8 sw=8 noexpandtab tw=79: */
