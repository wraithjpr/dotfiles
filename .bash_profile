# .bash_profile

# Prepend an item to the system path
prependpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1${PATH:+:$PATH}"
    esac
}

prependpath $HOME/bin
prependpath $HOME/.local/bin
unset -f prependpath

export PATH

# User specific environment and startup programs
export LANG=en_GB.UTF-8
export CLICOLOR=1
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export EDITOR=nvim VISUAL=nvim
export BROWSER=firefox
export XDG_CONFIG_HOME=$HOME/.config

#export PS1='[\u@\h \W]\$ '
export PS1='\w \$ '

# FZF environment
export FZF_DEFAULT_OPTS="--height=33% --layout=reverse --border --preview-window=:hidden"
export FZF_DEFAULT_COMMAND='fd --hidden --color auto --type f --exclude .git'

# Java environment
# See https://wiki.archlinux.org/index.php/Java#Switching_between_JVM
export JAVA_HOME=$(readlink -f /usr/lib/jvm/default-runtime)
export JDK_HOME=$(readlink -f /usr/lib/jvm/default)

# Environment for Nodejs version manager
#export NVM_DIR="$HOME/.nvm"

# Get the aliases and functions
[[ -r ~/.bashrc ]] && source ~/.bashrc

# Autostart X at login.
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
    exec startx
fi

