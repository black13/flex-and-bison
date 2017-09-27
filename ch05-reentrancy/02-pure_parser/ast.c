/***********************************************************
 * Implementation of functions used to build the syntax tree.
 ***********************************************************/
#include "ast.h"
#include <stdlib.h>
#include <string.h>

/* Allocate space for abstract syntax tree */
static AST *allocate_ast()
{
    AST *ast = (AST *) malloc(sizeof(AST));

    if (ast == NULL)
        return NULL;

    memset(ast, 0, sizeof(AST));

    return ast;
}

AST *new_number(int value)
{
    AST *ast = allocate_ast();

    if (ast == NULL)
        return NULL;

    ast->type = scInt;
    ast->value = value;

    return ast;
}

AST *new_binexp(SyntaxCategory type, AST * left, AST * right)
{
    AST *ast = allocate_ast();

    if (ast == NULL)
        return NULL;

    ast->type = type;
    ast->left = left;
    ast->right = right;

    return ast;
}

void delete_ast(AST * ast)
{
    if (ast == NULL)
        return;

    delete_ast(ast->left);
    delete_ast(ast->right);

    free(ast);
}
