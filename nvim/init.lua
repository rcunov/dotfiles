---> main
vim.cmd([[
  syntax on
  filetype plugin on
]])

require("tweaks")

--" " -> disable filetype icons for tabline
--" let g:barbar_auto_setup = v:false " disable auto-setup
--" lua << EOF
--"   require'barbar'.setup {
--"     animation = false,
--"     icons = {
--"         button = 'X',
--"         filetype = {
--"             enabled = false,
--"         }
--"     }
--" }
--" EOF
