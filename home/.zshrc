# Character encoding
export LANG=en_US.UTF-8
#export LANG=ja_JP.UTF-8

# Path
export PATH=~/bin:~/local/bin:/usr/local/bin:/usr/local/sbin:$PATH

# completion
#if [ -e /usr/local/share/zsh-completions ]; then
#  fpath=(/usr/local/share/zsh-completions $fpath)
#fi
autoload -Uz compinit
compinit

# antigen
test -d $HOME/.antigen || git clone https://github.com/zsh-users/antigen.git $HOME/.antigen
if test -f $HOME/.antigen/antigen.zsh; then
  source "$HOME/.antigen/antigen.zsh"

  # oh-my-zsh
  antigen use oh-my-zsh
  antigen bundle arialdomartini/oh-my-git
  antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
  # zsh-completions
  antigen bundle zsh-users/zsh-completions

  antigen apply
fi

# prompt
#DEFAULT=%F{green}^_^%f
#ERROR=%F{red}O_O%f
DEFAULT='\U2601 '
ERROR='\U26A1 '
omg_ungit_prompt="%(?.${DEFAULT}.${ERROR}) %B%n:%~%b
$ "
omg_second_line="%(?.${DEFAULT}.${ERROR}) %B%n:%~%b
$ "
PROMPT="
$PROMPT"
RPROMPT=

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

# phpbrew
if type phpbrew > /dev/null 2>&1; then
  source $HOME/.phpbrew/bashrc
#  test -f $HOME/bash_completion.d/_phpbrew && . $HOME/bash_completion.d/_phpbrew
fi

# rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  # to use rbenv ruby
  export PATH=$HOME/.rbenv/shims:$PATH
fi

# direnv
export EDITOR=vim
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# color less
if type source-highlight > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s' # installed by brew
fi

# dircolors-solarized
if type gls > /dev/null 2>&1; then
  alias ls='gls --color=auto'
fi
if [ -r ~/.dircolors-solarized ] && type gdircolors > /dev/null 2>&1; then
  eval $(gdircolors ~/.dircolors-solarized)
fi

# for local own environment
if [ -f $HOME/.zshrc.local ]; then
  . $HOME/.zshrc.local
fi

# homeshick
if [ -f $HOME/.homesick/repos/homeshick/homeshick.sh ]; then
  . $HOME/.homesick/repos/homeshick/homeshick.sh
fi


# alias
alias cot='open -a CotEditor'
alias preview='open -a Preview'
alias keynote='open -a Keynote'
alias excel='open -a Microsoft\ Excel.app'
alias powerpoint='open -a Microsoft\ PowerPoint.app'
alias mysqlworkbench='open -a MySQLWorkbench'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
