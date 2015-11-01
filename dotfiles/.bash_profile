set -o vi

ulimit -n 4096

export PATH=$HOME/bin:$PATH

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
else
  echo "run brew install bash-git-prompt to get prompt working properly"
fi


export GIT_EDITOR="vim"
export EDITOR="vim"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -n "$(which aws_completer)" ]; then
  complete -C aws_completer aws
fi

if [ -f $HOME/.bash_profile.local ]; then
  . $HOME/.bash_profile.local
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if which exenv > /dev/null; then eval "$(exenv init -)"; fi

# run this occasionally to find more stuff to add here...
# history | cut -c8- | sort | uniq -c | sort -rn | head
alias lah='ls -lah'
alias l='ls -la'
alias lart='ls -lart'

# git stuff
alias gco='git checkout'
alias gcv='git commit -v'
alias gd='git diff'
alias gs='git status'

# bundle stuff
alias be='bundle exec'
alias ber='bundle exec rake'

alias tma='tmux attach-session'

# change into dir and do a listing straight away
function c {
  if [ -z $1 ]; then
    # if no arg given, just go up a dir
    cd ..
  else
    cd "$1"
  fi

  # if we changed dir successfully, list contents
  if [ $? == 0 ]; then
    ls -la
  fi
}

function tm {
  PYENV_VERSION=3.3.5 tmuxomatic ~/tmuxomatic/$1
}

# smart fuzzy dir changing
[[ -s `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

GPG_TTY=`tty`
export GPG_TTY

function mkpasswd() {
  if [ -z $1 ]; then
    SIZE=32
  else
    SIZE=$1
  fi
  base64 /dev/urandom | tr -d "/+$2" | dd bs="$SIZE" count=1 2> /dev/null
  if [ -t 1 ] ; then echo ""; fi
}

function gpbi() {
  pushd "$1"
  for i in 1 2 3 4 5; do git pull && break || sleep 15; done
  bundle check || bundle install
  popd
}

# needed for subtitles to work in ffmepg
export FONTCONFIG_PATH=/opt/X11/lib/X11/fontconfig

# needed for mono to work
export MONO_GAC_PREFIX="/usr/local"
