se nocp		" set nocompatible : vi와 호환모드를 해제하고 Vim의 향상된(Improved) 기능을 사용할 수 있게 한다.
filetype plugin on
syntax on	" 문법 표시를 사용한다. syntax enable과 같다. 비활성화는 syntax off 또는 syntax clear
se nu		" set number : 화면에 행번호를 표시한다.

""""""""""""""""""""""
" Indent Setting
""""""""""""""""""""""
se ai		" set autoindent : 자동 들여쓰기를 사용한다. 새 행의 들여쓰기를 이전행의 들여쓰기와 동일하게 맞춰준다.
se cindent	" C언어 스타일의 들여쓰기를 사용한다.

""""""""""""""""""""""
" Tab Setting
""""""""""""""""""""""
se ts=4		" set tabstop : 탭 크기를 지정한다. 탭 하나를 몇 개의 공백으로 표시할지 결정한다. 기본값은 8.
se sts=4	" softtabstop 
se sw=4		" set shiftwidth : cindent를 설정한 다음 블록을 시작할 때 자동으로 들여쓰는 열의 너비를 설정한다.
se et		" expandtab : Tab을 space로 설정한다.
se tw=80	" set textwidth : 편집할 화면의 열 길이를 정한다(0이면 비활성화).
se hls		" set hlsearch : 하이라이트로 검색어를 강조한다.
se ru		" set ruler : 오른쪽 아래에 현재 위치를 표시한다.

"""""""""""""""""""""
" Search Setting
"""""""""""""""""""""
se ignorecase
se smartcase
se hls		" set hlsearch : 
se is		" set incsearch : 

"""""""""""""""""""""
" Encoding Setting
"""""""""""""""""""""
se fencs=ucs-bom,utf-8,korea
se fenc=utf-8


" colo torte	" colorscheme : 색상 테마를 사용한다.
" se gfn=MesloLGS_NF:h12:cANSI:qDRAFT

if has("gui_running")
    "폰트 설정
    se gfn=D2Coding:h14:cHANGEUL:qDRAFT

    "Gvim 시작크기 설정
    au GUIEnter * winsize 120 50

    "Gvim 시작위치 설정
    au GUIEnter * winpos 0 0
endif
