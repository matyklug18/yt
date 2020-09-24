#!/usr/bin/env bash
URL=$(./read.sh $1 url) 
./play-url.sh $URL
