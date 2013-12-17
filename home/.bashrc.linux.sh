# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

# for shortcut
alias lsZ='ls -lZ'
alias lsdZ='ls -ldZ'
alias listusers="cut -d: -f1 /etc/passwd"

CentOSInfo=`find /etc -maxdepth 1 -type f -name *release | xargs grep -l "CentOS" | xargs less`
if [ ${#CentOSInfo} != 0 ]; then
	# CentOS
	MAJOR_VERSION=`echo $CentOSInfo | grep -o -e "[0-9]\?\.[0-9]\?" | cut -c 1`
	if [ $MAJOR_VERSION != 6 ]; then
		echo $MAJOR_VERSION
	fi
fi

# Terminal Prompt
PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\u@\h:\w)\n* "
