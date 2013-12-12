# Path
export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PATH=~/bin:$PATH
export PATH=/usr/local/opt/openssl/bin:$PATH # for brew openssl
#todo remove php53-mcrypt(:依存関係のphp53)をダウンロードしないようにする phpmyadminに必要？
export PATH="$HOME/.phpenv/shims:$PATH"

if [ `hostname` = "yutafuji2008MacBookPro.local" ]; then
	# 会社mac
	export PATH=/usr/local/apache-httpd-2.2.24/bin:$PATH  # for apache
fi

# for Homebrew completion
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh 

# shortcut for ssh
alias sshroot='ssh root@192.168.0.140'
alias sshfujishiro='ssh fujishiro@192.168.0.140'
alias sshgit='ssh git@192.168.0.140'
alias sshdev='ssh yuta@192.168.0.210'

# shortcut
alias cot='open -a CotEditor'
alias coda='open -a Coda'
alias safari='open -a safari'
alias chrome='open -a Google\ Chrome'
alias firefox='open -a Firefox'
alias iterm='open -a iTerm'
alias mailapp='open -a Mail'
alias phpstorm='open -a PhpStorm'
alias phpstorm6='open -a /Applications/PhpStorm6.app'
alias phpstorm5='open -a /Applications/PhpStorm5.app'
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
