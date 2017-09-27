/***********************************************************
 * scanner.l file
 * To generate the lexical analyzer run: "flex scanner.l"
 **********************************************************/
%{
#include "ast.h"
#include "parser.h"
#include <stdio.h>
%}
 
%option outfile="scanner.c" header-file="scanner.h"
%option warn nodefault
 
%option reentrant noyywrap never-interactive nounistd
%option bison-bridge
 
DIGIT [0-9]
WS          [ \r\n\t]*
 
%%
 
{WS}            { /* Skip blanks. */ }
{DIGIT}+        { sscanf(yytext, "%d", &yylval->value); return TOKEN_NUMBER; }
 
[+\-*/()]        { return *yytext; }
.               {  }
 
%%
