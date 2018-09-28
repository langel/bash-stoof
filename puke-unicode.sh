#!/bin/bash

# an atempt to display unicode character tables

for hibyte in {0..255} ; do
	hibytehex=$(printf "%02x" $hibyte)
	for lobyte in {0..255} ; do
		#echo -n "\xe2\x"
		#printf "%x" $hibyte
		#echo -n "\x"
		#printF "%x " $lobyte
		#printf "\xe2\%x\%x " $hibyte $lobyte
		lobytehex=$(printf "%02x" $lobyte)
		echo -ne "\xe2\x98\xA0   "
		echo -n "${hibytehex}${lobytehex} "
		echo "\xe2\x${hibytehex}\x${lobytehex} "
	done
done
