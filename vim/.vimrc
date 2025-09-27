colorscheme lunaperche                                                                                                                        
set background=dark                                                                                                                           
set smartcase                                                                                                                                 
set nohls                                                                                                                                     
set mouse=a                                                                                                                                   
syntax on                                                                                                                                     
                                                                                                                                              
set foldmethod=indent                                                                                                                         
set foldlevel=99                                                                                                                              
nnoremap <space> za                                                                                                                           
                                                                                                                                              
set shiftwidth=4 smarttab                                                                                                                     
autocmd FileType yaml,yml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab                                                             
autocmd FileType yaml,yml map gc 0:norm i#<CR>                                                                                                
autocmd FileType yaml,yml map gz 0:norm x<CR>
