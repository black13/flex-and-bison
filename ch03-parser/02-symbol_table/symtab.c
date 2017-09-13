#include <stdlib.h>
#include <string.h>
#include "symtab.h"

static struct Symbol symtab;    /* symbol table head */

struct Symbol *create_symbol(const char *name)
{
    struct Symbol *symbol = (struct Symbol *)malloc(sizeof(struct Symbol));
    symbol->name = malloc(strlen(name) + 1);
    strcpy(symbol->name, name);
    symbol->value = 0;
    symbol->next = NULL;
    return symbol;
}

struct Symbol *symtab_enter(const char *name)
{
    struct Symbol *symbol = symtab_retrieve(name);
    if (!symbol) {
        symbol = create_symbol(name);
        symbol->next = symtab.next;
        symtab.next = symbol;
    }
    return symbol;
}

struct Symbol *symtab_retrieve(const char *name)
{
    for (struct Symbol * p = &symtab; p->next != NULL; p = p->next) {
        if (strcmp(p->next->name, name) == 0)
            return p->next;
    }
    return NULL;
}

void symtab_destroy()
{
    while (symtab.next) {
        struct Symbol *temp = symtab.next->next;
        free(symtab.next->name);
        free(symtab.next);
        symtab.next = temp;
    }
}
