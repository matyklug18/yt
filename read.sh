#!/usr/bin/env bash

if [[ -z $1 ]]; then
	exit
fi

ID=$(cat pretty.json | jq -r ".contents.twoColumnBrowseResultsRenderer.tabs[0].tabRenderer.content.richGridRenderer.contents[$1].richItemRenderer.content.videoRenderer.videoId")

if [[ $ID == "null" ]]; then
	exit
fi

if [[ $2 == "thumbnail" ]]; then
	cat pretty.json | jq -r ".contents.twoColumnBrowseResultsRenderer.tabs[0].tabRenderer.content.richGridRenderer.contents[$1].richItemRenderer.content.videoRenderer.thumbnail.thumbnails[0].url"
elif [[ $2 == url ]]; then
	echo $ID
else
	TITLE=$(cat pretty.json | jq ".contents.twoColumnBrowseResultsRenderer.tabs[0].tabRenderer.content.richGridRenderer.contents[$1].richItemRenderer.content.videoRenderer.title.runs[0].text" | sed "s|%|%%|g")
	CHANNEL_NAME=$(cat pretty.json | jq -r ".contents.twoColumnBrowseResultsRenderer.tabs[0].tabRenderer.content.richGridRenderer.contents[$1].richItemRenderer.content.videoRenderer.longBylineText.runs[0].text")
	printf "($1): $TITLE [$CHANNEL_NAME]\n"
	echo "https://www.youtube.com/watch?v=$ID"
fi

echo ""
