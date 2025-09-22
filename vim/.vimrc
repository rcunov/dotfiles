colorscheme lunaperche
set background=dark
set smartcase
set nohls
syntax on

set shiftwidth=4 smarttab
autocmd FileType yaml,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType yaml,yml map gc ^:norm i#<CR>
autocmd FileType yaml,yml map gz ^:norm x<CR>
