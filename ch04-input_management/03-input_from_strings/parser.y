%{
#include <stdio.h>
#include "scanner.h" /* where yylex is declared */

void yyerror(const char *s);
%}

%output "parser.c"
%defines "parser.h"

%token PLUS MINUS TIMES DIVIDE INTEGER IDENTIFIER
%token EOL

%%

program: /* empty, matches at the beginning of input */
    |program exp  { printf("Accepted!\n"); }
    ;

exp: factor
    | exp PLUS factor
    | exp MINUS factor
    ;

factor: term
    | factor TIMES term
    | factor DIVIDE term
    ;

term: INTEGER
    | IDENTIFIER
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "%s\n", s);
}
