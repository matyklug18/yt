#!/usr/bin/env bash
rm -f yt.html line.json final.json pretty.json
../curlyt.sh #replace with a command to curl the page
sed -n '1005,1005p' yt.html >> line.json
cat line.json | cut -c30- >> final.json
cat final.json | jq >> pretty.json
