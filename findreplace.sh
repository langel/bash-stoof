#!/bin/bash

NEEDLE=$1
REPLACEMENT=$2

echo "Recursive String Replacement"
if [ $# -eq 0 ]
then
	echo "usage :: .//findreplace.sh needle replacement"
else
	STRING="s/${NEEDLE}/${REPLACEMENT}/g"
	echo $STRING
	find . \( ! -regex '.*/\..*' \) -type f -exec sed -i $STRING {} +
fi
