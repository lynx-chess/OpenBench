#!/bin/sh

FILE="${1:-.}"

dir=$(dirname "$FILE")
filename=$(basename "$FILE")
extension="${filename##*.}"

if ! [ $extension != ".tar" ] ; then
   echo "error: Not a tar file" >&2; exit 1
fi

# Remove '.tar'
filename="${filename%.*}"

# Remove '.pgn'
filename="${filename%.*}"

dir="$dir/$filename"
mkdir "$dir"

tar -xvf "$FILE" --directory="$dir"
$(dirname "$0")/extract-pgns.sh "$dir"
$(dirname "$0")/pgn-to-vf.sh "$dir"
$(dirname "$0")/interleave.sh "$dir"

mv "$dir"/interleaved.vf "$dir"/"$filename-interleaved".vftmp

mkdir "$dir"/individual-pgn
mv "$dir"/*.pgn "$dir"/individual-pgn

mkdir "$dir"/individual-vf
mv "$dir"/*.vf "$dir"/individual-vf

mv "$dir"/"$filename-interleaved".vftmp "$dir"/"$filename-interleaved".vf