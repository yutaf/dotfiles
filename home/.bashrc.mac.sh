# Path
export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=~/bin:$PATH

# completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh # Homebrew
source `brew --prefix`/etc/bash_completion # bash
if [ -f `brew --prefix`/etc/bash_completion.d/vagrant ]; then
  . `brew --prefix`/etc/bash_completion.d/vagrant
fi

# direnv
if type direnv > /dev/null 2>&1; then
  eval "$(direnv hook bash)"
fi

# color less
if type source-highlight > /dev/null 2>&1; then
  export LESS='-R'
  export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s' # installed by brew
fi

#--
# shortcut
#--

# command
alias ls='gls --color=auto'
alias dircolors='gdircolors'

# application
alias cot='open -a CotEditor'
alias preview='open -a Preview'
alias keynote='open -a Keynote'
alias mou='open -a Mou'
alias excel='open -a Microsoft\ Excel.app'
alias powerpoint='open -a Microsoft\ PowerPoint.app'
alias mailapp='open -a Mail'
