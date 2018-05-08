set nocompatible               " Be iMproved

set mouse+=a
set ttymouse=xterm2

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vimsyntax'

NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rking/ag.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']
NeoBundle 'matze/vim-move'
NeoBundle 'groenewege/vim-less'
NeoBundle 'vim-scripts/csv.vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'machakann/vim-textobj-delimited'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'mtscout6/vim-cjsx'
NeoBundle 'othree/yajs.vim'
NeoBundle 'lambdatoast/elm.vim'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'jgdavey/tslime.vim'
NeoBundle 'edkolev/promptline.vim'
NeoBundle 'ajh17/VimCompletesMe'
NeoBundle 'ludovicchabant/vim-gutentags'
NeoBundle 'mhinz/vim-mix-format'
NeoBundle 'cespare/vim-toml'

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
"set cursorcolumn " highlight the current column
"set cursorline " highlight current line
"highlight CursorLine  term=underline  ctermbg=Black
"highlight CursorColumn  ctermbg=Black
highlight StatusLine guifg=#ffffff guibg=#006600
highlight StatusLineNC guifg=#333333 guibg=#444444
"au WinLeave * set nocursorline nocursorcolumn
"au WinEnter * set cursorline cursorcolumn
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
" these commands are because stackoverflow said it was cool
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting/16903054#16903054
set ttyfast " running locally, so send more characters for speeeed
set lazyredraw " dont' redraw during macros etc for speeeed
set nobackup
set noswapfile
let g:airline_powerline_fonts = 1

" display anything longer than 80 chars on a line in angry red
let g:overlength_ignored = [
      \"qf",
      \"yaml",
      \"diff",
      \"gitcommit",
      \"fugitiveblame"
      \]
let g:overlength_on = 1
fun! OverLengthOnMaybe()
  if g:overlength_on == 1
    if index(g:overlength_ignored, &filetype) != -1
      highlight clear OverLength
    else
      highlight OverLength ctermbg=darkred
    endif
    match OverLength /\%>80v.\+/
  else
    highlight clear OverLength
  endif
endfun

fun! OverLengthToggle()
  if g:overlength_on == 1
    let g:overlength_on = 0
  else
    let g:overlength_on = 1
  endif
  call OverLengthOnMaybe()
endfun

augroup vimrc_autocmds
  autocmd BufEnter,Filetype * call OverLengthOnMaybe()
augroup END

let mapleader="\<Space>"

" insert current date/time
:nnoremap <F5> "=strftime("%FT%T%z")<CR>P
:inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>

:nnoremap <F6> "=strftime("%Y-%m-%d %a")<CR>P
:inoremap <F6> <C-R>=strftime("%Y-%m-%d %a")<CR>

:nnoremap <silent> <leader>nt :NERDTree<cr>
:nnoremap <silent> <leader>nf :NERDTreeFind<cr>
" high light word, copy it, do Ag search on it
:nnoremap <silent> <leader>a ebvey:Ag!<cr>

" CtrlPTag
:nnoremap <silent> <leader>pt :CtrlPTag<cr>

" move up/down in wrapped lines
nnoremap j gj
nnoremap k gk

" move whole blocks up/down
let g:move_map_keys = 0
nmap <Up>   <Plug>MoveLineUp
nmap <Down> <Plug>MoveLineDown
vmap <Up>   <Plug>MoveBlockUp
vmap <Down> <Plug>MoveBlockDown

nnoremap <Left> <<
nnoremap <Right> >>
vnoremap <Left> <gv
vnoremap <Right> >gv

" unhighlight search term
nnoremap <silent> ,/ :nohlsearch<CR>

" insert new line at position
nnoremap <CR> i<CR><ESC>
" keep CR working in quickfix/location working even with above mapping
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" format text paragraph
nnoremap <silent> <leader>fp vipgq

" open tag in new tab
nnoremap <silent> <Leader>tt <C-w><C-]><C-w>T
" open tag in split
nnoremap <silent> <Leader>ts :split<CR>:exec("tag ".expand("<cword>"))<CR>
" open tag in vsplit
nnoremap <silent> <Leader>tv :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" toggle overlength highlighting
nnoremap <silent> <leader>o :call OverLengthToggle()<CR>

" increment / decrement numbers (ctrl-A is used by tmux)
:nnoremap <Leader>ns <C-a>
:nnoremap <Leader>nx <C-x>

" RSpec.vim mappings
au FileType ruby map <Leader>rt :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>rs :call RunNearestSpec()<CR>
au FileType ruby map <Leader>rl :call RunLastSpec()<CR>
au FileType ruby map <Leader>ra :call RunAllSpecs()<CR>
au FileType ruby map <Leader>tr unset g:tslime
au FileType ruby let g:rspec_command =
      \ 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

au BufNewFile,BufReadPost *.coffee
      \ setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.md
      \ setl ft=markdown wrap linebreak tw=80 spell spelllang=en_au
au BufNewFile,BufReadPost *.wiki
      \ setl ft=vimwiki wrap linebreak tw=80 spell spelllang=en_au
au BufNewFile,BufReadPost *.thrift setl ft=thrift
au BufNewFile,BufReadPost *.python setl
      \ tabstop=8 noexpandtab shiftwidth=8 softtabstop=8

"# ignore noise in ctrlp
let g:ctrlp_custom_ignore =
      \ '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" vimwiki
au FileType vimwiki setlocal spell
au FileType vimwiki nmap <Leader>k <Plug>VimwikiDiaryPrevDay
au FileTYpe vimwiki nmap <Leader>j <Plug>VimwikiDiaryNextDay
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki'}]

" hide the footer
" from https://unix.stackexchange.com/questions/140898/vim-hide-status-line-in-the-bottom
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction

nnoremap <S-h> :call ToggleHiddenAll()<CR>
