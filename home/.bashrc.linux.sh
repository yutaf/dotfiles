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
if [ "${#CentOSInfo}" -ne 0 ]; then
	# Check CentOS major version
	RESULT=`echo $CentOSInfo | grep -e "\ 6\.\?[0-9]\?"`
	if [ "${#RESULT}" -eq 0 ]; then
		# When the major version is lower than 6
		`git config --global http.sslVerify false`
	fi
fi

# Terminal Prompt
PS1="\n\`if [ \$? = 0 ]; then echo \[\e[32m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` (\u@\h:\w)\n* "
