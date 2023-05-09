#!/bin/sh

grep -iP --only-matching '\"mars\"\:\{\"status\"\:.*$' $1 | awk '{ match($0, /\"lastdate\"\:\"[0-9]+\-[A-Za-z][A-Za-z][A-Za-z]\-[0-9]+[^\"]+\"/); printf("%s ", substr($0, RSTART, RLENGTH)); match($0, /\"mars\"\:\{\"status\"\:[^d]+\"dec\"\:[\-0-9]+\.[0-9]+/); printf("%s\n", substr($0, RSTART, RLENGTH)); }'
