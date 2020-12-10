" *****************************************
"
"      _/\/\____/\/\_/\/\__________________
"     _/\/\____/\/\________/\/\/\__/\/\___ 
"    _/\/\____/\/\_/\/\___/\/\/\/\/\/\/\_  
"   ___/\/\/\/\___/\/\___/\/\__/\__/\/\_   
"  _____/\/\_____/\/\/\_/\/\______/\/\_    
" ____________________________________     
"
" LAST UPDATE: 2019-03-11
" 
" main configure
"
" *****************************************

if !&compatible
  set nocompatible
endif

filetype off
filetype plugin indent off

set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=utf-8,sjis,japan,iso-2022-jp

set backupskip=/tmp/*,/private/tmp/*
set backupdir=~/.vim/tmp/BAK
set directory=~/.vim/tmp/SWP
if has('persistent_undo')
  set undodir=~/.vim/tmp/UND
  set undofile
endif

if has('nvim')
    set viminfo='50,<1000,s100,:0,n~/.vim/tmp/ETC/.nviminfo
    set clipboard=unnamedplus
    let g:python_host_prog = substitute(system('which python2'),"\n","","")
    let g:python3_host_prog = substitute(system('which python3'),"\n","","")
else
    set viminfo='50,<1000,s100,:0,n~/.vim/tmp/ETC/.viminfo
    set clipboard=unnamed,autoselect
endif


set tags+=.tags;~

set rtp+=$HOME/.vim/
runtime! rc/*.vim

set ruler
set cmdheight=4
set laststatus=2
set title
set linespace=1
set showcmd

set wildmenu
set wildmode=list:longest,full

set whichwrap=h,l

set guifont=JetBrains\ Mono

set hidden
set confirm

set list
set listchars=eol:$,tab:>-,trail:_,extends:<

augroup cch
	autocmd! cch
	autocmd WinLeave * set nocursorline
	autocmd WinEnter,BufRead * set cursorline
augroup END
set cursorcolumn
set cursorline
hi clear CursorColumn
hi clear CursorLine
hi CursorLine gui=underline

highlight CursorLine ctermbg=238
highlight CursorColumn ctermbg=238
highlight Cursor ctermbg=204

" change color when entering insert mode
autocmd insertEnter * highlight  cursorline ctermbg=236
autocmd insertEnter * highlight  cursorcolumn ctermbg=236
autocmd insertEnter * highlight  cursor ctermbg=44

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine ctermbg=238
autocmd InsertLeave * highlight  CursorColumn ctermbg=238
autocmd InsertLeave * highlight  Cursor ctermbg=204

set fillchars=vert:\|
set foldmethod=marker
hi Folded gui=bold term=standout ctermfg=Blue guibg=blue guifg=black
hi FoldColumn gui=bold term=standout ctermfg=Blue guibg=Grey guifg=black
" tab & line end string display on
"


set number
set relativenumber

function! s:toggle_relative_number() abort
    let b:relnum = !get(b:, 'relnum', 1)

    if b:relnum
        setlocal relativenumber
    else
        setlocal norelativenumber
    endif

    setlocal number
endfunction
command! ToggleRelativeNumber call s:toggle_relative_number()
highlight LineNr ctermfg=0
highlight CursorLineNr ctermfg=204
highlight CursorLineNr ctermbg=236

autocmd insertenter * highlight LineNr ctermfg=237
autocmd insertenter * highlight CursorLineNr ctermfg=1
autocmd insertenter * setlocal norelativenumber
autocmd insertLeave * highlight LineNr ctermfg=0
autocmd insertLeave * highlight CursorLineNr ctermfg=204
autocmd insertLeave * setlocal relativenumber

set showmatch
set backspace=indent,eol,start

" tab
set tabstop=4
" set softtabstop=2
" set expandtab
set smarttab
set shiftwidth=4
set shiftround
set nowrap

" indent
set autoindent
set cindent
set nosmartindent

" Enable folding.
set foldenable
set foldmethod=marker
set foldcolumn=5


" WINDOW
set splitbelow
set splitright
" set showtabline=2
set guioptions-=e


" SEARCH
set ignorecase
set wrapscan
set hlsearch
set incsearch
hi Search ctermbg=3
hi Search ctermfg=16
" set grepprg=grep\ -nH

set scrolloff=3


" Netrw
let g:netrw_liststyle=1
" let g:netrw_home='~/.vim/tmp/ETC'
let g:netrw_banner=0
let g:netrw_sizestyle="H"
let g:netrw_timefmt="%Y/%m/%d %H:%M:%S"
let g:netrw_preview=1

