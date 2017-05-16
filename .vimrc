""""""""""""""""""""""""""""
" NeoBunble
""""""""""""""""""""""""""""
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'taglist.vim'
NeoBundle 'https://github.com/wesleyche/SrcExpl.git'
NeoBundle 'https://github.com/wesleyche/Trinity.git'
" test
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" set ts=4 sw=4 et
set expandtab tabstop=4 shiftwidth=4 softtabstop=4

" 行表示
set number
set cursorline

" 表示画面幅を超える行を折り返して表示しない
set nowrap

" 検索の時、大文字小文字を区別しない
set ic

"""""""""""""""""""""""""""""
" バックアップ先
"""""""""""""""""""""""""""""
set backupdir=~/.backups/vim/
"
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac

"""""""""""""""""""""""""""""
" 自動補完
"""""""""""""""""""""""""""""
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
	exec "imap " . k . " " . k . "<C-X><C-P><C-N>"
endfor
imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

" http://inari.hatenablog.com/entry/2014/05/05/231307
"""""""""""""""""""""""""""""
" 全角スペースの表示
"""""""""""""""""""""""""""""
function! ZenkakuSpace()        
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray       
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>

""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""
set t_Co=256
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let b:airline_whitespace_disabled = 1

""""""""""""""""""""""""""""""
" hybrid
""""""""""""""""""""""""""""""
let g:hybrid_use_iTerm_colors = 1
set background=dark
colorscheme hybrid
syntax on

""""""""""""""""""""""""""""""
" gtags
""""""""""""""""""""""""""""""
map <C-g> :Gtags -g
map <C-h> :Gtags -f %<CR>
map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>

"""""""""""""""""""""""""""""" 
" SrcExpl
""""""""""""""""""""""""""""""
" tagsは自動で作成する
let g:SrcExpl_UpdateTags    = 1
" プレビューウインドウの高さ
" let g:SrcExpl_WinHeight     = 7

""""""""""""""""""""""""""""""
" 自動コメントアウト無効化
""""""""""""""""""""""""""""""
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
