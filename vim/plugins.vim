let mapleader = "," " I think this is needed here

call plug#begin('~/.vim/plugged')
" Functionality
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vhda/verilog_systemverilog.vim'
" Plug 'preservim/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'triglav/vim-visual-increment'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" YCM
Plug 'ycm-core/YouCompleteMe'
function! BuildYCM(info)
	if a:info.status = 'installed' || a:info.force
		!./install.py --clangd-completer --rust-completer
	endif
endfunction
" Let clangd fully control code completion
call plug#end()

let g:ycm_max_diagnostics_to_display = 50
"let g:ycm_enable_inlay_hints = 1
"let g:ycm_clear_inlay_hints_in_insert_mode = 1
let g:ycm_echo_current_diagnostic = 'virtual-text'
let g:ycm_update_diagnostics_in_insert_mode = 0

let g:ycm_clangd_uses_ycmd_caching = 1
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty',
			\'--clang-tidy', '--enable-config']

let g:ycm_enable_semantic_highlighting=1
let MY_YCM_HIGHLIGHT_GROUP = {
			\ 'typeParameter': 'PreProc',
			\
			\ 'variable':   'Normal',
			\ 'parameter':  'Normal',
			\ 'property':   'Normal',
			\ 'enumMember': 'Normal',
			\
			\ 'function': 'Normal',
			\ 'method':   'Normal',
			\
			\ 'enum':      'Normal',
			\ 'namespace': 'Normal',
			\ 'class':     'Normal',
			\ 'struct':    'Normal',
			\
			\}
for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
  call prop_type_add( 'YCM_HL_' . tokenType,
                    \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
endfor

nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)

" Colorschemes
syntax on
set termguicolors
set background=dark
let g:gruvbox_contrast_dark = '(hard)'
let ayucolor="dark" " 'dark' and 'light' and 'mirage'
let themes = ['ayu', 'nightfly', 'gruvbox']
" let theme = themes[localtime() % len(themes)]
let theme = 'ayu'
unlet themes
execute 'colorscheme '.theme

" lightline configuration
set laststatus=2
let g:lightline = { 'colorscheme' : theme }

" Easy align configuration
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" YCM continued
noremap <silent> <leader>gl :YcmCompleter GoToDefinition<cr>
noremap <silent> <leader>gf :YcmCompleter FixIt<cr>
" Disable scratch window for YCM
set completeopt-=preview

" Ulti snips
let g:UltiSnipsExpandTrigger="<cr>"

" colorscheme configuration
noremap <silent> <leader>go : Files<cr>
noremap <silent> <leader>gg : Files<cr>

" NerdTree
" Open NerdTree if no session or file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" noremap <silent> <leader>go :NERDTree<cr>

" Mouse functionality
set mouse=n " breaks clicking on links in xterm in normal mode
let g:NERDTreeMouseMode=3

