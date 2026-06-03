" visual/main
colorscheme lunaperche
set background=dark
set ignorecase
set smartcase
set mouse=a
set scrolloff=8
syntax on

set ruler
set laststatus=2
"set statusline=%f "tail of the filename

set hls
nnoremap <C-l> :nohlsearch<CR>

" folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" yaml
set shiftwidth=4 smarttab
autocmd FileType yaml,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType yaml,yml,sh,bash map gc 0:norm i#<CR>
autocmd FileType yaml,yml,sh,bash map gz 0:norm x<CR>
