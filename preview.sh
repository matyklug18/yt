#!/usr/bin/env bash

./read.sh $1
kitty +kitten icat --align left $(./read.sh $1 thumbnail)
# read
# kitty +kitten icat --clear
