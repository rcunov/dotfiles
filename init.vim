set cursorline
set smartcase
set hlsearch
set expandtab
set wildmode=longest,list
syntax on
set mouse=a
set clipboard=unnamedplus
filetype plugin on
colorscheme jellybeans
nnoremap <CR> :noh<CR><CR>

set guicursor=a:block
" set guicursor=a:blinkwait500-blinkoff500-blinkon500,a:hor100

set mousemodel=extend " for windows
au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q") " neovim + windows terminal bugfix
" set mousemodel=popup_setpos " for macOS
