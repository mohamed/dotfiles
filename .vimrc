" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.



" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Enable spell checker
" set spell
set spellfile=~/.vim/spell/dict.add

" Enable Arabic support
set encoding=utf-8
set arabicshape

" Options for search
set ic hls is

" Enable file-type plug-in
filetype plugin on
filetype indent on

" Indentation
set cindent
set smartindent
set noautoindent
set tabstop=8
set shiftwidth=8
set textwidth=78

set equalprg=astyle
