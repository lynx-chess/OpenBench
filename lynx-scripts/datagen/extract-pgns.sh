#!/bin/sh

DIR="${1:-.}"

# for file in "$DIR"/*.bz2; do
#     bzip2 -d "$file"
# done

ls "$DIR"/*.bz2 | parallel bzip2 -d

$(dirname "$0")/create-pgn-files-file.sh "$DIR"
