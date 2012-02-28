colorscheme slate
highlight CursorLine  term=underline  guibg=#663333  cterm=underline
highlight CursorColumn guibg=#663333
highlight StatusLine guifg=#ffffff guibg=#006600
highlight StatusLineNC guifg=#333333 guibg=#444444
"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59
set guifont=Menlo\ Regular:h14
if has("gui_macvim")
  set macmeta
  macmenu &File.New\ Tab key=<nop>
  map <D-t> :CommandT<CR>
  nmap <Right> :bnext<CR>
  nmap <Left> :bprevious<CR>
  nmap <D-Right> :tabnext<CR>
  nmap <D-Left> :tabprev<CR>
endif
