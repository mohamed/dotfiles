

if ($?prompt) then

    if ($?TERM) then
        set red=`tput setaf 1`
        set green=`tput setaf 2`
        set blue=`tput setaf 4`
        set bold=`tput bold`
        set reset=`tput sgr0`
    else
        set red=""
        set green=""
        set blue=""
        set bold=""
        set reset=""
    endif

    set prompt="${red}${bold}%n@%m:${blue}%~ %#${reset} "

    alias precmd 'printf "\033]0;%s\007" "$cwd"'

    bindkey "^r" i-search-back
    stty erase '^?'

    alias vi 'vim'
    alias v 'vim'
    alias g 'gvim'

    alias diff 'diff -u'
    alias ll 'ls -laF --color=auto'
    alias grep 'grep --color=auto'
    alias gi 'grep -in'
    alias .. 'cd ..'

endif
