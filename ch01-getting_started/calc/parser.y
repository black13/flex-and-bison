%{
#include <stdio.h>
#include <stdlib.h>
#include "scanner.h"  /* wherein yylex is declared */

void yyerror(const char *msg);
%}

%output "parser.c"
%defines "parser.h"

%token NUMBER
%token ADD SUB MUL DIV MOD
%token EOL
%token LPAREN RPAREN

%%

calclist: /* empty */
    | calclist EOL     { printf(">");         }
    | calclist exp EOL { printf(">%d\n", $2); }
    ;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    ;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor DIV term { $$ = $1 / $3; }
    | factor MOD term { $$ = $1 % $3; }
    ;

term:NUMBER
    | LPAREN exp RPAREN { $$ = $2; }
    ;
%%

void yyerror(const char *msg)
{
    fprintf(stderr, "%s\n", msg);
}
