set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vimsyntax'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'vim-scripts/Puppet-Syntax-Highlighting'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'matze/vim-move'
NeoBundle 'groenewege/vim-less'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'amix/vim-zenroom2'

filetype plugin indent on
NeoBundleCheck
syntax enable
set background=dark
colorscheme solarized
set tabstop=8
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start " make backspace a more flexible
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
set listchars=tab:▸\ ,eol:¬,trail:✖
set nostartofline " leave my cursor where it was
set number " turn on line numbers
set numberwidth=5 " we are good up to 99999 lines
set report=0 " tell when anything changed via :...
set ruler " always show current positions along the bottom
set showcmd " show the command being typed
set showmatch " show matching brackets
set sidescrolloff=10 " Keep 5 lines at the side
runtime macros/matchit.vim
let macvim_skip_cmd_opt_movement=1
let ruby_no_expensive=1 " speed up ruby

" move up/down in wrapped text
nmap j gj
nmap k gk

" insert current date/time
:nnoremap <F5> "=strftime("%FT%T%z")<CR>P
:inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>

:nnoremap <silent> <leader>z :Goyo<cr>
:nnoremap <silent> <leader>nt :NERDTree<cr>
:nnoremap <silent> <leader>nf :NERDTreeFind<cr>

" move plugin remap for iterm
let g:move_key_modifier = 'C'

au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.md setl ft=markdown wrap linebreak tw=80
