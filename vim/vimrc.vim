set nocompatible

" --- General settings ---

set encoding=utf-8
set fileencoding=utf-8

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

set expandtab
set ts=4
set shiftwidth=4
set softtabstop=4

syntax on

set laststatus=2  " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode    " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(g:vim_plug_dir)

" Make sure you use single quotes

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'wincent/terminus'

for plugin in g:extra_plugins
    Plug plugin
endfor

" Initialize plugin system
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'luna'

" only show errors on the selected line
let g:ale_virtualtext_cursor = 'current'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

