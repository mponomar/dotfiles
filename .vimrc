set number
set nowrap
set incsearch
set nohlsearch
set cindent
set nobackup
set nowritebackup
set tildeop
set expandtab
set shiftwidth=4
set vb t_vb=
set hidden
set wildmenu
set wildmode=longest,list
set gfn=Monaco:h13
set noswapfile
set nocompatible

syntax on

map [1~ ^
map [4~ $
map <Tab> =<Space>
map! [1~ <esc>^i
map! [4~ <esc>$a

autocmd BufNewFile,BufRead *.f map <Tab> 6i <Esc>a
autocmd BufNewFile,BufRead *.inc map <Tab> 6i <Esc>a
autocmd BufNewFile,BufRead *.c map <Tab> =<Space>
autocmd BufNewFile,BufRead *.lemon set syntax=yacc  "close enough...
autocmd BufNewFile,BufRead *.fth set syntax=forth
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
au! BufRead *.clj setlocal iskeyword+=-/.
au! BufRead *.clj setlocal iskeyword+=*
au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4

au FileType make setlocal expandtab
set laststatus=2 
set cmdheight=1
set bs=0
set ts=4
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk 


map ;h i#ifndef INCLUDED_=toupper(substitute(bufname("%"), '\.c', "", ""))<cr>_H<cr>#define INCLUDED_=toupper(substitute(bufname("%"), '\.c', "", ""))<cr>_H<cr><cr><cr><cr>#endif<esc>kk

hi StatusLine   cterm=bold ctermfg=8  ctermbg=6
hi StatusLineNC term=reverse cterm=reverse
"hi cComment     term=bold cterm=bold ctermfg=4
"hi Comment      term=bold cterm=bold 
hi Comment      ctermfg=5 guifg=DarkCyan
hi cComment     ctermfg=5 guifg=DarkCyan

set shortmess+=I
set path=.,/usr/local/include,/usr/include,/usr/include/x86_64-linux-gnu,/opt/bb/include

let s:hltoggled = 0
function! Hltoggle()
    if (s:hltoggled == 0)
        let s:hltoggled = 1
        set hlsearch
    else
        let s:hltoggled = 0
        set nohlsearch
    endif
endfunction

let s:foldtoggled=0
function! FoldToggle()
    if (s:foldtoggled == 0)
        let s:foldtoggled = 1
        set foldcolumn=8
    else
        let s:foldtoggled = 0
        set foldcolumn=0
    endif
endfunction

map > :cn<cr>
map < :cp<cr>
map B  :buffers<cr>
map T  :tags<cr>
map H 
map M :make<cr>
map S :call Hltoggle()<cr>

"from web http://www.faqs.org/docs/Linux-HOWTO/C-editing-with-VIM-HOWTO.html
map [[ 99[{b<cr>

set grepprg=git\ grep\ -n
map ,f :grep\ <cword><cr>

"set foldmethod=syntax
"set foldlevel=99
"set foldcolumn=0
"map ,f :call FoldToggle()<cr>

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufRead,BufNewFile *.org            call org#SetOrgFileType()
au BufRead *.org :PreLoadTags
au BufWrite *.org :PreWriteTags
au BufWritePost *.org :PostWriteTags

map ,e :copen 20<cr>
map ,c :ccl<cr>

set cinoptions=l1
":nnoremap K K<CR>
":vnoremap K K<CR>
filetype off
set encoding=utf-8
set rtp+=~/.vim/bundle/Vundle.vim
:imap <C-J> <Plug>snipMateNextOrTrigger
:smap <C-J> <Plug>snipMateNextOrTrigger
:imap <C-K> <Plug>snipMateBack
:smap <C-K> <Plug>snipMateBack

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on

hi YcmErrorSection ctermfg=0 ctermbg=5
hi YcmWarningSection ctermfg=0 ctermbg=5

let g:ycm_always_populate_location_list=1
