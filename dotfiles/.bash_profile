[[ $- == *i* ]]   &&   . $HOME/.git-prompt/git-prompt.sh

export GIT_EDITOR="mvim -f"
export SVN_EDITOR="mvim -f"
export EDITOR="mvim -f"

if [ -f /usr/local/etc/bash_completion ]; then
  . /usr/local/etc/bash_completion
fi

