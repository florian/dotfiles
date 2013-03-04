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
set nojoinspaces   " No double space when joining lines
set whichwrap=b,s,[,],<,>,h,l " Allow cursor to wrap between lines
set showcmd
set shortmess+=I   " Hide Vim startup message

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

" File types
filetype off
filetype plugin indent on
au BufRead,BufNewFile,BufWrite *.json setf javascript
au BufRead,BufNewFile,BufWrite {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Capfile,Guardfile,config.ru,.caprc,.irbrc,*.rake} setf ruby

" Backup
set noswapfile 
set nobackup

" Indentation
set smartindent
set autoindent
set noet ci pi sts=0 sw=4 ts=4 " Tabs, shown as 4 spaces
autocmd Filetype {ruby,yaml} setlocal et sw=2 sts=2 " 2 spaces for Ruby and YAML
autocmd BufReadPost * :DetectIndent

" Search
set ignorecase
set incsearch " Search as you type
set gdefault  " Always use the g flag for search

" Matching
set matchpairs+=<:>

" NERDTree config
let NERDTreeShowHidden=1

" CtrlP config
let g:ctrlp_show_hidden=1

" Powerline config
let g:Powerline_colorscheme = 'solarized256'

" Mapping
map <C-7> :TComment
nmap <space> :
nnoremap <tab> %
vnoremap <tab> %

" Navigating in wrapped lines
map j gj
map k gk
map <down> gj
map <up> gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
