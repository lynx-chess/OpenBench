#!/bin/sh

DIR="${1:-.}"
~/dev/lynx-utils/pgn-extract/pgn-extract -f "$DIR/filelist.txt" -s -o "$DIR/merged.pgn"
~/dev/lynx-utils/pgn-extract/pgn-extract -f "$DIR/filelist.txt" -o "$DIR/merged.pgn"