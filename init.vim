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
set expandtab
syntax enable
set t_Co=256
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0


"""""
""" Jump list settings
"""""
nnoremap <silent> <C-p> <C-o><bar>:bd#<CR>


"""""
""" Plugin management
"""""
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'sakhnik/nvim-gdb'
Plug 'ajh17/vimcompletesme'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
call plug#end()


"""""
""" Terminal settings
"""""
:tnoremap <Esc> <C-\><C-n>


"""""
""" C++ Development
"""""
let &makeprg = "rm -rf build.status build bin include lib && WAF_ROOT=`pwd` bear ./waf -v --mode=debug --prefix=`pwd` prepare configure build install"
" automatically open the quickfix window whenever any commands populate it and are qualified matches
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow 20
    autocmd QuickFixCmdPost l*    cwindow 20
    autocmd VimEnter        *     cwindow 20
augroup END


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
""" VimFiler
"""""
let g:vimfiler_as_default_explorer = 1
nnoremap <silent> ve :<C-U>VimFiler -explorer -parent -buffer-name=vimfiler -split -simple -winwidth=35 -no-quit<CR>


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
""" VimCompletesMe
"""""
autocmd FileType cpp let b:vcm_tab_complete = 'omni'


"""""
""" LanguageClient-neovim
"""""
set hidden            " Required for operations modifying multiple buffers like rename.
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsList = "location"
let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cquery.log', '--init={"cacheDirectory":"' . $HOME . '/.cquery/"}', '--language-server'],
    \ }
autocmd FileType cpp setlocal omnifunc=LanguageClient#complete
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> lh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> lr :call LanguageClient#textDocument_rename()<CR>
