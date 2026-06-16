#!/bin/sh

DIR="${1:-.}"
# /home/edu/dev/lynx-utils/pgn-extract/pgn-extract -f "$DIR/filelist.txt" -s -o "$DIR/merged.pgn"
/home/edu/dev/lynx-utils/pgn-extract/pgn-extract -f "$DIR/filelist.txt" -o "$DIR/merged.pgn"