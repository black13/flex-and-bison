%{
#include <stdio.h>
#include "scanner.h"
#include "symtab.h"

void yyerror(const char *s);
%}

%output "parser.c"
%defines "parser.h"

/*yylval type*/
%union{
    int num;
    struct Symbol *id;
}

%token PLUS MINUS TIMES DIVIDE ASSIGN
%token <num> INTEGER
%token <id> IDENTIFIER
%token EOL

%type <num> factor exp term

%%
program : /* null */
    | program IDENTIFIER ASSIGN exp EOL
    { $2->value = $4; printf("ans: %d\n", $4); }
    | program exp EOL
    { printf("ans: %d\n", $2); }
    ;

exp: factor
    | exp PLUS factor    { $$ = $1 + $3; }
    | exp MINUS factor   { $$ = $1 - $3; }
    ;

factor: term
    | factor TIMES term  { $$ = $1 * $3; }
    | factor DIVIDE term { $$ = $1 / $3; }
    ;

term: INTEGER
    | IDENTIFIER       { $$ = $1->value; }
%%

int main()
{
    yyparse();
    symtab_destroy();
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "%s\n", s);
}
