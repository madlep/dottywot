set -o vi

export PATH=$HOME/bin:$PATH

[[ $- == *i* ]]   &&   . $HOME/.git-prompt/git-prompt.sh

export GIT_EDITOR="vim"
export SVN_EDITOR="vim"
export EDITOR="vim"
export NODE_PATH=/usr/local/lib/node_modules
export HISTFILESIZE=10000 # Record last 10,000 commands
export HISTSIZE=10000 # Record last 10,000 commands per session

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -f $HOME/.bash_profile.local ]; then
  . $HOME/.bash_profile.local
fi

eval "$(rbenv init -)"

# run this occasionally to find more stuff to add here...
# history | cut -c8- | sort | uniq -c | sort -rn | head
alias lah='ls -lah'
alias l='ls -la'
alias lart='ls -lart'

# git stuff
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gcv='git commit -v'
alias gd='git diff'
alias gs='git status'
alias gsl='git smart-log'
alias gsp='git smart-pull'

# change into dir and do a listing straight away
function c {
  if [ -z $1 ]; then
    cd ..
  else
    cd $1
    if [ $? == 0 ]; then
      ls -la
    fi
  fi
}
