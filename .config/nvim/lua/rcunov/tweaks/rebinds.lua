vim.cmd([[
  "nnoremap <Space> za
  tnoremap <Esc> <C-\><C-n>
  "au FileType netrw nmap <> <CR>
]])

vim.keymap.set("n", "<leader>df", vim.cmd.Ex)
