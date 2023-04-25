set nocompatible
syntax on

set shortmess+=I

set number
"set relativenumber

set showcmd
set showmode
set laststatus=2

set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
"set hidden

" Seach
set ignorecase
set smartcase
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
"set noerrorbells visualbell t_vb=

set mouse+=a

set showmatch 		"highlight matching braces/brackets

set splitbelow
set splitright

set linebreak

set ruler
set colorcolumn=80

set smartindent
set autoindent

set guifont=Menlo:h14
"let macvim_skip_colorscheme=1


" Configuration for MacVim, aka gvimrc, or so I've heard...
if has('gui_running')
    " gvim specific settings here
    colorscheme molokai
    let g:molokai_original = 1
    let g:rehash256 = 1
endif


" Autocorrect
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute
abbr retunr return
abbr breal break

" Auto-closing brackets
inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

