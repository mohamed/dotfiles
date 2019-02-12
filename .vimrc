
set nocompatible
set backspace=indent,eol,start
syntax on

filetype plugin indent on
set ic hls is

"set cindent
"set smartindent
set smarttab
set paste
set noautoindent
set tabstop=8
set shiftwidth=8
set textwidth=0 " 0 no line breaking
set noexpandtab
set ruler
set number
set showcmd             " show typed command in status bar
set showmode            " show mode in status bar (insert/replace/...)
set title               " show file in titlebar
set wildmenu            " completion with menu
set hidden              " remember undo after quitting
set history=50          " keep 50 lines of command history
set spell spelllang=en_us

" Spaces & Tabs
syntax match Tab /\t/
highlight ExtraWhitespace ctermbg=red  guibg=red
highlight Tab ctermbg=blue guibg=blue
match ErrorMsg '\s\+$'
"highlight SpecialKey ctermfg=1

"""""""""""""""""""""""""""""""""""""""""""

" Omni completion
"set omnifunc=syntaxcomplete#Complete

" display settings
set ch=1                " make command line one line high
set laststatus=2        " use 2 lines for the status bar
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

" system settings
"set magic               " change the way backslashes are used in search patterns
"set viminfo='20,\"500   " remember copy registers after quitting in the .viminfo file -- 20 jump links, regs up to 500 lines'

set wildmenu wildmode=full

" Linux kernel coding style
function SetCodingStyle()
    if g:codingstyle == 1
        set expandtab
        set tabstop=4
        set shiftwidth=4
        set textwidth=80
        set wrap linebreak nolist
        set cino+=(0
        set cino+=t0
        let g:codingstyle = 2
        let g:codingstylename = 'Google style'
    else
        set noexpandtab
        set tabstop=8
        set shiftwidth=8
        set textwidth=80
        set wrap linebreak nolist
        set cino+=(0
        set cino+=t0
        let g:codingstyle = 1
        let g:codingstylename = 'Linux style'
    endif
endfunction
let g:codingstyle = 1
call SetCodingStyle()
map <F7> :call SetCodingStyle()<CR>
syn on

" Colorscheme
set guifont=Inconsolata\ 20
colo koehler

" Remove all Trailing withespaces
map <F12> :%s/\s\+$//g<CR>

" Buffer navigation
map <F8> :bp<CR>
map <F9> :bn<CR>
map <F10> :MBEbd<CR>
inoremap <F8> <Esc>:bp<CR>
inoremap <F9> <Esc>:bn<CR>
inoremap <F10> <Esc>:MBEbd<CR>

" working directory
map <F6> :lcd %:p:h<CR>
inoremap <F6> <Esc>:lcd %:p:h<CR>

" Tag list
map <F5> :TlistOpen<CR>
inoremap <F5> <Esc>:TlistOpen<CR>

" make
map <F11> :!make clean all<CR>
inoremap <F11> <Esc>:!make clean all<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/mswin.vim
source $HOME/.vim/plugin/minibufexpl.vim
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

set backupdir=$HOME/tmp
set dir=$HOME/tmp

set list
set listchars=tab:__
