if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'

" Syntax
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'w0rp/ale'
Plug 'hdima/python-syntax'

" Color
Plug 'NLKNguyen/papercolor-theme'

" Search by CTRL-P
Plug 'kien/ctrlp.vim'

" Git
"" command like `Gwrite/Gcommit`
Plug 'tpope/vim-fugitive'
"" shows a git diff in the sign column
Plug 'airblade/vim-gitgutter'

" File manager
Plug 'vifm/vifm.vim'
Plug 'tpope/vim-eunuch'

" Status line
Plug 'itchyny/lightline.vim'

" Autocomplete
" Plug 'vim-surround'
Plug 'Valloric/YouCompleteMe'
" brew install cmake macvim python
" brew install mono go nodejs
" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --all

" Asyncrun
Plug 'skywind3000/asyncrun.vim'

" ...
call plug#end()
