[[ -s /opt/boxen/env.sh ]] && source /opt/boxen/env.sh
set -o vi

ulimit -n 4096

export PATH=$HOME/bin:$PATH

[[ $- == *i* ]]   &&   . $HOME/.git-prompt/git-prompt.sh


export GIT_EDITOR="vim"
export EDITOR="vim"
export VAGRANT_DEFAULT_PROVIDER=vmware_fusion

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
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

[[ -s `brew --prefix`/etc/profile.d/z.sh ]] && . `brew --prefix`/etc/profile.d/z.sh
