CMAKE_MINIMUM_REQUIRED(VERSION 2.8)

FIND_PACKAGE(FLEX)

FLEX_TARGET(Scanner scanner.l  ${CMAKE_CURRENT_SOURCE_DIR}/scanner.c)

#MESSAGE("---------------------------------")
#MESSAGE(${CMAKE_CURRENT_SOURCE_DIR})
#MESSAGE(${FLEX_Scanner_OUTPUTS})
#MESSAGE("---------------------------------")

AUX_SOURCE_DIRECTORY(. SOURCES)
ADD_EXECUTABLE(scanner5
    ${FLEX_Scanner_OUTPUTS}
    ${SOURCES}
)
