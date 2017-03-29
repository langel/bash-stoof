#!/bin/bash
# simple grid display of all 256 bash terminal colors

echo #Newline Cinema Space
echo -e "\033[0m Foreground Colors :: \\\033[38;5;{color}m\t\t\t Background Colors :: \\\033[48;5;{color}m"
echo #Newline Cinema Space
color=0
for x_counter in {0..31} ; do
  fg=""
  bg=""
  for y_counter in {0..7} ; do
    fg="${fg}\033[38;5;${color}m ${color}\t\033[0m"
    bg="${bg}\033[48;5;${color}m \033[38;5;239m${color}\t\033[0m"
    ((color++))
  done
  echo -e $fg$bg
done
echo #Newline Cinema Space

exit 0
