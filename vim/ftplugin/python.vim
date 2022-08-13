set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
set errorformat=%f:%l:\ %m

" Python specific settings.
" setlocal tabstop=2
" setlocal softtabstop=2
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
let python_highlight_all=1

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
