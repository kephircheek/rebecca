" fast jump over document
nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap <c-h> ^
nnoremap <c-l> $
nnoremap <c-u> gg
nnoremap <c-d> G

" fast switch tab
nnoremap <s-j> gt
nnoremap <s-k> gT

" fast save
nmap <c-s> :w<CR>

" fast exit
nmap <c-q> :wq<CR>

" exec sh files via Ctrl + Y
autocmd filetype sh nnoremap <C-Y> :w <bar> exec '!clear; source '.shellescape('%')<CR>

" folding
nnoremap <space> za
vnoremap <Space> zf

" goto defenition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Standard CLI commands in vim command line
cnoremap <C-A> <Home>
