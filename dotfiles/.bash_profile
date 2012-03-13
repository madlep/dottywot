set -o vi

export PATH=$HOME/bin:$PATH

[[ $- == *i* ]]   &&   . $HOME/.git-prompt/git-prompt.sh

export GIT_EDITOR="mvim -f"
export SVN_EDITOR="mvim -f"
export EDITOR="mvim -f"
export NODE_PATH=/usr/local/lib/node_modules

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

if [ -f $HOME/.bash_profile.local ]; then
  . $HOME/.bash_profile.local
fi

eval "$(rbenv init -)"

ssh-add
