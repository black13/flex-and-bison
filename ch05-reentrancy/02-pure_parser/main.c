#include <stdio.h>
#include <string.h>
#include "ast.h"
#include "parser.h"
#include "scanner.h"

int yyparse(AST ** ast, void *scanner);

AST *parse_string(const char *expr)
{
    AST *ast;
    yyscan_t scanner;
    YY_BUFFER_STATE state;

    if (yylex_init(&scanner)) {
        // couldn't initialize
        return NULL;
    }

    state = yy_scan_string(expr, scanner);

    if (yyparse(&ast, scanner)) {
        // error parsing
        return NULL;
    }

    yy_delete_buffer(state, scanner);

    yylex_destroy(scanner);

    return ast;
}

AST *parse_file(FILE * fp)
{
    AST *ast;
    yyscan_t scanner;
    YY_BUFFER_STATE state;

    if (yylex_init(&scanner)) {
        // couldn't initialize
        return NULL;
    }

    if (!fp)
        fp = stdin;
    state = yy_create_buffer(fp, YY_BUF_SIZE, scanner);
    yy_switch_to_buffer(state, scanner);

    if (yyparse(&ast, scanner)) {
        // error parsing
        return NULL;
    }

    yy_delete_buffer(state, scanner);

    yylex_destroy(scanner);

    return ast;
}

int evaluate(AST * e)
{
    switch (e->type) {
    case scInt:
        return e->value;
    case scMul:
        return evaluate(e->left) * evaluate(e->right);
    case scDiv:
        return evaluate(e->left) / evaluate(e->right);
    case scAdd:
        return evaluate(e->left) + evaluate(e->right);
    case scSub:
        return evaluate(e->left) - evaluate(e->right);
    default:
        // shouldn't be here
        return 0;
    }
}

int main(int argc, char **argv)
{
    AST *e = NULL;
    char expression[512];
    int result = 0;

    FILE *fp = NULL;

    if (argc < 2) {
        printf
            ("Plese input an expression including integers and operators(+ - * / ()). Enter Ctrl+D to end input.\n");
        e = parse_file(fp);     /* from stdin */
    } else if (argc == 2) {
        fp = fopen(argv[1], "r");
        if (!fp) {
            fprintf(stderr, "Cannot open file!\n");
            return 1;
        }
        e = parse_file(fp);
        fclose(fp);
    } else {
        printf("Usage: %s [filename]\n", argv[0]);
        return 1;
    }

    if (!e) {
        fprintf(stderr, "Parsing error!\n");
        return 1;
    }

    result = evaluate(e);

    printf("ans:%d\n", result);

    delete_ast(e);

    return 0;
}
