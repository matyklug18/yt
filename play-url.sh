#!/usr/bin/env bash
mkdir -p vids
cd vids
youtube-dl -o $1 $1
FILENAME=youtube-dl --get-filename -o $1 $1
vlc "$FILENAME"
cd ..
