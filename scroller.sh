#!/bin/bash

column_count=80
display_type=''
byte_width=0
ms_delay=0
hex_table=(0 1 2 3 4 5 6 7 8 9 a b c d e f)

# handle arguments
while getopts ":bc:hm:ow:" opt; do
	case $opt in
		b) # binary display
			display_type='bin'
			byte_width=8
			;;
		c) # column width
			column_count=$OPTARG
			;;
		h) # hex display
			display_type='hex'
			byte_width=20
			;;
		m) # millisecond line delay
			ms_delay=$((OPTARG / 1000))
			;;
		o) # ordinal display
			;;
		w) # byte width
			byte_width=$OPTAG
		\?)
			echo "invalid option -$OPTARG" >&2
			exit 1
			;;
		:)
			echo "option -${OPTARG} requires argument" >&2
			exit 1
			;;
	esac
done

# main loop
while :
do
	line=''
	for column in $(seq 1 $column_count)
	do
		if [ "$display_type" == "bin" ] 
		then
			line="${line}$(( RANDOM % 2))"
		else
			line="${line}${hex_table[$(( RANDOM % 16 ))]}"
		fi
	done
	echo ${line}
	sleep ${ms_delay}
done
