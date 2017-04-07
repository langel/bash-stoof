#!/bin/bash
# simple grid display of all 256 bash terminal colors

echo #Newline Cinema Space
printf " Foreground Colors :: \\\033[38;5;{color}m"
printf "                    Background Colors :: \\\033[48;5;{color}m\n"
echo #Newline Cinema Space

fgcolor=0;
bgcolor=0;
for x_counter in {0..31} ; do
  for y_counter in {0..7} ; do
    printf "\033[38;5;%dm%5d  \033[0m" $fgcolor $fgcolor
    ((fgcolor++))
  done
  printf "   "
  for y_counter in {0..7} ; do
    printf "\033[48;5;%dm\033[38;5;0m%5d  \033[0m" $bgcolor $bgcolor
    ((bgcolor++))
  done
  echo  
done

echo #Newline Cinema Space
