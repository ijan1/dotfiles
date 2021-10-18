set tabstop=2
set softtabstop=2
set shiftwidth=2
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" Enable manual folding
setlocal foldmethod=manual

" Do not fold comments
let c_no_comment_fold=1

" Function to start using folds, but only when I want
fu! StartFolds()
    set foldnestmax=1     " Only fold one level
    set foldmethod=indent " Use syntax to determine where to fold
endfu

nnoremap <silent> <leader>z :call StartFolds()<CR>

" Enable automatic saving of folding
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
