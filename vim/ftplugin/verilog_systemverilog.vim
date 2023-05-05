set makeprg=iverilog\ -y.\ -o\ %:r_output\ %:r_tb.v\ &&\ vvp\ %:r_output\ &&\ rm\ %:r_output\ &&\ gtkwave\ %:p:h/%:r_tb_results.vcd\ &&\ exit

set tabstop=4
set softtabstop=4
set shiftwidth=2
set textwidth=79
set expandtab
set autoindent

" Enable automatic saving of folding
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
