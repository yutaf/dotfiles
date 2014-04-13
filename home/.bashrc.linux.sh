# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

# for shortcut
alias ls='ls --color=auto'
alias lsZ='ls -lZ'
alias lsdZ='ls -ldZ'
alias listusers="cut -d: -f1 /etc/passwd"

# some other PATHs for commands installed system globally
# are written in /etc/profile.d/custom.sh

# Set http.sslVerify false as common default
# instead of getting this below comment out
: <<'#COMMENT'
CentOSInfo=`find /etc -maxdepth 1 -type f -name *release | xargs grep -l "CentOS" | xargs less`
if [ "${#CentOSInfo}" -ne 0 ]; then
    # Check CentOS major version
    RESULT=`echo $CentOSInfo | grep -e "\ 6\.\?[0-9]\?"`
    if [ "${#RESULT}" -eq 0 ]; then
        # When the major version is lower than 6
        `git config --global http.sslVerify false`
    fi
fi
#COMMENT
