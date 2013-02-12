call pathogen#infect()
syntax on
set background=dark
colorscheme solarized
set nocompatible
filetype plugin indent on
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start " make backspace a more flexible
set backup " make backup files
set backupdir=~/.vim/backup " where to put backup files
set clipboard+=unnamed " share windows clipboard
set directory=~/.vim/tmp " directory to place swap files in
set fileformats=unix,dos,mac " support all three, in this order
set cursorcolumn " highlight the current column
set cursorline " highlight current line
highlight CursorLine  term=underline  ctermbg=DarkGrey
highlight CursorColumn  ctermbg=DarkGrey
highlight StatusLine guifg=#ffffff guibg=#006600
highlight StatusLineNC guifg=#333333 guibg=#444444
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set incsearch " BUT do highlight as you type search phrase
set hlsearch " Highlight search results
set laststatus=2 " always show the status line
set list " we do want to show tabs, to ensure we get them out of my files
set listchars=tab:▸\ ,eol:¬
set nostartofline " leave my cursor where it was
set number " turn on line numbers
set numberwidth=5 " we are good up to 99999 lines
set report=0 " tell when anything changed via :...
set ruler " always show current positions along the bottom
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the side
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current 
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in 
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer
runtime macros/matchit.vim
let macvim_skip_cmd_opt_movement=1

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.as set filetype=actionscript

let g:ruby_conque_rspec_command='bundle exec spec'
set foldmethod=syntax
