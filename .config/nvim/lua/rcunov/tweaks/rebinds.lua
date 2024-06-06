vim.cmd([[
  " -> fold
  "nnoremap <Space> za
  " -> terminal escape
  tnoremap <Esc> <C-\><C-n>
  " -> netrw movement keys
  au FileType netrw nmap <buffer> h -
  au FileType netrw nmap <buffer> <left> -
  au FileType netrw nmap <buffer> l <CR>
  au FileType netrw nmap <buffer> <right> <CR>
  "inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
  "inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
  "inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
  "inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
]])

vim.keymap.set("n", "<leader>df", vim.cmd.Ex)