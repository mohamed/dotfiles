" Author: Mohamed A. Bamakhrama
" Licensed under BSD

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic nvim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " Disable compatibility to old-time vi
set backspace=indent,eol,start
syntax on
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=a                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set hidden
"set paste
"set wildmode=longest,list   " get bash-like tab completions
"set cc=80                   " set an 80 column border for good coding style
set title
set clipboard+=unnamedplus
set tw=80
set linebreak
set ic hls is

" Spaces and tabs
syntax match Tab /\t/
highlight ExtraWhitespace ctermbg=red  guibg=red
highlight Tab ctermbg=blue guibg=blue
match ErrorMsg '\s\+$'
set list
set listchars=tab:__

set backupdir=$HOME/tmp
set dir=$HOME/tmp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin indent on  " allows auto-indenting depending on file type

" Color scheme
"set t_Co=256
"colorscheme koehler
""" Solarized
set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"let base16colorspace=256
"set termguicolors
colorscheme base16-default-dark

" vim theme
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" map leader to space
let mapleader = " "

" Keys to emulate system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

" Remove all Trailing withespaces
nnoremap <Leader>s :%s/\s\+$//g<CR>

" Buffer navigation
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Tab> :bn<CR>
nnoremap <Leader>x :bd<CR>

" Terminal
"tnoremap <Esc> <C-\><C-n>

" Go to directory of current file
nnoremap <Leader>d :lcd %:p:h<CR>

" NERDTree on CTRL+n
let NERDTreeShowHidden=1
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" close NERDTree after a file is opened
"let g:NERDTreeQuitOnOpen=1

" navigation shortcuts
nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>b :ls<CR>:b<Space>
set wildcharm=<Tab>
set wildmenu
set wildmode=full
nnoremap <leader><Tab> :buffer<Space><Tab>

" diff mode style
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=20 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=20 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=20 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
