source ~/.profile
source ~/.zsh_git.sh
source ~/.zsh_prompt.sh

setxkbmap -option ctrl:swapcaps

# Commands without arguments should resume proc if possible
setopt auto_resume
# Don't overwrite history file
setopt append_history
# Turn off flow control
setopt no_flow_control

# Emacs-style bindings
bindkey -e

export GOPATH=$HOME/code/go
export EDITOR='emacsclient -cna emacs'
export PAGER='less'

alias e=$EDITOR
alias ls='ls --color'
alias ll='ls -l'
alias la='ls -lA'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable
# change.
export PATH="$PATH:$HOME/.rvm/bin"
#
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This


