" Author: Mohamed A. Bamakhrama
" Licensed under BSD

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic nvim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible            " Disable compatibility to old-time vi
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
""" bat
"set termguicolors
"colorscheme bat
""" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" vim theme
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

" Keys to emulate system clipboard
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y

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

" Terminal
tnoremap <Esc> <C-\><C-n>

" Go to directory of current file
map <F6> :lcd %:p:h<CR>
inoremap <F6> <Esc>:lcd %:p:h<CR>

" NERDTree on CTRL+n
let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>

" close NERDTree after a file is opened
"let g:NERDTreeQuitOnOpen=1

" navigation shortcuts
nnoremap <C-p> :FZF<CR>
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

" Configure ccls using nvim LSP
lua require'lspconfig'.ccls.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.bashls.setup{}
lua require'lspconfig'.svls.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
