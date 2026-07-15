


if ($?prompt) then

    #set prompt="%B%n@%m:%~ %#%b "
    set prompt="%{\e[31m%}%n@%m%{\e[34m%}:%~%{\e[0m%} %# "
    #alias precmd 'printf "\033]0;%s\007" "$cwd"'

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
