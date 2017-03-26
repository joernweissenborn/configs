set nocompatible              " be iMproved, required

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

Plugin 'Shougo/neocomplete.vim'

Plugin 'vim-scripts/vim-auto-save'

Plugin 'dart-lang/dart-vim-plugin'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'scrooloose/syntastic'

Plugin 'bling/vim-airline'                      " Nicer statusline

Plugin 'ntpeters/vim-better-whitespace'         " better whitespace managent

Plugin 'tpope/vim-sensible'                     " Sensible defaults

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'nvie/vim-flake8'

Plugin 'mrtazz/DoxygenToolkit.vim'

Plugin 'vim-scripts/SearchComplete'

Plugin 'tpope/vim-surround'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'terryma/vim-multiple-cursors'

Plugin 'flazz/vim-colorschemes'

Plugin 'dhruvasagar/vim-buffer-history'


" VCS
Plugin 'tpope/vim-fugitive'                     " GIT Bindings for VIM
Plugin 'airblade/vim-gitgutter'                 " Shows nice +/- for git chagnes in left pne

" Snippets
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

Plugin 'jplaut/vim-arduino-ino'

Plugin 'rust-lang/rust.vim'

call vundle#end()            " required

filetype plugin indent on    " required

set number
set mouse=a
colorscheme molokai
let mapleader = ","

set visualbell
set t_vb=

nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F6> :SyntasticToggleMode<CR>
nnoremap <Tab> :BufferHistoryBack<CR>
nnoremap <S-Tab> :BufferHistoryForward<CR>
nnoremap <C-b> gd<CR>

nnoremap <leader>y viwy
nnoremap <leader>vp viw"_dP"

" double line
nmap <C-d> yyp
vmap <C-d> ykp
imap <C-d> <ESC>yypi

" select all

nmap <C-a> ggVG

" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" move line up and down

nnoremap <S-Up> ddkkp
nnoremap <S-Down> ddp

" replace currently selected text with default register
" without yanking it

vnoremap <leader>p "_dP"

" intend_guides

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Hack:h9:cANSI
  endif
endif


let g:indent_guides_enable_on_vim_startup = 1

" CtrlP
"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" NerdCommenter

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

au FileType dart set expandtab
au FileType dart set tabstop=2
au FileType dart set shiftwidth=2
au FileType yaml set expandtab
au FileType yaml set tabstop=2
au FileType yaml set shiftwidth=2

" Tagbar

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
let g:airline#extensions#tabline#enabled = 1            " show TabLine by default
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'"

" Nerdtree
nmap <F7> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" How can I open a NERDTree automatically when vim starts up if no files were
" specified?

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0


let g:neocomlete#enable_at_startup = 1
autocmd VimEnter * NeoCompleteEnable " Enable NeoComplete at startup

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()
"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" autowrite
"
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" enable AutoSave on Vim startup
let g:auto_save = 1


"Neosnippets
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

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" better whitespace

"map <C-w> :StripWhitespace<CR>
map <leader>w :StripWhitespace<CR>


" golang
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

" python

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
