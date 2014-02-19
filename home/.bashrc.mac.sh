# Path
export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=~/bin:$PATH

# completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh # Homebrew
source `brew --prefix`/etc/bash_completion # bash

# color less
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s' # installed by brew

# shortcut
# command
alias ls='gls --color=auto'
alias dircolors='gdircolors'
# application
alias cot='open -a CotEditor'
alias coda='open -a Coda'
alias safari='open -a safari'
alias chrome='open -a Google\ Chrome'
alias firefox='open -a Firefox'
alias iterm='open -a iTerm'
alias mailapp='open -a Mail'
alias phpstorm='open -a PhpStorm'
alias hoster='open -a Hoster'
alias mamp='open -a MAMP'
alias evernote='open -a Evernote'
alias xcode='open -a /Applications/Xcode.app'
alias excel='open -a Microsoft\ Excel.app'
alias powerpoint='open -a Microsoft\ PowerPoint.app'
alias transmit='open -a Transmit'
alias systempreferences='open -a System\ Preferences'
alias aperture='open -a Aperture'
alias echofon='open -a Echofon'
alias itunes='open -a iTunes'
alias totalterminal='open -a TotalTerminal'
alias workbench='open -a MySQLWorkbench.app'
alias appstore='open -a App\ Store.app'
alias virtualbox='open -a VirtualBox'
alias radiko='open -a radiko_player_air'
alias Sourcetree='open -a SourceTree'
alias addressbook='open -a Address\ Book'
alias messages='open -a Messages'
alias preview='open -a Preview'
