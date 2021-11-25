#set default editor to vim
export VISUAL=vim
export EDITOR=$VISUAL

# enable color for osx
export CLICOLOR=1
export LSCOLORS=CxGxDxBxFxegedabagaced

# set arrays start on index 0
setopt ksh_arrays

# gradient defined
COLOR[0]="124"
COLOR[1]="208"
COLOR[2]="226"
COLOR[3]="34"
COLOR[4]="27"
COLOR[5]="56"
# black
COLOR[6]="0"

bg_color() {
#  not sure if BG is available in zsh %F format
	echo "\\033[48;5;${COLOR[$1]}m"
}
fg_color() {
	echo "%F{${COLOR[$1]}}"
#  old ANSI way:
#  echo "\\033[38;5;${COLOR[$1]}m"
}

# prompt expansions explained :
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html

bash_stoof() {
	# primary prompt display
	triangle=$'\xe2\x96\xb6'
	illuminull=$'\[\xf0\x9f\x92\xa1\]\[\xe2\x88\x85\]'
	emoji=$'\xF0\x9F\x8D\xBB\xf0\x9f\x92\xa9'
	emoji_real='🍻💩'
	main_prompt="$(fg_color 0)%D{%H:%M:%S} %B$(fg_color 1)%n$(fg_color 2)@$(fg_color 3)%m $(fg_color 4)%~%b"
  
	PROMPT="${gitbar}${main_prompt} $(fg_color 5)${triangle} ${emoji} %f"
  # setup next line colors of rainbow
	COLOR_COUNT=5
	COLOR_MEM=${COLOR[0]}
	COLOR_DICK=$(($COLOR_COUNT - 1))
	for i in `seq 0 $COLOR_DICK` 
	do
		INDEX_DICK=$(($i + 1))
		COLOR[$i]=${COLOR[$INDEX_DICK]}
	done    
	COLOR[${COLOR_COUNT}]=$COLOR_MEM
}

export PROMPT_COMMAND="bash_stoof;"
precmd() { eval "$PROMPT_COMMAND" }
