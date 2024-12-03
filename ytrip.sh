#!/bin/bash

URL=$1

echo "youtube audio ripper"
if [ $# -eq 0 ]
then
	echo "usage :: ./ytdl.sh video_url"
else
	yt-dlp ${URL} -k --path out -o '%(title)s.%(ext)s' --split-chapters -o "chapter:%(title)s - %(section_title)s.%(ext)s" -x --audio-format mp3 -f 'ba'
	cd out
	SRC_FILE=$(find . -name "*webm")
	echo $SRC_FILE
	NAME=$(basename "$SRC_FILE" .webm)
	echo $NAME
	rm "$SRC_FILE"
	rm "$NAME.mp3"
	cd ..
	mv out "${NAME}"
	echo done;
fi
