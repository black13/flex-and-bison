%{
#include "parser.h"             /* token definitions: ADD, SUB, etc */
void yyerror(const char *msg);
%}

%option outfile="scanner.c" header-file="scanner.h"

%%
"+"     { return ADD;          }
"-"     { return SUB;          }
"*"     { return MUL;          }
"/"     { return DIV;          }
"%"     { return MOD;          }
"("     { return LPAREN;       }
")"     { return RPAREN;       }
[0-9]+  {
          yylval=atoi(yytext);
          return NUMBER;
        }
\n      { return EOL;          }
[ \t]   { /*skip whitespace*/  }

.       { yyerror("Error: illeagal character(s)!\n"); }
%%

int yywrap(void){
    return 1;
}
