source ~/.profile
source ~/code/dotfiles/.zsh_git.sh
source ~/code/dotfiles/.zsh_prompt.sh

# Commands without arguments should resume proc if possible
setopt auto_resume
# Don't overwrite history file
setopt append_history
# Turn off flow control
setopt no_flow_control

# Emacs-style bindings
bindkey -e

export GOPATH=$HOME/code/go
export EDITOR='emacs'
export PAGER='less'

alias ll='ls -l'
alias la='ls -lA'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

