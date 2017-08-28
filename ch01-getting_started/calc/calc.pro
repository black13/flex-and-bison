############################################################
# Project file
# Makefile will include this project file
############################################################

# Specify target name
TARGET = calc

# Specify the #include directories which should be searched when compiling the project.
INCLUDEPATH = .

# Specify the source directories which should be searched when compiling the project.
DEPENDPATH = .

# Define the header files for the project.
HEADERS =

# Define the source files for the project.
SOURCES = main.c

# Specify a list of Lex source files.
# All headers and source files will automatically be included in the project.
LEXSOURCES = scanner.l

# Specify a list of Yacc source files to be included in the project.
# All headers and source files will automatically be included in the project.
YACCSOURCES= parser.y
