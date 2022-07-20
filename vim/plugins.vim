call plug#begin('~/.vim/plugged')
" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Functionality
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/vim-easy-align'
Plug 'vhda/verilog_systemverilog.vim'

" Syntax highlight
Plug 'plasticboy/vim-markdown'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

" Goyo/Markdown
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" YCM
Plug 'ycm-core/YouCompleteMe'
function! BuildYCM(info)
	if a:info.status = 'installed' || a:info.force
		!./install.py --clangd-completer
	endif
endfunction

call plug#end()

let mapleader = "," " I think this is needed here

" Fixes alacritty ';' delimiter for these settings
" let &t_8f ="\<Esc>[38;2;%lu;%lu;%lu;%lum"
" let &t_8b ="\<Esc>[48;2;%lu;%lu;%lu;%lum"

" Colorschemes
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = '(hard)'
let ayucolor="dark" " 'dark' and 'light' and 'mirage'

" Easy align configuration
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Vim indent guidelines
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=black    ctermbg = 3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg = 4
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" YCM continued
noremap <silent> <leader>gl :YcmCompleter GoToDefinition<cr>
noremap <silent> <leader>gf :YcmCompleter FixIt<cr>
" Disable scratch window for YCM
set completeopt-=preview

" Tex stuff
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor = "latex"
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Ulti snips
let g:UltiSnipsExpandTrigger="<c-j>"

" colorscheme configuration
syntax on
let themes = ['ayu', 'nightfly']
execute 'colorscheme '.themes[localtime() % len(themes)]
unlet themes
" colorscheme ayu

" lightline configuration
set laststatus=2
let g:lightline = { 'colorscheme' : 'ayu' }
