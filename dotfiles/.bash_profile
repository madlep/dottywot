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

# history | cut -c8- | sort | uniq -c | sort -rn | head
alias lah='ls -lah'
alias la='ls -la'
alias lart='ls -lart'
alias gs='git status'
