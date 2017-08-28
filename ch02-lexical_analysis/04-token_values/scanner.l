/******************************************************
* Definitions
******************************************************/
%{
#include <string.h>
#include "token.h"

union {
    int num;
    char *name;
} yylval;
%}

digit [0-9]

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
\n       { }
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
        printf("token: %s\n", TokenText[token]);
        if( token == IDENTIFIER ) {
            printf("identifier: %s\n", yylval.name);
            free(yylval.name);
        }else if ( token == INTEGER ) {
            printf("number: %d\n", yylval.num);
        }
    }

    return 0;
}
