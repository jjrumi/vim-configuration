""
" Filename: .vimrc
" Maintainer: Juan Luis J. Rumí <jjrumi@gmail.com>
" Vastly inspired on:
"   - https://gist.github.com/JeffreyWay/6753834
"   - https://github.com/michaeljsmalley/dotfiles/blob/master/vimrc
"
" Plugins & Extras:
"   - https://github.com/gmarik/vundle
"   - https://github.com/scrooloose/nerdtree
"   - https://github.com/bling/vim-airline
"   - Font xoria256: http://www.vim.org/scripts/script.php?script_id=2140
""

""
" General behavior
""
set nocompatible    " Disable vi-compatibility
set laststatus=2    " Always show the statusline
set encoding=utf-8  " Necessary to show Unicode glyphs
set noshowmode      " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showcmd         " Show (partial) command in the status line
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase,
set visualbell      " don't beep
set noerrorbells    " don't beep
set autowrite       " Save on buffer switch
highlight Search cterm=underline
set backupdir=~/.vim/backup//   " Swap files out of the project root
set directory=~/.vim/swap//
set timeout timeoutlen=200 ttimeoutlen=100
set mouse-=a        " Avoid mouse interaction
set clipboard=unnamed   " Copy to clipboard

""
" Theme / Colors
""
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
endif
syntax on
colorscheme solarized
set background=dark

""
" Bundles with Vundle: https://github.com/gmarik/vundle
""
filetype off    " Required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

""
" UI & Text formatting
""
set guioptions-=T               " Removes top toolbar
set guioptions-=r               " Removes right hand scroll bar
set go-=L                       " Removes left hand scroll bar
set linespace=10
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers

""
" Shortcuts
""
" With a map leader it's possible to do extra key combinations like <leader>t runs phpunit tests
let mapleader = ","
let g:mapleader = ","

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"Resize vsplit
nmap <C-v> :vertical resize +5<cr>
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>

" Create split below
nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

" Run PHPUnit tests on current file
map <Leader>t :!phpunit %<cr>

autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

" Auto-remove trailing spaces on php files
autocmd BufWritePre *.php :%s/\s\+$//e

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

