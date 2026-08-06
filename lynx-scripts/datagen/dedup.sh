#!/usr/bin/env bash

#awk -F';' '
#{
#    key = $1
#    sub(/ [0-9]+ [0-9]+$/, "", key)
#    if (!seen[key]++)
#        print
#}' "$1"


if [ $# -ne 2 ]; then
    echo "Usage: $0 input.epd output.epd"
    exit 1
fi

awk -F';' '
{
    total++

    key = $1
    sub(/ [0-9]+ [0-9]+$/, "", key)

    if (!seen[key]++) {
        print
        unique++
    } else {
        duplicates++
    }
}
END {
    if (total > 0)
        pct = 100 * duplicates / total
    else
        pct = 0

    printf("Input lines:         %d\n", total) > "/dev/stderr"
    printf("Unique lines:        %d\n", unique) > "/dev/stderr"
    printf("Duplicates removed:  %d (%.2f%%)\n", duplicates, pct) > "/dev/stderr"
}' "$1" > "$2"

