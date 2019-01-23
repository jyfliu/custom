set nocompatible


filetype plugin indent on
syntax enable

" change leader from default (/ or \ i forget) to ,
let mapleader = ","

" some latex parameters
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'dvi'
let g:Tex_MultipleCompileFormats = 'dvi'
let g:Tex_ViewRule_dvi = 'dviout'

" map kj to enter normal mode
imap kj <Esc>

" map ,k
map <Leader>k :w<CR><bar><Leader>ll<Enter><Leader>lv

" make backspace more like other text editors
set backspace=indent,eol,start

" better movement
nnoremap j gj
nnoremap k gk

" better begin/end of line
nnoremap B ^
nnoremap E $

" highlight the last inserted text
nnoremap gV `[v`]

" show line numbers 
set number
" show last command
set showcmd
" show line
set cursorline

" faster macros
set lazyredraw
" show matching brackets
set showmatch

" make searching better
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" tab settings
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
