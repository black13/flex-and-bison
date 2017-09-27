#include <stdio.h>
#include "scanner.h"
#include "state.h"

int main(int argc, char *argv[])
{
    State state = { 0, 0, 0 };  /* my instance data */
    // yyscan_t scanner;        /* flex instance data */

    if (yylex_init_extra(&state, &state.scanner)) {
        perror("init alloc failed");
        return 1;
    }

    if (argc > 1) {
        FILE *f;

        if (!(f = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return (1);
        }
        yyset_in(f, state.scanner);
    } else
        yyset_in(stdin, state.scanner);

    yylex(state.scanner);
    printf("%8d%8d%8d\n", state.lines, state.words, state.chars);

    if (argc > 1)
        fclose(yyget_in(state.scanner));

    yylex_destroy(state.scanner);

    return 0;

}
