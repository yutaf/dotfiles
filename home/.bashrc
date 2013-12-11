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
	source ~/hub.bash_completion.sh
fi

# phpenv
if type phpenv > /dev/null 2>&1; then
	export PATH="$HOME/.phpenv/bin:$PATH"
	eval "$(phpenv init -)"
fi

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Terminal Prompt
PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\h:\w)\n* "

if [ `uname` = "Darwin" ]; then
	source ~/.bashrc.mac.sh
elif [ `uname` = "Linux" ]; then
	source ~/.bashrc.linux.sh
fi
