"""""
""" Bootstrap settings
"""""
" Execute any .vimrc in the current directory
set exrc


"""""
""" Text editing settings
"""""
set shiftwidth=4
set tabstop=8
set softtabstop=4
set noexpandtab
syntax enable
set t_Co=256


"""""
""" Plugin management
"""""
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
call plug#end()


"""""
""" Molokai
""""
let g:molokai_original = 1
colorscheme molokai


"""""
""" Solarized
""""
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized


"""""
""" Netrw
"""""
" Tree view
let g:netrw_liststyle = 3
" Remove banner
let g:netrw_banner = 0
" Open files in previous window
let g:netrw_browse_split = 4
" Window size 20%
let g:netrw_winsize = 20
" Don't write errors to a new window
let g:netrw_use_errorwindow = 0


"""""
""" Airline
"""""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the file name
let g:airline#extensions#tabline#fnamemod = ':t'
