---> main
vim.cmd([[
  syntax on
  filetype plugin on
]])

---> visual tweaks
vim.opt.guicursor = ""
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.cmd([[
  colorscheme jellybeans
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText ctermbg=NONE
]])

---> interaction/behavior tweaks
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.expandtab = true
vim.opt.smartcase = true
vim.cmd([[
  set mouse=a
  set wildmode=longest,list
  set clipboard=unnamedplus
  set mousemodel=extend " for windows
  " set mousemodel=popup_setpos " for macOS
  au VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q") " neovim + windows terminal cursor bugfix
]])

---> indent/whitespace guides
vim.cmd([[
  set list lcs+=trail:·,tab:»\ ,multispace:·\ 
]])

---> tab width settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.cmd([[
  autocmd FileType yaml,yml,sh,bash,ash setlocal shiftwidth=2 tabstop=2
]])

---> folding
vim.cmd([[
  set foldlevel=99
  set foldmethod=indent
  set nofoldenable
]])

---> rebinds
vim.cmd([[
  nnoremap <Space> za
  tnoremap <Esc> <C-\><C-n>
]])
