" Author: Mohamed A. Bamakhrama
" Licensed under BSD 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic nvim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
"set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set title
set clipboard=unnamedplus

" Spaces and tabs
syntax match Tab /\t/
highlight ExtraWhitespace ctermbg=red  guibg=red
highlight Tab ctermbg=blue guibg=blue
match ErrorMsg '\s\+$'

" Remove all Trailing withespaces
map <F12> :%s/\s\+$//g<CR>

" Buffer navigation
map <F4> :TagbarToggle<CR>
map <F8> :bp<CR>
map <F9> :bn<CR>
map <F10> :bd<CR>
inoremap <F4> :TagbarToggle<CR>
inoremap <F8> <Esc>:bp<CR>
inoremap <F9> <Esc>:bn<CR>
inoremap <F10> <Esc>:bd<CR>

" Go to directory of current file
map <F6> :lcd %:p:h<CR>
inoremap <F6> <Esc>:lcd %:p:h<CR>

set backupdir=$HOME/tmp
set dir=$HOME/tmp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plugin 'scrooloose/nerdtree'
Plugin 'ap/vim-buftabline'
Plugin 'majutsushi/tagbar'
Plugin 'cloudhead/neovim-fuzzy'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on  " allows auto-indenting depending on file type

" Color scheme
"colorscheme koehler
" vim theme
let g:airline_theme='bubblegum'

" NERDTree on CTRL+n
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
"let g:NERDTreeQuitOnOpen=1

nnoremap <C-p> :FuzzyOpen<CR>

source $HOME/.config/nvim/coc.vim
