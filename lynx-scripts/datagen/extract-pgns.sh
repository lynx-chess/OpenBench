#!/bin/sh

DIR="${1:-.}"
for file in "$DIR"/*.bz2; do
    bzip2 -d "$file"
done

 $(dirname "$0")/create-pgn-files-file.sh "$DIR"
