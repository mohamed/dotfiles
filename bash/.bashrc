# Use $ for normal users. # for root
green=$(tput setaf 2)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)
export PS1="\[$green$bold\]\u@\h\[$reset\]:\[$blue$bold\]\w\[$reset\] \$ "

export PATH=${HOME}/bin:${PATH}

source ${HOME}/.alias

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
