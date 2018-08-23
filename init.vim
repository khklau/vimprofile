"""""
""" Bootstrap settings
"""""
" Execute any .vimrc in the current directory
set exrc


"""""
""" Plugin management
"""""
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline', { 'tag': 'v0.9' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'sakhnik/nvim-gdb'
Plug 'ajh17/vimcompletesme', { 'tag': '*', 'track': 'tags' }
Plug 'Shougo/unite.vim', { 'tag': 'ver.6.3' }
Plug 'Shougo/vimfiler.vim', { 'tag': 'ver.4.2' }
Plug 'romainl/vim-qf', { 'tag': '0.2.0' }
Plug 'autozimu/LanguageClient-neovim', { 'tag': '*', 'track': 'tags', 'do': 'bash install.sh' }
call plug#end()


"""""
""" Text editing settings
"""""
set shiftwidth=4
set tabstop=8
set softtabstop=4
set expandtab
syntax enable
set t_Co=256
set guicursor=
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0


"""""
""" Jump list settings
"""""
nnoremap <silent> <C-p> <C-o><bar>:bd#<CR>


"""""
""" Grep settings
"""""
cab Grep grep! -I


"""""
""" File finding
"""""
" find files and populate the quickfix list
fun! FindFiles(...)
  let error_file = tempname()
  silent exe '!find '.join(a:000, ' ').' | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cgetfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=+ Find call FindFiles(<f-args>)


"""""
""" Terminal settings
"""""
:tnoremap <Esc> <C-\><C-n>


"""""
""" C++ Development
"""""
let &makeprg = "rm -rf build.status build bin include lib && WAF_ROOT=`pwd` bear ./waf --mode=debug --prefix=`pwd` prepare configure build install"
cab Make make!


"""""
""" Vim-Qf
""""
let g:qf_max_height = 20
nnoremap <silent> cn :cnext<CR>
nnoremap <silent> cp :cprevious<CR>


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
nnoremap <silent> ve :<C-U>VimFiler -explorer -parent -buffer-name=vimfiler -split -simple -find -winwidth=35 -no-quit<CR>


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
let g:LanguageClient_selectionUI = 'quickfix'
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> lv :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> lf :call LanguageClient#textDocument_references() \| copen<CR>
nnoremap <silent> lr :call LanguageClient#textDocument_rename()<CR>
