/******************************************************
* Definitions
******************************************************/
%{
#include "token.h"
%}

/******************************************************
* Rules
******************************************************/
%%
else    { return ELSE; }
";"     { return SEMICOLON; }
for     { return FOR; }
[0-9]+  { return INTEGER; }
[a-zA-Z][a-zA-Z0-9]* { return IDENTIFIER; }
[ \t]   { }
\n      { }
.       { return ILLEAGAL; }
<<EOF>> { return EOS; }
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
