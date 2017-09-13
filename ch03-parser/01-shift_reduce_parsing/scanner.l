%{
#include "parser.h"
%}

%option outfile="scanner.c" header-file="scanner.h"

%%

"+"    { return PLUS;    }
"-"    { return MINUS;   }
"*"    { return TIMES;   }
"/"    { return DIVIDE;  }
[0-9]+ { return INTEGER; }
\n     { return EOL;     }
[ \t]  { /* skip */      }
[a-zA-Z][a-zA-Z0-9]*  { return IDENTIFIER; }
.      { fprintf(stderr, "Illeagal Character(s):%s\n", yytext); }

%%

int yywrap()
{
    return 1;
}
