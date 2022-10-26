call plug#begin('~/.vim/plugged')

" Functionality
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vhda/verilog_systemverilog.vim'
Plug 'preservim/nerdtree'
Plug 'plasticboy/vim-markdown'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'

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

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vim/vimrc \| :PlugUpdate<CR>

" YCM continued
noremap <silent> <leader>gl :YcmCompleter GoToDefinition<cr>
noremap <silent> <leader>gf :YcmCompleter FixIt<cr>
" Disable scratch window for YCM
set completeopt-=preview

" Ulti snips
let g:UltiSnipsExpandTrigger="<cr>"

" colorscheme configuration
syntax on
let themes = ['ayu', 'nightfly']
let theme = themes[localtime() % len(themes)]
unlet themes
execute 'colorscheme '.theme

" lightline configuration
set laststatus=2
let g:lightline = { 'colorscheme' : theme }

" NerdTree
" Open NerdTree if no session or file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
noremap <silent> <leader>go :NERDTree<cr>
" Mouse functionality
set mouse=n " breaks clicking on links in xterm in normal mode
let g:NERDTreeMouseMode=3

