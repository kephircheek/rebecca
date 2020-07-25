" fast switch buffer
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" fast switch tab
nnoremap <s-j> gt
nnoremap <s-K> gT

" exec sh files via Ctrl + Y
autocmd filetype sh nnoremap <C-Y> :w <bar> exec '!clear; source '.shellescape('%')<CR>

" folding
nnoremap <space> za
vnoremap <Space> zf

" goto defenition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
