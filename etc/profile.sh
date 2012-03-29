###
### Environment
###

THIS_SCRIPT=${BASH_SOURCE[@]}

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
alias ls="ls -F -G"
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

export QUICKNESS_REPO=$(cd $(dirname $(dirname $THIS_SCRIPT)); pwd)
export QK_FORMULAS=$QUICKNESS_REPO/formulas
export QK_TWEAKS=$QUICKNESS_REPO/tweaks
export QUICKNESS_HOME=$HOME/.quickness


###
### Functions
###

quick_apply() {
    typeset tweak_name="$1"

    if [ "$tweak_name" = "" ]
    then
        echo "Pass <tweak> argument to quick_apply"
    else
        echo "Quick Tweaking \`$tweak_name\`\n\n"
        sudo $QK_TWEAKS/$tweak_name.sh
    fi
}

quick_install() {
    typeset formula_name="$1"

    if [ "$formula_name" = "" ]
    then
        echo "Pass <formula> argument to quick_install"
    else
        echo "Quick Installing \`$formula_name\`\n\n"
        sudo $QK_FORMULAS/$formula_name.sh
    fi
}

quick_tweaks() {
    ls $QK_TWEAKS
}

quick_formulas() {
    ls $QK_FORMULAS
}
