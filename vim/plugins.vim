call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

function! BuildYCM(info)
	if a:info.status = 'installed' || a:info.force
		!./install.py --clang-completer --racer-completer
	endif
endfunction

if has('vim')
	Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM;) }
endif
call plug#end()
