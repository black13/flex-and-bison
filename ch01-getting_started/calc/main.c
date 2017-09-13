#include "parser.h"
#include <stdio.h>

int main(void)
{
    printf("> "); /* prompt */
    yyparse();
    return 0;
}
