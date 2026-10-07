#!/usr/bin/env bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 input.epd output.epd"
    exit 1
fi

input=$1
output=$2

srcdir=$(dirname "$(realpath "$input")")
tmpdir=$(mktemp -d "$srcdir/.epd-sort.XXXXXX")
trap 'rm -rf "$tmpdir"' EXIT

echo "Generating keys..." >&2

awk -F';' '{
    key = $1
    sub(/ [0-9]+ [0-9]+$/, "", key)
    print key "\t" $0
}' "$input" > "$tmpdir/data"

echo "Sorting and deduplicating..." >&2

LC_ALL=C sort \
    -T "$tmpdir" \
    -S 16G \
    -t $'\t' \
    -k1,1 \
    -u \
    "$tmpdir/data" |
cut -f2- > "$output"

echo "Done." >&2
echo "Input lines: $(wc -l < "$input")" >&2
echo "Unique lines: $(wc -l < "$output")" >&2