#ifndef SYMTAB_H
#define SYMTAB_H

struct Symbol {
    char *name;
    int value;
    struct Symbol *next;
};

struct Symbol *symtab_enter(const char *name);
struct Symbol *symtab_retrieve(const char *name);
void symtab_destroy();

#endif /* SYMTAB_H */
