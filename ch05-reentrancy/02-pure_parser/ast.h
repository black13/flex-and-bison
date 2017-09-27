/***********************************************************
 * Definition of the structure used to build the syntax tree.
 ***********************************************************/
#ifndef AST_H
#define AST_H

/* Abstract syntax tree node type */
typedef enum _SyntaxCategory {
    scInt,
    scMul,
    scDiv,
    scAdd,
    scSub
} SyntaxCategory;

/* Abstract syntax tree node structure */
typedef struct _AST {
    SyntaxCategory type;        /* type of operation */

    int value;                  /* valid only when type is scInt */
    struct _AST *left;          /* left side of the tree */
    struct _AST *right;         /* right side of the tree */
} AST;

/* Create an integer node */
AST *new_number(int value);

/* Create an operation node */
AST *new_binexp(SyntaxCategory type, AST * left, AST * right);

/* Delete ast recursively */
void delete_ast(AST * ast);

#endif /* AST_H */
