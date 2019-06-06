#!/bin/bash

NEEDLE=$1
REPLACEMENT=$2

echo "Recursive String Replacement"
if [ $# -eq 0 ]
then
	echo "usage :: .//findreplace.sh needle replacement"
else
	STRING="s/${NEEDLE}/${REPLACEMENT}/"
	echo $STRING
	find . -type f -exec sed -i '' -e $STRING {} \;
fi
