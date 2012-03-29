###
### Environment
###

THIS_SCRIPT=${BASH_SOURCE[@]}


###
### Settings
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

