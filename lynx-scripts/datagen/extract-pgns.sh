#!/bin/sh

DIR="${1:-.}"
for file in "$DIR"/*.bz2; do
    bzip2 -d "$file"

    # File name
    # echo "${file#./}" >> "filelist.txt"

    # Full path
    echo "$(realpath "$file")" >> "$DIR/filelist.txt"
done

./create-pgn-files-file.sh "$DIR"
