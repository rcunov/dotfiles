" -> main
syntax on
filetype plugin on

" -> visual tweaks
set guicursor=a:block
colorscheme jellybeans
set cursorline
set hlsearch
hi Normal guibg=NONE ctermbg=NONE
hi NonText ctermbg=NONE

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

" -> tab width settings
autocmd FileType yaml,yml,sh,bash,ash setlocal shiftwidth=2 tabstop=2

" -> folding
set foldlevel=99
set foldmethod=indent
set nofoldenable

" -> rebinds
nnoremap <CR> :noh<CR><CR>
nnoremap <Space> za
tnoremap <Esc> <C-\><C-n>

" " -> disable filetype icons for tabline
" let g:barbar_auto_setup = v:false " disable auto-setup
" lua << EOF
"   require'barbar'.setup {
"     animation = false,
"     icons = {
"         button = 'X',
"         filetype = {
"             enabled = false,
"         }
"     }
" }
" EOF