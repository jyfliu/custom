set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
"windows
"set rtp+=$VIM\vimfiles\bundle\Vundle.vim
call vundle#begin()

" vundle
Plugin 'VundleVim/Vundle.vim'

"aesthetics
Plugin 'ayu-theme/ayu-vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'romainl/flattened'
"Plugin 'itchyny/lightline.vim'

" essentials
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'Townk/vim-autoclose'
Plugin 'alvan/vim-closetag'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'wincent/command-t'
Plugin 'djoshea/vim-autoread'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chrisbra/improvedft'

"unicode
Plugin 'chrisbra/unicode.vim' 

"language specific stuff
"latex stuffs
Plugin 'vim-latex/vim-latex'

" html
Plugin 'mattn/emmet-vim'

" scala
Plugin 'derekwyatt/vim-scala'

" js
Plugin 'flowtype/vim-flow'

" linter
Plugin 'w0rp/ale'
call vundle#end()
filetype plugin indent on
syntax enable
" vundle stuff over

" change leader from default (/ or \ i forget) to ,
let mapleader = ","

" some latex parameters
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'
let g:Tex_ViewRule_dvi = 'dviout'
let g:Tex_ViewRule_pdf = 'mupdf-gl'

" map kj to enter normal mode
imap kj <Esc>

" map ,k
map <Leader>k :w<CR><bar><Leader>ll<Enter><Leader>lv
map = <F5>

" make backspace more like other text editors
set backspace=indent,eol,start

" better movement
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" movement between panes
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

" resize splits
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" better default positions
set splitbelow
set splitright

" better delete
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap C "_C
nnoremap c "_c
vnoremap c "_c

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d
nnoremap <leader>C ""C
vnoremap <leader>c ""c

" faster apply macro
nnoremap Q @q

" faster quit and save
nnoremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>a

" faster colon
nnoremap <space> :
vnoremap <space> :

" faster change word (you can press . to repeat all instances of the word)
nnoremap c* *``cgn
nnoremap c# #``cgN
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN

" better begin/end of line
nnoremap B ^
nnoremap E $
vnoremap B ^
vnoremap E $

" Cycle through location list
nnoremap <silent> <F2> :try<bar>:try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E553/<bar>lfirst<bar>catch/^Vim\%((\a\+)\)\=:E776/<bar>endtry<bar>catch /^Vim\%((\a\+)\)\=:E42/<bar>endtry<cr>
nnoremap <silent> <F1> :try<bar>:try<bar>lprev<bar>catch /^Vim\%((\a\+)\)\=:E553/<bar>llast<bar>catch/^Vim\%((\a\+)\)\=:E776/<bar>endtry<bar>catch /^Vim\%((\a\+)\)\=:E42/<bar>endtry<cr>

" cd vim into the directory of the current buffer
nnoremap <leader>y :cd %:p:h<CR>

" Make indenting and unindenting block selections not lose the selection
vnoremap < <gv
vnoremap > >gv

" highlight the last inserted text
nnoremap gV `[v`]

" when editing a file that requires root, try to save using sudo
cmap w!! %!sudo tee > /dev/null %

" show line numbers 
set number
" show last command
set showcmd
" show line
set cursorline
hi cursorline cterm=none term=none
highlight CursorLine guibg=#303000 ctermbg=21

" mouse
set mouse=a

" thin cursor
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

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

set expandtab

autocmd Filetype javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2 tabstop=2 

set textwidth=160

set colorcolumn=80

" ayu
"set termguicolors
"let ayucolor="mirage"
"colorscheme ayu

" papercolor
set t_Co=256
set background=light
colorscheme PaperColor

set lazyredraw

" These go in $VIM/ftplugin/tex.vim
"call IMAP ('->', '\to', "tex")
"call IMAP (':>', '\mapsto', "tex")
"call IMAP ('\[', '\[<++>\]<++>', "tex")

scriptencoding utf-8
set encoding=utf-8

"set conceallevel=2
"set concealcursor=n

"syntax match Normal '\\alpha' conceal cchar=α
"syntax match Normal '\\beta' conceal cchar=β
"syntax match Normal '\\gamma' conceal cchar=γ
"syntax match Normal '\\delta' conceal cchar=δ
"syntax match Normal '\\epsilon' conceal cchar=ε
"syntax match Normal '\\zeta' conceal cchar=ζ
"syntax match Normal '\\eta' conceal cchar=η
"syntax match Normal '\\theta' conceal cchar=θ
"syntax match Normal '\\iota' conceal cchar=ι
"syntax match Normal '\\kappa' conceal cchar=κ
"syntax match Normal '\\lambda' conceal cchar=λ
"syntax match Normal '\\mu' conceal cchar=μ
"syntax match Normal '\\nu' conceal cchar=ν
"syntax match Normal '\\xi' conceal cchar=ξ
"syntax match Normal '\\omicron' conceal cchar=ο
"syntax match Normal '\\pi' conceal cchar=π
"syntax match Normal '\\rho' conceal cchar=ρ
"syntax match Normal '\\sigma' conceal cchar=σ
"syntax match Normal '\\tau' conceal cchar=τ
"syntax match Normal '\\upsilon' conceal cchar=ʊ
"syntax match Normal '\\phi' conceal cchar=φ
"syntax match Normal '\\chi' conceal cchar=χ
"syntax match Normal '\\psi' conceal cchar=ψ
"syntax match Normal '\\omega' conceal cchar=ω

" nerdtree stuffs
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-n> :NERDTreeToggle<CR>

" disable autoclose in latex
"autocmd BufNewFile,BufRead *.tex AutoCloseOff

" strip trailing white spaces in py, js, css, html, tpl files
autocmd BufWritePre *.py,*.js,*.css,*.html,*.tpl :%s/\s\+$//e

" ale
let g:ale_linters = {'python':['pyflakes'],'C':['gcc'],'C++':['gcc']}
let g:ale_sign_column_always = 1
nnoremap <leader>a :ALEHover<CR>

" command t
let g:CommandTSuppressMaxFilesWarning = 1

" tags
nnoremap L <C-]>
nnoremap H <C-t>

" folding
set foldmethod=indent
set foldlevelstart=999

" auto close tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

" merlin for ocaml
if executable('ocamlmerlin') && has('python')
  let s:ocamlmerlin = substitute(system('opam config var share'), '\n$', '', '''') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
endif

"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif
