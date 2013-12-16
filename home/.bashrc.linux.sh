# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

PATH="$PATH":/usr/local/mysql/bin:/usr/local/php-5.4.10/bin
if [ `hostname` = "coyomie.jp" ]; then
	export PATH=~/bin/git-1.8.5.1/bin:$PATH # for git
fi

# for shortcut
alias lsZ='ls -lZ'
alias lsdZ='ls -ldZ'
alias listusers="cut -d: -f1 /etc/passwd"
if [ `whoami` = "git" ]; then
	alias sshcoyomie.jp='ssh git@219.94.168.193'
fi

# Terminal Prompt
PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\u@\h:\w)\n* "
