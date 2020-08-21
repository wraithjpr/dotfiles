# .bashrc
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# NB. Always append to path in .bash_profile to avoid duplication.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#[[ -r ~/.Xresources ]] && xrdb -merge ~/.Xresources
#[[ -r /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

alias ls='ls --color=auto'
alias la='ls -A'
alias lal='ls -Al'
#alias ..='cd ../'
shopt -s autocd
alias grep='grep --color=auto'
alias vimcode='nvim $(fd --hidden --color auto --type f | fzf)'
alias vimjava='nvim $(fd --color auto --type f --extension java | fzf)'
alias gs='git status'
alias gb='git branch'
alias gba='git branch --all'
alias gl='git log'

# Power management aliases
alias sleep='systemctl suspend'
alias suspend='systemctl suspend-then-hibernate'
alias hibernate='systemctl hibernate'
alias shutdown='systemctl poweroff'
alias poweroff='systemctl poweroff'
alias restart='systemctl reboot'
alias reboot='systemctl reboot'

# Useful Xprop values for applications
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'

# Set the displays config for my home desk set up
alias benq='xrandr --output HDMI2 --primary --auto --output eDP1 --right-of HDMI2 --auto'

shopt -s expand_aliases
shopt -s histappend
shopt -s checkwinsize

# Environment for Nodejs version manager
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bash completion for AWS CLI
#complete -C '/usr/local/bin/aws_completer' aws

# bash completion for Pandoc
#eval "$(pandoc --bash-completion)"

# bash completion for Stack (Haskell)
#eval "$(stack --bash-completion-script stack)"

