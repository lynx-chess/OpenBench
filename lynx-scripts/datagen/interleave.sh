#!/bin/sh

DIR="${1:-.}"
echo "$DIR"/*.vf
~/dev/bullet/target/release/bullet-utils viribinpack interleave "$DIR"/*.vf --output "$DIR"/interleaved.vf