syntax on
filetype plugin indent on

"tabs and indentation
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent smartindent

vnoremap <C-y> "+y
autocmd BufWritePost *.tex !pdflatex <afile>
