/******************************************************
* Definitions
******************************************************/
/* C code */
%{

#include <stdio.h>

void yyerror(const char *msg) {
    fprintf(stderr, "%s", msg);
    exit(1);
}

%}

%option outfile="scanner.c" header-file="scanner.h"

/* Substitutions */
digit      [0-9]
whitespace [ \t\n]

/* Start states */
%x COMMENT

/******************************************************
* Rules
* example: a + 4 / 6
******************************************************/

%%
{whitespace}+        { /* skip */                        }
[0-9]+               { printf("INTEGER:%s\n", yytext);   }
[0-9]*\.[0-9]+       { printf("FLOAT:%s\n", yytext);     }
[a-zA-Z][0-9a-zA-Z]* { printf("VARIABLE:%s\n", yytext);  }
[=\+\-\*\/\%]        { printf("OPERATOR:%s\n", yytext);  }
.                    { printf("UNKNOWN:%c\n", yytext[0]);}
"//"[^\n]*\n         { /* skip */                        }
"/*"                 { BEGIN(COMMENT);                   }
<COMMENT>"*/"        { BEGIN(INITIAL);                   }
<COMMENT>\n          { /* skip */                        }
<COMMENT>.           { /* skip */                        }
<COMMENT>"/*"        { yyerror("Nested Comments\n");     }
<COMMENT><<EOF>>     { yyerror("Incomplete Comments\n"); }
%%

/******************************************************
* Subroutines
******************************************************/
int yywrap(){
    return 1;
}
