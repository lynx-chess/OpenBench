#!/bin/sh

DIR="${1:-.}"

# for file in "$DIR"/*.pgn; do
#     ~/dev/chess-engines/pawnocchio/pawnocchio pgntovf "$file"
# done

ls "$DIR"/*.pgn | parallel ~/dev/chess-engines/pawnocchio/pawnocchio pgntovf
