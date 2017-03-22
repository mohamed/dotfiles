set prompt="%{\033[31m%}%B(%?)[%P]%n@%m:%{\033[34m%}%~%{\033[0m%}%b> "
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
