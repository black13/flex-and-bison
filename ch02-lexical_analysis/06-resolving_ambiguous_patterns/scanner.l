%{
#include <stdio.h>
%}

%%
 /* match the longest possible string */
"+"    { printf("add");       }
"="    { printf("assign");    }
"+="   { printf("assignadd"); }

 /* match the pattern that appears first */
"if"                      { printf("keyword: if");    }
"else"                    { printf("keyword: else");  }
[a-zA-Z_][a-zA-Z0-9_]*    { printf("id: %s", yytext); }

%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}
