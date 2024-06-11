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
  " -> peek definition
  nnoremap <leader>q :call tag_peek#ShowTag()<CR>
  " -> increase/reduce indent in visual line mode
  xnoremap <Tab> >gv
  xnoremap <S-Tab> <gv
]])

vim.keymap.set("n", "<leader>df", vim.cmd.Ex)
vim.keymap.set("n", "<leader><Space>", 'za')
