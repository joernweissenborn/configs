set nocompatible              " be iMproved, required
set noswapfile

filetype off                  " required

if has('unix')

	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()

elseif has('win32')

	set rtp+=$HOME/vimfiles/bundle/Vundle.vim
	call vundle#begin('$USERPROFILE/vimfiles/bundle/')

endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'scrooloose/nerdcommenter'

Plugin 'fatih/vim-go'

Plugin 'majutsushi/tagbar'

" Plugin 'Shougo/neocomplete.vim'
Plugin 'maralla/completor.vim'

Plugin 'Shougo/vimproc.vim'

Plugin 'vim-scripts/vim-auto-save'

Plugin 'dart-lang/dart-vim-plugin'

Plugin 'jiangmiao/auto-pairs'

" Plugin 'scrooloose/syntastic'
Plugin 'dense-analysis/ale'

Plugin 'vim-airline/vim-airline'                      " Nicer statusline
Plugin 'vim-airline/vim-airline-themes'                      " Nicer statusline

Plugin 'ntpeters/vim-better-whitespace'         " better whitespace managent

Plugin 'tpope/vim-sensible'                     " Sensible defaults

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'ilyachur/cmake4vim'

Plugin 'mrtazz/DoxygenToolkit.vim'

Plugin 'vim-scripts/SearchComplete'

Plugin 'tpope/vim-surround'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'

Plugin 'dhruvasagar/vim-buffer-history'

Plugin 'petRUShka/vim-opencl'

Plugin 'tpope/vim-repeat'

" Python

Plugin 'vim-scripts/python_match.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'psf/black'
Plugin 'pixelneo/vim-python-docstring'


" VCS
Plugin 'tpope/vim-fugitive'                     " GIT Bindings for VIM
Plugin 'airblade/vim-gitgutter'                 " Shows nice +/- for git chagnes in left pne

" Snippets
" Plugin 'Shougo/neosnippet'
" Plugin 'Shougo/neosnippet-snippets'
" Plugin 'honza/vim-snippets'

Plugin 'jplaut/vim-arduino-ino'

Plugin 'rust-lang/rust.vim'

Plugin 'vim-scripts/vim-stylus'

Plugin 'alvan/vim-closetag'

Plugin 'KabbAmine/gulp-vim'

Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'Quramy/tsuquyomi'

Plugin 'peterhoeg/vim-qml'


call vundle#end()            " required

filetype plugin indent on    " required

" ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_open_list = 1
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
  \ 'python': ['flake8'] ,
  \ 'cpp': ['clangtidy'] ,
  \ }
let b:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'python': ['black'] ,
  \ 'cpp': ['clangtidy'] ,
  \ }

let g:ale_completion_enabled = 1
let g:ale_cpp_clangtidy_options = 'p ./build/'
" let g:ale_cpp_clangtidy_checks = ['*']


" Putty Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if &term =~ "xterm"
  " 256 colors
  let &t_Co = 256
  "     " restore screen after quitting
  let &t_ti = "\<Esc>7\<Esc>[r\<Esc>[?47h"
  let &t_te = "\<Esc>[?47l\<Esc>8"
  if has("terminfo")
    let &t_Sf = "\<Esc>[3%p1%dm"
    let &t_Sb = "\<Esc>[4%p1%dm"
  else
    let &t_Sf = "\<Esc>[3%dm"
    let &t_Sb = "\<Esc>[4%dm"
  endif
endif

" UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
colorscheme solarized
call togglebg#map("<F4>")

set tw=0 " No Auto insert newline
set number
set mouse=a
let mapleader = ","
set lazyredraw
set cursorline
set wildmenu
set visualbell
set term=xterm-256color


nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F6> :ALEToggle<CR>

nnoremap <Tab> :BufferHistoryBack<CR>
nnoremap <S-Tab> :BufferHistoryForward<CR>

" double line or block
nmap <C-d> yyp
vmap <C-d> ykp
imap <C-d> <ESC>yypi

" select all

" nmap <C-a> ggVG

" no auto line break

set formatoptions-=tc

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" move line up and down

nnoremap <S-Up> ddkkp
nnoremap <S-Down> ddp

" replace currently selected text with default register
" without yanking it

vnoremap <leader>p "_dP"
nnoremap <leader>vp viw"_dP"

" copy to buffer
vmap <leader>fy :w! ~/.vimbuffer<CR>
nmap <leader>fy :.w! ~/.vimbuffer<CR>
" paste from buffer
nnoremap <leader>fp :r ~/.vimbuffer<CR>

" new line in insert
inoremap <C-o> <ESC>o
inoremap <C-O> <ESC>O

" SETTINGS FOR GVIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Fira Code\ 11
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Hack:h9:cANSI
  endif
endif

let g:indent_guides_enable_on_vim_startup = 1

" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Completor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" NERDCOMMENTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:NERDDefaultAlign = 'left'

map <C-\> ,c<Space>
map <S-\> ,cs

" Dartlang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


au FileType dart set expandtab
au FileType dart set tabstop=2
au FileType dart set shiftwidth=2
au FileType dart map <C-f> :DartFmt<CR>
au FileType yaml set expandtab
au FileType yaml set tabstop=2
au FileType yaml set shiftwidth=2

" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nmap <F8> :TagbarToggle<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" AirLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" show TabLine by default
let g:airline#extensions#tabline#enabled = 1            

" Automatically displays all buffers when there's only one tab open.``
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'"



" Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F7> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" How can I open a NERDTree automatically when vim starts up if no files were
" specified?

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0


" let g:neocomlete#enable_at_startup = 1
" autocmd VimEnter * NeoCompleteEnable " Enable NeoComplete at startup

" Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
"
" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" autowrite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" enable AutoSave on Vim startup
let g:auto_save = 1


"Neosnippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" better whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>w :StripWhitespace<CR>


" golang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

"au FileType go map <C-n> :lne<CR>
au FileType go map <C-m> :lp<CR>
au FileType go map <C-f> :GoFmt<CR>
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:go_list_type = "quickfix"

" CPP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype cpp setlocal ts=2 sts=2 sw=2
autocmd Filetype h setlocal ts=2 sts=2 sw=2
au FileType cpp map <C-f> :silent ! clang-format --style=file -i %<CR>:redraw!<CR>

" python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

let python_highlight_all=1
syntax on
au FileType python map <C-f> :Black<CR>

" Pydocstring depends on softtabstop. You need to set like set softtabstop=4.
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" nmap <silent> <C-_> <Plug>(pydocstring)
" let g:pydocstring_templates_dir = '/home/joern/configs/programming/python/templates/doc/'
let g:python_style = 'numpy'

" HTML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype html setlocal ts=2 sts=2 sw=2

" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'

"styl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype stylus setlocal ts=2 sts=2 sw=2
autocmd Filetype stylus set expandtab

" typescript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" let g:syntastic_typescript_checkers = ['tsuquyomi']

" angular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimjspretty
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript set expandtab

" CSS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd Filetype css set expandtab

" QML
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd Filetype qml setlocal ts=4 sts=4 sw=4
autocmd Filetype qml set expandtab
au FileType qml map <C-f> :silent ! qmlformat -i %<CR>:redraw!<CR>
