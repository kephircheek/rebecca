" Highlight search items
set hlsearch
set number

" Colors
set background=dark
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   },
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }

" Relative number in visual mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

" create TMUX status line
let g:tmuxline_theme = 'lightline'
let g:tmuxline_separators = {
    \ 'left'      : '',
    \ 'left_alt'  : '|',
    \ 'right'     : '',
    \ 'right_alt' : '|',
    \ 'space'     : ' '}
let g:tmuxline_preset = {
	\ 'a'    : '#S',
	\ 'b'    : '#(whoami)',
	\ 'win'  : ['#I', '#W'],
	\ 'cwin' : '#W',
	\ 'x'    : '#(ssh_status)',
	\ 'y'    : ['%a %d', '%b', '%R'],
	\ 'z'    : '#H'}

" --- LIGHTLINE ---
set laststatus=2

let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'gitstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead',
	\   'filename': 'LightlineFilename',
	\  	'gitstatus': 'GitStatus'
	\ },
	\ 'colorscheme': 'PaperColor',
	\ }

function! LightlineFilename()
	return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
		  \ &filetype ==# 'unite' ? unite#get_status_string() :
		  \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
		  \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"Link color of number column to color of sign column
autocmd ColorScheme * highlight! link SignColumn LineNr
autocmd ColorScheme * highlight! link SyntasticErrorSign LineNr
autocmd ColorScheme * highlight! link SyntasticWarningSign LineNr
autocmd ColorScheme * highlight! link SyntasticStyleErrorSign LineNr
autocmd ColorScheme * highlight! link SyntasticStyleWarningSign LineNr
