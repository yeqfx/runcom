" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


" My RC

set nocompatible
filetype plugin on
set number
syntax on
set fencs=ucs-bom,utf-8,korea

call plug#begin('~\vimfiles\plugged')
Plug 'vimwiki/vimwiki'
Plug 'mhinz/vim-startify'
call plug#end()

let g:vimwiki_list = [
    \{
    \    'path': 'C:\users\SONGWOOJIN\Dropbox\wiki',
    \    'ext' : '.md',
    \    'diary_rel_path': 'diary/',
    \},
    \{
    \    'path': 'C:\users\SONGWOOJIN\Dropbox\healthcare',
    \    'ext' : '.md',
    \    'diary_rel_path': 'diary/',
    \},
\]

colo torte 

set gfn=MesloLGS_NF:h12:cANSI:qDRAFT

if !exists('g:include_set_startify_loaded')
    let g:include_set_startify_loaded = 1

    nmap <LocalLeader>s :Startify<CR>
    nmap <LocalLeader><LocalLeader>s :SSave<CR>

    let g:startify_custom_header = ['']
    let g:startify_update_oldfiles = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_session_sort = 1
    let g:startify_session_persistence = 1

"    let g:startify_commands = [
"          \ ':help startify',
"          \ ]
    let g:startify_commands = [
	\ {'r': ':help reference'},
	\ {'s': ':help startify'},
	\ {'w': ':help vimwiki'},
        \ ]
    let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU'] },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions'] },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
          \ { 'type': 'commands',  'header': ['   Commands'] },
          \ ]  
"    let g:startify_list_order = [
"                \ ['    Sessions'],
"                \'sessions',
"                \ ['    Most Recently Used files'],
"                \'files',
"                \'bookmarks',
"                \ ['    Commands'],
"                \'commands'
"                \]
endif
