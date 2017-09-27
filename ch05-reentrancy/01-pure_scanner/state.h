#ifndef STATE_H
#define STATE_H

typedef struct _State {
    int chars;
    int words;
    int lines;
    yyscan_t scanner;           /* flex instance data */
} State;

#endif /*STATE_H */
