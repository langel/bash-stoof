# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

export TERM=xterm-256color

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

COLOR[0]="\[\\033[38;5;124m\]"
COLOR[1]="\[\\033[38;5;208m\]"
COLOR[2]="\[\\033[38;5;226m\]"
COLOR[3]="\[\\033[38;5;34m\]"
COLOR[4]="\[\\033[38;5;27m\]"
COLOR[5]="\[\\033[38;5;56m\]"
COLOR[6]="\[\\033[38;5;7m\]"
export PROMPT_COMMAND="bash_stoof;"

bash_stoof() {
  # build PS1 rainbow
	PS1="\[$(tput bold)\]${COLOR[0]}\t ${COLOR[1]}\u${COLOR[2]}@${COLOR[3]}\h ${COLOR[4]}\w ${COLOR[5]}"$'\[\xf0\x9f\x92\]\xa1\[\xe2\x88\]\x85 '"\[$(tput sgr0)\]${COLOR[6]}\[\033[0m\] "
  # rotate rainbow colors for next line
	COLOR_COUNT=5
	COLOR_MEM=${COLOR[0]}
	COLOR_DICK=$(($COLOR_COUNT - 1))
	for i in `seq 0 $COLOR_DICK` 
	do
		INDEX_DICK=$(($i + 1))
		COLOR[$i]=${COLOR[$INDEX_DICK]}
	done    
	COLOR[${COLOR_COUNT}]=$COLOR_MEM
  # append git info to PS1
}

if [ "$color_prompt" = yes ]; then
	bash_stoof
# alternate prompt chars
# PS1="\[$(tput bold)\]\[\\033[38;5;124m\]\t \[\\033[38;5;208m\]\u\[\\033[38;5;226m\]@\[\\033[38;5;34m\]\h \[\\033[38;5;27m\]\w \[\\033[38;5;56m\]"$'\[\xe2\x88\xb4\[\xe2\x86\x92\]\x0a '"\[$(tput sgr0)\]\[\\033[38;5;7m\]\[\033[0m\] "

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ack='ack-grep'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi



#set C^-l to clear screen
bind "\C-l":"clear-screen"
#uncomment if you use ctrl+a for screen and want ctrl+b for beginning of the line
#bind "\C-b":"beginning-of-line" 
#uncomment for vi command mode default
#set -o vi

#set default editor to vim
export VISUAL=vim
export EDITOR=$VISUAL
