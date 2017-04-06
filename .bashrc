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
  echo "\[\\033[48;5;${COLOR[$1]}m\]"
}
fg_color() {
  echo "\[\\033[38;5;${COLOR[$1]}m\]"
}

export PROMPT_COMMAND="bash_stoof;"

bash_stoof() {
  # primary prompt display
  style_reset="\033[0m"
  triangle=$'\xe2\x96\xb6'
  illuminull=$'\[\xf0\x9f\x92\xa1\]\[\xe2\x88\x85\]'
  main_prompt="\[$(tput bold)\]$(fg_color 0)\t $(fg_color 1)\u$(fg_color 2)@$(fg_color 3)\h $(fg_color 4)\w\[$(tput sgr0)\]"

  # add git bar
  gitbar=''
  gitstatus=$( git status --porcelain --branch 2>&1 )
  if [ $? -eq 0 ]
  then
    git_changed=0;
    git_conflicts=0;
    git_downstream=0;
    git_staged=0;
    git_stashed=0;
    git_untracked=0;
    git_upstream=0;
    git_stats_string='';
    while read -r line; do
      status=${line:0:2}
      while [[ -n $status ]]; do
        case "$status" in

  # these all need to be checked against appropriate scenarios

          # double char match full loop
          \#\#) branch_line="${line/\.\.\./^}"; break ;;
          \?\?) ((git_untracked++)); break ;;
          U?) ((git_conflicts++)); break;;
          ?U) ((git_conflicts++)); break;;
          DD) ((git_conflicts++)); break;;
          AA) ((git_conflicts++)); break;;
          # double char match 1st loop
          M?) ((git_changed++)) ;;
          D?) ((git_changed++)) ;;
          ?\ ) ;;
          # double char match 2nd loop
          U) ((git_conflicts++)) ;;
          \ ) ;;
          *) ((git_staged++)) ;;
        esac
        status=${status:0:(${#status}-1)}
      done
    done <<< "$gitstatus"

    # pull the branch name
    IFS="^" read -ra branch_fields <<< "${branch_line/\#\# }"
    branch="${branch_fields[0]}"

    # look for upstream and downstream counts
    IFS=" " read -ra branch_bonus <<< "${branch_fields[1]}"
    for ((i=1; i<${#branch_bonus[*]}; i++))
    do
      case "$( echo "${branch_bonus[i]}" )" in
        *ahead*) 
          git_downstream=$( echo "${branch_bonus[i+1]}" | tr -dc '0-9' );;
        *behind*) 
          git_upstream=$( echo "${branch_bonus[i+1]}" | tr -dc '0-9' );;
      esac
    done

    # look for stash count
    stash_file="$( git rev-parse --git-dir )/logs/refs/stash"
    if [[ -e "${stash_file}" ]]; then
      while IFS='' read -r wcline || [[ -n "$wcline" ]]; do
        ((git_stashed++))
      done < ${stash_file}
    fi

    # setup stats display
    branch_status=''
    if [[ $git_downstream -ne 0 ]] ; then
      branch_status="${branch_status}"$'\xe2\x86\x91'"${git_downstream}"
    fi
    if [[ $git_upstream -ne 0 ]] ; then
      branch_status="${branch_status}"$'\xe2\x86\x93'"${git_upstream}"
    fi
    if [[ $git_untracked -ne 0 ]] ; then
      branch_status="${branch_status}"$'\xe2\x80\xa6'"${git_untracked}"
    fi
    if [[ $git_changed -ne 0 ]] ; then
      branch_status="${branch_status}"$'\xe2\x9c\x9a'"${git_changed}"
    fi
    if [[ $git_stashed -ne 0 ]] ; then
      branch_status="${branch_status}"$'\xe2\x9a\x91'"${git_stashed}"
    fi
    # debug line
    #echo "${git_changed} ${git_untracked}"
    # put all the git crap together
    gitbar="$(bg_color 5)$(fg_color 6)${triangle} ${branch} ${branch_status}${style_reset} "
  fi

  PS1="${gitbar}${main_prompt} $(fg_color 5)${illuminull} ${triangle}${style_reset} "
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
