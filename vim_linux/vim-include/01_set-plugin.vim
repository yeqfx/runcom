se nocp		" set nocompatible : vi와 호환모드를 해제하고 Vim의 향상된(Improved) 기능을 사용할 수 있게 한다.
filetype plugin indent on

call plug#begin('~\vimfiles\plugged')
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
call plug#end()
