set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

" Run script via Ctrl-Y
"nnoremap <C-Y> :w <bar> exec '!clear; python '.shellescape('%')<CR>
nnoremap <c-y> :w <bar> :AsyncRun -raw node %<CR>

" Run tests for current file with Ctrl-T
nmap <C-T> :w <bar> :!clear; node checks.js<CR>
