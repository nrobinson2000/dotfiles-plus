#!/bin/sh
# Generate word cloud wallpaper from installed packages

# Install dependencies:
# yay -S pacgraph imagemagick xorg-xdpyinfo feh

GRAPH="pacgraph.png"
pacgraph -b "#13191c" -t "#008899"

# Change this to a scale you like
SCALE="130%"

DIMS=$(xdpyinfo | grep dimensions | sed -r "s/^[^0-9]*([0-9]+x[0-9]+).*$/\1/")
OUT="$(dirname $GRAPH)/wallpaper.png"

echo "Converting..."
convert "$GRAPH" -gravity center -background '#13191c' \
    -resize "$SCALE" -extent "$DIMS" "$OUT"

# Preview
feh --no-fehbg --bg-scale "$OUT"
