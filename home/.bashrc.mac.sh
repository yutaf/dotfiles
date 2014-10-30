# Path
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH # for Homebrew

# completion
completions=(
  $(brew --prefix)/Library/Contributions/brew_bash_completion.sh
  $(brew --prefix)/etc/bash_completion
  $(brew --prefix)/etc/bash_completion.d/vagrant
)
for completion in ${completions[@]}; do
  . $completion
done

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
