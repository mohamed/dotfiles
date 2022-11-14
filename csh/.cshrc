set red=`tput setaf 1`
set green=`tput setaf 2`
set blue=`tput setaf 4`
set bold=`tput bold`
set reset=`tput sgr0`
set prompt="%{$red$bold%}%n@%m:%{$blue%}%c3 %#%{$reset%} "
alias precmd 'echo -n "\033]0;$cwd\007"'
bindkey "^r" i-search-back
stty erase '^?'
alias vi 'vim'
alias diff 'diff -u'
alias v 'vim'
alias g 'gvim'
alias ll 'ls -laF --color=auto'
alias grep 'grep -i -n --color'
alias .. 'cd ..'
