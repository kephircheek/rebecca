let g:go_doc_keywordprg_enabled = 0
let g:go_def_mapping_enabled=0  " free <c-t>
let g:asyncrun_open = 25

" Run script via Ctrl-Y
nnoremap <c-y> :w <bar> :AsyncRun -raw go run %<CR>

" Run tests for current file with Ctrl-T
nmap <c-t> :w <bar> :!clear; go test -v %:p:h<CR>
