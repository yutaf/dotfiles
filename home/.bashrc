# git-completion
source ~/.git-completion.sh
# git-prompt
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
# Terminal Prompt
PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\`if [ \$(uname) = "Linux" ]; then echo \u@; fi\`\h:\w\$(__git_ps1))\n* "

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

# dircolors-solarized
eval $(gdircolors ~/.dircolors-solarized)

# hub
if type hub > /dev/null 2>&1; then
	eval "$(hub alias -s)"
	source /usr/local/etc/bash_completion.d/hub.bash_completion.sh
fi

# phpenv
if [ -e $HOME/.phpenv ]; then
	export PATH="$HOME/.phpenv/bin:$PATH"
	eval "$(phpenv init -)"
	# phpenv php takes priority (for iterm)
	export PATH="$HOME/.phpenv/shims:$PATH"
fi

# rbenv
if [ -e $HOME/.rbenv ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

# for user own environment
if [ -f $HOME/.bashrc.user.sh ]; then
. $HOME/.bashrc.user.sh
fi

if [ `uname` = "Darwin" ]; then
	source ~/.bashrc.mac.sh     # for mac
elif [ `uname` = "Linux" ]; then
	source ~/.bashrc.linux.sh   # for linux
fi

# shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias upppp='cd ../../../..'
alias uppppp='cd ../../../../..'
alias lsl='ls -l'
alias lsa='ls -al'
alias lsd='ls -ld'
