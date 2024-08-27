" c0r73x
if match($TERM, "screen")!=-1
    set term=xterm
endif

set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
"#call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
"#Plugin 'VundleVim/Vundle.vim'
" Bundle 'Powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
" set rtp+=/Users/rhand/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

"
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

filetype on
filetype off
silent! call pathogen#infect()
silent! call pathogen#helptags()
filetype plugin indent on

"set synmaxcol=120
"s
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set nocompatible
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set showmatch
set nohls
set incsearch
syntax enable
syn sync fromstart
" colorschem shinryuu
colorscheme default
set number
set showbreak=>>>\ 
set wrap
set cpo=n
set linebreak
set mouse=a
set cul
set laststatus=2
set swapfile
set backspace=indent,eol,start
set viminfo=
set clipboard=unnamed
set ignorecase
set smartcase
set et
set wildmode=list:longest
set wildmenu
set cpoptions+=n
set shellslash

set guicursor=a:blinkon0
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
"#let mapleader=","

set encoding=utf-8
"set fileencoding=utf-8
set guifont="Fixed Medium Semi-Condensed 6"
set guioptions=
set guicursor=a:blinkon0

if $TERM =~ "-256color"
   set t_Co=256
endif

hi TabLineFill term=bold cterm=bold ctermbg=0 ctermfg=gray cterm=none
hi TabLineSel term=bold cterm=bold ctermfg=0 ctermbg=green cterm=none
hi TabLine ctermfg=gray ctermbg=0 cterm=none

set statusline=
set statusline+=%7*%n%8*\ ::\                     " buffer number
set statusline+=%0*%f                          " file name
set statusline+=%7*%h%m%r%w%8*\ ::\                        " flags
set statusline+=%2*%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc},    " encoding
set statusline+=%{&fileformat}%0*              " file format
set statusline+=%=                              " right align

"set statusline+=%6*%{synIDattr(synID(line('.'),col('.'),1),'name')}%8*\ ::\  " highlight

let git=system('git branch')
if git!=""
    "set statusline+=%3*%{fugitive#statusline()}%8*\ ::\        " git branch
endif

set statusline+=%5*%b,0x%B%8*\ ::\                     " current char
set statusline+=%4*%c,%l%8*\ ::\                     " current line/column
set statusline+=%<%1*%P                         " offset

" -- required --
set nocp " non vi compatible mode
filetype plugin on " enable plugins

" -- optional --
" auto close options when exiting insert mode

" hjkl
noremap <silent> <m-h> :wincmd h<CR>:<BS>
noremap <silent> <m-j> :wincmd j<CR>:<BS>
noremap <silent> <m-k> :wincmd k<CR>:<BS>
noremap <silent> <m-l> :wincmd l<CR>:<BS>

noremap <silent> <s-H> :wincmd H<CR>:<BS>
noremap <silent> <s-J> :wincmd J<CR>:<BS>
noremap <silent> <s-K> :wincmd K<CR>:<BS>
noremap <silent> <s-L> :wincmd L<CR>:<BS>

noremap <silent> <C-k> :ObviousResizeUp<CR> 
noremap <silent> <C-j> :ObviousResizeDown<CR> 
noremap <silent> <C-h> :ObviousResizeLeft<CR> 
noremap <silent> <C-l> :ObviousResizeRight<CR>

" Arrow keys

noremap <silent> <C-Up> :ObviousResizeUp<CR> 
noremap <silent> <C-Down> :ObviousResizeDown<CR> 
noremap <silent> <C-Left> :ObviousResizeLeft<CR> 
noremap <silent> <C-Right> :ObviousResizeRight<CR>

noremap <silent> <m-left> :wincmd h<CR>:<BS>
noremap <silent> <m-down> :wincmd j<CR>:<BS>
noremap <silent> <m-up> :wincmd k<CR>:<BS>
noremap <silent> <m-right> :wincmd l<CR>:<BS>

noremap <silent> <s-m-left> :wincmd H<CR>:<BS>
noremap <silent> <s-m-down> :wincmd J<CR>:<BS>
noremap <silent> <s-m-up> :wincmd K<CR>:<BS>
noremap <silent> <s-m-right> :wincmd L<CR>:<BS>

"nmap <F5> :Shell("scons")<CR>
"imap <Esc><F5> :Shell("scons")<CR>
"map <F5> :Shell("scons")<CR>

nnoremap <F3> :set hlsearch!<CR>

if &diff
    noremap <space> ]cz.
    noremap <C-space> [cz.
endif

function! s:ExecuteInShell(command, bang)
    let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))

    if (_ != '')
        let s:_ = _
        let bufnr = bufnr('%')
        let winnr = bufwinnr('^' . _ . '$')
        silent! execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'
        setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
        silent! :%d
        let message = 'Execute ' . _ . '...'
        call append(0, message)
        echo message
        silent! 2d | resize 1 | redraw
        silent! execute 'silent! %!'. _
        silent! execute 'resize ' . line('$')
        silent! execute 'syntax on'
        silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
        silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
        silent! execute 'nnoremap <silent> <buffer> <CR> :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
        silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
        nnoremap <silent> <buffer> <C-W>_ :execute 'resize ' . line('$')<CR>
        silent! syntax on
    endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
cabbrev shell Shell

if version >= 600
    filetype plugin indent on
endif

au BufEnter /private/tmp/crontab.* setl backupcopy=yes

