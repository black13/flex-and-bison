#include <stdio.h>
#include "parser.h"
#include "scanner.h"
extern FILE *yyin;

int main(int argc, char *argv[])
{
	char buf[512];
	YY_BUFFER_STATE bp;
	if(argc > 1) { // from strings 
		for (int i = 1; i < argc; i++) {
			printf("Scanning string: %s\n", argv[i]);
			memset(buf, 0, 512);
			strcpy(buf, argv[i]);
		    bp = yy_scan_string(buf);
		    yy_switch_to_buffer(bp);
            yyparse();
		    yy_delete_buffer(bp);
		}
	} else { // stdin
		yyparse();
	}

    return 0;
}
