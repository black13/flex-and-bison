%{
#include "parser.h"
#include "symtab.h"
%}

%option outfile="scanner.c" header-file="scanner.h"

%%

"+"    { return PLUS;    }
"-"    { return MINUS;   }
"*"    { return TIMES;   }
"/"    { return DIVIDE;  }
"="    { return ASSIGN;  }
[0-9]+ { yylval.num = atoi(yytext); return INTEGER; }
\n     { return EOL;     }
[ \t]  { /* skip */      }
[a-zA-Z][a-zA-Z0-9]*  { yylval.id = symtab_enter(yytext);
    return IDENTIFIER;
}
.      { fprintf(stderr, "Illeagal Character(s):%s\n", yytext); }

%%

int yywrap()
{
    return 1;
}
