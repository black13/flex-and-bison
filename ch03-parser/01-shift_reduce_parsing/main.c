/***********************************************************
* main.c
* author: frankshong
* date: Sat Apr 18 04:59:51 CST 2015
***********************************************************/
#include <stdio.h>
#include "parser.h"

int main(int argc, char *argv[])
{
    yyparse();
    return 0;
}
