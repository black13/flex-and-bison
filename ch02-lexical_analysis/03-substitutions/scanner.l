/******************************************************
* Definitions
******************************************************/
%{
#include "token.h"
%}

digit [0-9]
alphabet [a-zA-Z]
/******************************************************
* Rules
******************************************************/
%%
else     { return ELSE; }
";"      { return SEMICOLON; }
for      { return FOR; }
{digit}+ { return INTEGER; }
{alphabet}({alphabet}|{digit})* { return IDENTIFIER; }
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
    }

    printf("EOF token: %s\n", TokenText[token]);

    return 0;
}
