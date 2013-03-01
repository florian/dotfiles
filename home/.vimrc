" Plugin managment with vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kchmck/vim-coffee-script'
Bundle 'wavded/vim-stylus'
Bundle 'mattn/zencoding-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'ervandew/supertab'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'Lokaltog/vim-powerline'
Bundle 'lepture/vim-velocity'
Bundle 'mru.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'ciaranm/detectindent'
Bundle 'tpope/vim-eunuch'

" Basics
set mouse=a
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noeb vb t_vb=  " Disable sound

" Color scheme
set background=dark
colorscheme solarized

" Layout stuff
syntax enable
set number
set cul " Highlight the current line
set textwidth=80
set scrolloff=5 " Scroll distance at the top / bottom
set wildmenu

"File types
filetype off
filetype plugin indent on

" Backup
set noswapfile 
set nobackup

" Indentation
set smartindent
set autoindent
autocmd BufReadPost * :DetectIndent

" Search
set smartcase " Case sensitive when uppercase is present
set incsearch " Search as you type

" Matching
set matchpairs+=<:>

" NERDTree config
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=1

" CtrlP config
let g:ctrlp_show_hidden=1

" Powerline config
let g:Powerline_colorscheme = 'solarized256'

" Mapping
map <C-7> :TComment
