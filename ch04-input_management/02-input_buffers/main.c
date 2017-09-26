#include <stdio.h>
#include "parser.h"
#include "scanner.h"
extern FILE *yyin;

int main(int argc, char *argv[])
{
	YY_BUFFER_STATE bp;
	FILE *fp;
	if(argc > 1) { // from files
		for (int i = 1; i < argc; i++) {
	        fp = fopen(argv[i], "r");
		    if(!fp) continue;
			printf("Scanning file: %s\n", argv[i]);
		    bp = yy_create_buffer(fp, YY_BUF_SIZE);
		    yy_switch_to_buffer(bp);
            yyparse();
		    yy_delete_buffer(bp);
		}
	} else { // stdin
		yyparse();
	}

    return 0;
}
