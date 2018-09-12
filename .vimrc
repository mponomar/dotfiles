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

hi StatusLine   cterm=bold ctermfg=8  ctermbg=6
hi StatusLineNC term=reverse cterm=reverse
"hi cComment     term=bold cterm=bold ctermfg=4
"hi Comment      term=bold cterm=bold 
hi Comment      ctermfg=5 guifg=DarkCyan
hi cComment     ctermfg=5 guifg=DarkCyan


set shortmess+=I
set path=.,/usr/local/include,/usr/include,/usr/include/x86_64-linux-gnu

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

map ;c i#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <unistd.h>
#include <stddef.h>

int main(int argc, char *argv[]) {
}<esc>
map ;C i#include <iostream>

int main() {
}<esc>
map ;j iimport java.util.*;

public class =substitute(substitute(bufname("%"),".*/", "", ""), "\.java", "", "")<cr> {
public static void main(String argv[]) {
}

public =substitute(substitute(bufname("%"),".*/", "", ""), "\.java", "", "")<cr>() {
}
}
map ;h i#ifndef INCLUDED_=toupper(substitute(bufname("%"), '\.h', "", ""))<cr>_H<cr>#define INCLUDED_=toupper(substitute(bufname("%"), '\.h', "", ""))<cr>_H<cr><cr><cr><cr>#endif<esc>kk
map ;e k0f=wvf(y$oif (rc) {
printf("%s:%d: <esc>pi rc %d\n", __FILE__, __LINE__, rc);
goto done;
}<esc> xo
map ;m <esc>:set nocindent
<esc>:set syntax=make
iOBJS=
BINARY=

LIBS=
CFLAGS=-Wall -g
$(BINARY): $(OBJS)
gcc -o $(BINARY) $(OBJS) $(LDFLAGS) $(LIBS)

%.o: %.c
	gcc -c $(CFLAGS) $< -o $@

clean:  
	rm -f $(BINARY) $(OBJS)<esc>0dwi	<esc>


map > :cn<cr>
map < :cp<cr>
map B  :buffers<cr>
map T  :tags<cr>
map H 
map M :make<cr>
map S :call Hltoggle()<cr>

"from web http://www.faqs.org/docs/Linux-HOWTO/C-editing-with-VIM-HOWTO.html
map [[ ?{
w99[{
map ][ /}
b99]}
map ]] j0[[%/{
map [] k$][%?}

set grepprg=ack-grep\ --nogroup
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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on
