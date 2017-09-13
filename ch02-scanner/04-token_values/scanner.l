/******************************************************
* Definitions
******************************************************/
%{
#include <string.h>
#include "token.h"

#define POSITION_DECL \
    int line; int column;

/* token values */
struct {
        POSITION_DECL
        union {
            int num;
            char *name;
        };
} yylval;

int yycolumn = 1;

/* actions for each rule, to set token locations */
#define YY_USER_ACTION \
    yylval.line = yylineno; yylval.column = yycolumn; \
    yycolumn += yyleng;

%}

digit [0-9]

%option yylineno

/******************************************************
* Rules
******************************************************/
%%
else     { return ELSE; }
";"      { return SEMICOLON; }
for      { return FOR; }
{digit}+ { yylval.num = atoi(yytext); return INTEGER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.name = malloc(strlen(yytext)+1);
    strcpy(yylval.name, yytext);
    return IDENTIFIER; }
[ \t]    { }
\n       { yycolumn = 1; }
.        { return ILLEAGAL; }
<<EOF>>  { return EOS; }
%%

/******************************************************
* Subroutines
******************************************************/
int yywrap()
{
    return 1;
}

int main(int argc, char* argv[])
{
    int token;

    while((token = yylex())){
        printf("%d, %d:\t%s", yylval.line, yylval.column,
            TokenText[token]);
        if( token == IDENTIFIER ) {
            printf(" (%s)", yylval.name);
            free(yylval.name);
        }else if ( token == INTEGER ) {
            printf(" (%d)", yylval.num);
        }
        printf("\n");
    }

    return 0;
}
