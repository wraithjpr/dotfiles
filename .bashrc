# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# NB. Always append to path in .bash_profile to avoid duplication.
export LANG=en_GB.UTF-8
export CLICOLOR=1
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export EDITOR="nvim"
export MANPAGER='nvim +Man!'

export JAVA_HOME=$(readlink -f /etc/alternatives/jre)
export JDK_HOME=$(readlink -f /etc/alternatives/java_sdk)

[[ $- != *i* ]] && return

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

export PS1="\w \$ "

alias la='ls -A'
alias lal='ls -Al'
#alias ..='cd ../'
shopt -s autocd
alias grep='grep --color=auto'
alias vim='nvim'
alias vimcode='nvim $(fd --hidden --color auto --type f | fzf)'
alias vimjava='nvim $(fd --color auto --type f --extension java | fzf)'
alias gs='git status'
alias gb='git branch'
alias gba='git branch --all'
alias gl='git log'
# Set the displays config for my home desk set up
alias benq='xrandr --output HDMI-2 --primary --auto --output eDP-1 --right-of HDMI-2 --auto'

shopt -s expand_aliases
shopt -s histappend
shopt -s checkwinsize

# Environment for Nodejs version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF environment
export FZF_DEFAULT_OPTS="--height=33% --layout=reverse --border --preview-window=:hidden"
export FZF_DEFAULT_COMMAND='fd --hidden --color auto --type f --exclude .git'

# bash completion for AWS CLI
complete -C '/usr/local/bin/aws_completer' aws

# bash completion for Pandoc
eval "$(pandoc --bash-completion)"

