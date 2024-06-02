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
]])

vim.keymap.set("n", "<leader>df", vim.cmd.Ex)
