/***********************************************************
* main.c
* author: frankshong
* date: Sat Apr 18 04:59:51 CST 2015
***********************************************************/
#include <stdio.h>
#include "parser.h"
extern FILE *yyin;

int main(int argc, char *argv[])
{
	yyin = fopen("example.txt", "r");
    yyparse();
	fclose(yyin);
    return 0;
}
