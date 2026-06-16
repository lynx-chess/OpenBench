#!/bin/sh

DIR="${1:-.}"
for file in "$DIR"/*.pgn; do
    # echo "${file#./}" >> "filelist.txt"
    echo "$(realpath "$file")" >> "$DIR/filelist.txt"
done
