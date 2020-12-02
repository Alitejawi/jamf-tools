#!/bin/bash

grep -Ril "string_to_search_here" /path/to/search/

# Flags to use with grep
# -i, --ignore-case | case insensitive search
# -r | recursively search subdirectories
# -l, --files-with-matches |
# -o, --only-matching | Prints only the matching part of the lines.Only the names of files containing selected lines are written to standard output
# -E --extended-regexp | Interpret pattern as an extended regular expression (i.e. force grep to behave as egrep)