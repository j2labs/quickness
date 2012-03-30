###
### Environment
###

### Colorful prompt with special colors for root
if [ $USER = "root" ]; then
	PS_COLOR="31m"
else
	PS_COLOR="32m"
        if [ ! -d "$HOME/.tmp" ]; then
            mkdir $HOME/.tmp
        fi
	export TMPDIR="$HOME/.tmp"
fi
export PS1="\n[01;$PS_COLOR\u@\h[0m : \t : [01;34m\w[0m\n\$ "

### default arguments to commands
alias ls="ls -F --color"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

### helpers
alias l="ls"
alias sl="ls"
alias lss="ls --hide=*~"
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"
alias lsd="ls -l | grep ^d"
alias psg="ps ax | grep"
alias clpy="rm -f *~ *pyc"
alias pwdd="pwd -P"
alias sudoo="sudo /bin/bash -l"


###
### Quickness Settings
###

THIS_SCRIPT=${BASH_SOURCE[0]}

export QUICKNESS_REPO=$(cd $(dirname $(dirname $THIS_SCRIPT)); pwd)
export QUICKNESS_FORMULAS=$QUICKNESS_REPO/formulas
export QUICKNESS_TWEAKS=$QUICKNESS_REPO/tweaks
export QUICKNESS_BIN=$QUICKNESS_REPO/bin

export QUICKNESS_HOME=$HOME/.quickness
export QUICKNESS_SRC=$HOME/.quickness/src

if [ ! -d $QUICKNESS_HOME ]; then
    mkdir $QUICKNESS_HOME
fi
if [ ! -d $QUICKNESS_SRC ]; then
    mkdir $QUICKNESS_SRC
fi

export PATH=$QUICKNESS_BIN:$PATH
