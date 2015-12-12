#!/bin/bash

text=$1
while [ 1 ]
do
COLUMNS=$(tput cols)
cowsay "$text" | toilet --gay --width "$COLUMNS"
len=${#text}
new_text=${text:1:$len}${text:0:1}
text=$new_text
sleep 1
done
