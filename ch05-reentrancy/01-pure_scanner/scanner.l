%option warn noyywrap nodefault reentrant
%{
#include "state.h"
#define YY_EXTRA_TYPE struct _State *
%}

%option outfile="scanner.c" header-file="scanner.h"

%%
[a-zA-Z]+    { yyextra->words++; yyextra->chars += strlen(yytext); }
\n           { yyextra->chars++; yyextra->lines++;                 }
.            { yyextra->chars++;                                   }
%%
