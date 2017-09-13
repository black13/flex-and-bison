#define DECL_TOKEN_SET \
    DECL_TOKEN(EOS, "<end-of-file>") \
    DECL_TOKEN(ILLEAGAL, "<illeagal-character>") \
    DECL_TOKEN(ELSE, "else") \
    DECL_TOKEN(SEMICOLON, ";") \
    DECL_TOKEN(FOR, "for") \
    DECL_TOKEN(INTEGER, "<integer>") \
    DECL_TOKEN(IDENTIFIER, "<id>") 

#define DECL_TOKEN(type, text) type,
typedef enum {
    DECL_TOKEN_SET
} TokenType;
#undef DECL_TOKEN

#define DECL_TOKEN(type, text) text,
static const char *TokenText[] = {
    DECL_TOKEN_SET
};
#undef DECL_TOKEN
