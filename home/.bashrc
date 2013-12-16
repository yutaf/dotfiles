# shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias upppp='cd ../../../..'
alias uppppp='cd ../../../../..'
alias lsl='ls -l'
alias lsa='ls -al'
alias lsd='ls -ld'

# Completion
source ~/.git-completion.sh # for git-completion

# hub
if type hub > /dev/null 2>&1; then
	eval "$(hub alias -s)"
	source /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

# phpenv
if type phpenv > /dev/null 2>&1; then
	export PATH="$HOME/.phpenv/bin:$PATH"
	eval "$(phpenv init -)"
fi

# rbenv
if type rbenv > /dev/null 2>&1; then
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
fi

if [ `uname` = "Darwin" ]; then
	source ~/.bashrc.mac.sh
elif [ `uname` = "Linux" ]; then
	source ~/.bashrc.linux.sh
fi
