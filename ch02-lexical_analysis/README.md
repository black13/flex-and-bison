# Chapter 2 Lexical Analysis

## Token Numbers

When a flex scanner returns a stream of tokens, each token actually has two parts, the token and the token's value. The token is a small integer. The token numbers are arbitrary, except that the token zero always means end-of-file. When `bison` creates a parser, `bison` assigns the token numbers automatically starting at 258 (this avoids collisions with literal character tokens) and creates a .h with definitions of the tokens numbers. We can just define a few tokens by hand.
