call plug#begin('~/.vim/plugged')
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Functionality
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/vim-easy-align'

" Syntax highlight
Plug 'plasticboy/vim-markdown'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

" Goyo/Markdown
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" YCM
Plug 'ycm-core/YouCompleteMe'
function! BuildYCM(info)
	if a:info.status = 'installed' || a:info.force
		!./install.py --clang-completer --racer-completer
	endif
endfunction

" Fixes alacritty ';' delimiter for these settings
let &t_8f ="\<Esc>[38;2;%lu;%lu;%lu;%lum"
let &t_8b ="\<Esc>[48;2;%lu;%lu;%lu;%lum"

" Colorscheme
set termguicolors
set bg=dark
let g:gruvbox_contrast_dark = '(hard)'
let ayucolor="dark" " 'dark' and 'light' and 'mirage'


call plug#end()
