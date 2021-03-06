# git-completion
if [ -f ~/.git-completion ]; then
  . ~/.git-completion.sh
fi
# aws-cli completion
if type aws > /dev/null 2>&1; then
  complete -C aws_completer aws
fi
# tugboat
#if type tugboat > /dev/null 2>&1 && test -f ~/bash_completion.d/tugboat; then
#  . ~/bash_completion.d/tugboat
#fi

# direnv
export EDITOR=vim
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# prompt
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
  # Terminal Prompt
  PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\`if [ \$(uname) = "Linux" ]; then echo \u@; fi\`\h:\w\$(__git_ps1))\n$ "
else
  PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\`if [ \$(uname) = "Linux" ]; then echo \u@; fi\`\h:\w)\n$ "
fi

# color man
export MANPAGER='less -R'
man() {
  env \
      LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# hub
if type hub > /dev/null 2>&1; then
  eval "$(hub alias -s)"
  source /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

# phpbrew
if type phpbrew > /dev/null 2>&1; then
  source $HOME/.phpbrew/bashrc
#  test -f $HOME/bash_completion.d/_phpbrew && . $HOME/bash_completion.d/_phpbrew
fi

## phpenv
#if [ -e $HOME/.phpenv ]; then
#  export PATH=$HOME/.phpenv/bin:$HOME/.phpenv/shims:$PATH
#  eval "$(phpenv init -)"
#fi

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  # to use rbenv ruby
  export PATH=$HOME/.rbenv/shims:$PATH
fi

# for user own environment
if [ -f $HOME/.bashrc.user.sh ]; then
  . $HOME/.bashrc.user.sh
fi

if [ `uname` = "Darwin" ]; then
  . ~/.bashrc.mac.sh     # for mac
elif [ `uname` = "Linux" ]; then
  . ~/.bashrc.linux.sh   # for linux
fi

# dircolors-solarized
if [ -r ~/.dircolors-solarized ] && type dircolors > /dev/null 2>&1; then
  eval $(dircolors ~/.dircolors-solarized)
fi

# shortcut
#alias cd='pushd'
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias upppp='cd ../../../..'
alias uppppp='cd ../../../../..'
alias ll='ls -l'
alias lla='ls -al'
alias lld='ls -ld'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
