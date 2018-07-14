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
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0


"""""
""" Plugin management
"""""
call plug#begin('.config/nvim/autoload')
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'sakhnik/nvim-gdb'
Plug 'ajh17/vimcompletesme'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()


"""""
""" Terminal settings
"""""
:tnoremap <Esc> <C-\><C-n>


"""""
""" Python3 provider
"""""
let g:python3_host_prog = '/usr/bin/python3'


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


"""""
""" LanguageClient-neovim
"""""
let g:deoplete#enable_at_startup = 1
set hidden            " Required for operations modifying multiple buffers like rename.
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd']
    \ }
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'