" -> main
syntax on
filetype plugin on

" -> visual tweaks
set guicursor=a:block
colorscheme jellybeans
set cursorline
set hlsearch

" -> interaction/behavior tweaks
set mouse=a
set smartcase
set expandtab
set wildmode=longest,list
set clipboard=unnamedplus
set mousemodel=extend " for windows
" set mousemodel=popup_setpos " for macOS
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q") " neovim + windows terminal cursor bugfix

" -> indent/whitespace guides
set list lcs+=trail:·,tab:»\ ,multispace:·\ 

" -> folding
set foldlevel=99
set foldmethod=indent
set nofoldenable

" -> rebinds
nnoremap <CR> :noh<CR><CR>
nnoremap <Space> za
