let mapleader = "," " I think this is needed here

call plug#begin('~/.vim/plugged')
" Functionality
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'vhda/verilog_systemverilog.vim'
" Plug 'preservim/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'triglav/vim-visual-increment'

Plug 'jasonccox/vim-wayland-clipboard'

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'morhetz/gruvbox'

" Verible
 "Plug 'prabirshrestha/vim-lsp'
 "Plug 'chipsalliance/verible'

" Snippets
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" Copilot
" Plug 'github/copilot.vim'

" YCM
Plug 'ycm-core/YouCompleteMe'
function! BuildYCM(info)
	if a:info.status = 'installed' || a:info.force
		!./install.py --clangd-completer --rust-completer
	endif
endfunction
call plug#end()

" if executable('verible-verilog-ls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'verible-verilog-ls',
"         \ 'cmd': {server_info->['verible-verilog-ls']},
"         \ 'allowlist': ['verilog', 'systemverilog'],
"         \ })
" endif

let g:ycm_max_diagnostics_to_display = 50
let g:ycm_echo_current_diagnostic = 'virtual-text'
let g:ycm_update_diagnostics_in_insert_mode = 0

"let g:ycm_enable_inlay_hints = 1
let g:ycm_clear_inlay_hints_in_insert_mode = 1

let g:ycm_clangd_uses_ycmd_caching = 1
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_clangd_args = ['-log=verbose', '-pretty',
			\'--clang-tidy', '--enable-config', '--header-insertion=never']

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
			\ 'concept':   'Normal',
			\}
for tokenType in keys( MY_YCM_HIGHLIGHT_GROUP )
  call prop_type_add( 'YCM_HL_' . tokenType,
                    \ { 'highlight': MY_YCM_HIGHLIGHT_GROUP[ tokenType ] } )
endfor

noremap <silent> <leader>gl :YcmCompleter GoToDefinition<cr>
noremap <silent> <leader>gf :YcmCompleter FixIt<cr>
noremap <silent> <leader>gh <Plug>(YCMToggleInlayHints)

nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
nmap <leader>D   <Plug>(YCMHover)
" Disable scratch window for YCM
set completeopt-=preview

"Toggle YouCompleteMe on and off with F3
function Toggle_ycm()
    if g:ycm_show_diagnostics_ui == 0
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui = 1
        :YcmRestartServer
        :e
        :echo "YCM on"
    elseif g:ycm_show_diagnostics_ui == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui = 0
        :YcmRestartServer
        :e
        :echo "YCM off"
    endif
endfunction
map <F3> :call Toggle_ycm() <CR>

" unfortunately, ultisnips doesn't really play too well with ycm
" let g:UltiSnipsExpandTrigger = "<C-J>"

" fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
noremap <silent> <leader>go : Files<cr>
noremap <silent> <leader>gg : GFiles<cr>

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

" NerdTree
" Open NerdTree if no session or file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
" noremap <silent> <leader>go :NERDTree<cr>

" Mouse functionality
" set mouse=n " breaks clicking on links in xterm in normal mode
" let g:NERDTreeMouseMode=3

" Snippets
let g:UltiSnipsExpandTrigger="<enter>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" let g:UltiSnipsSnippetsDir="~/.vim/snips"
let g:UltiSnipsSnippetDirectories = ['UltiSnips']

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
