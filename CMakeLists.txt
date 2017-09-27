CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

ADD_SUBDIRECTORY(ch01-getting_started/wc)
ADD_SUBDIRECTORY(ch01-getting_started/calc)

ADD_SUBDIRECTORY(ch02-scanner/01-token_numbers1)
ADD_SUBDIRECTORY(ch02-scanner/02-token_numbers2)
ADD_SUBDIRECTORY(ch02-scanner/03-substitutions)
ADD_SUBDIRECTORY(ch02-scanner/04-token_values)
ADD_SUBDIRECTORY(ch02-scanner/05-states_and_comments)
ADD_SUBDIRECTORY(ch02-scanner/06-resolving_ambiguous_patterns)

ADD_SUBDIRECTORY(ch03-parser/01-shift_reduce_parsing)
ADD_SUBDIRECTORY(ch03-parser/02-symbol_table)

ADD_SUBDIRECTORY(ch04-input_management/01-setting_yyin)
ADD_SUBDIRECTORY(ch04-input_management/02-input_buffers)
ADD_SUBDIRECTORY(ch04-input_management/03-input_from_strings)

ADD_SUBDIRECTORY(ch05-reentrancy/01-pure_scanner)
ADD_SUBDIRECTORY(ch05-reentrancy/02-pure_parser)
