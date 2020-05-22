set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set textwidth=79  
set expandtab  
set autoindent 
set fileformat=unix 

" see the docstrings for folded code
let g:SimpylFold_docstring_preview=1

" extended the available linters for Python files
let b:ale_linters = ['pyflakes', 'flake8', 'pylint']
let g:ale_fixers = { '*': ['trim_whitespace'] }
let g:ale_fix_on_save = 1

" auto open qickwindow with fix hight 
let g:asyncrun_open = 25

" delete spaces in the end of line 
" autocmd BufWritePre * :%s/\s\+$//e

" Run script via Ctrl-Y
"nnoremap <C-Y> :w <bar> exec '!clear; python '.shellescape('%')<CR>
nnoremap <c-y> :w <bar> :AsyncRun -raw python %<CR>

" Run tests via Ctrl-T
nnoremap <C-T> :w <bar> exec '!clear; python -m unittest discover tests/'<CR>


" --- Tips ---
" - Docstring with python autocomplete by Ctrl-x Ctrl-o
