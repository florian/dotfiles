set nocompatible " Be Vi IMproved

" Plugin managment with Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-powerline'
Plugin 'lepture/vim-velocity'
Plugin 'mru.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ciaranm/detectindent'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-scripts/Toggle'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'osyo-manga/vim-over'
Plugin 'mkitt/tabline.vim'
Plugin 'xolox/vim-misc' " dependency for vim-session
Plugin 'xolox/vim-session'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'sickill/vim-pasta'
Plugin 'tommcdo/vim-lion'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'matze/vim-move'
Plugin 'mbbill/undotree'
Plugin 'junegunn/vim-peekaboo'
Plugin 'bogado/file-line'
Plugin 'vim-scripts/Align'
Plugin 'airblade/vim-rooter'

Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'wavded/vim-stylus'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'elzr/vim-json'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

" Basics
set mouse=a
set clipboard=unnamed
set laststatus=2              " Always show the statusline
if !has('nvim')               " Set by default by nvim
    set encoding=utf-8        " Necessary to show Unicode glyphs
endif
set noeb vb t_vb=             " Disable sound
set nojoinspaces              " No double space when joining lines
set whichwrap=b,s,[,],<,>,h,l " Allow cursor to wrap between lines
set showcmd
set shortmess+=I              " Hide Vim startup message
set autoread                  " Update Vim buffer when a file changed
set backspace=2               " Make backspace work like in other programs

                              " Color scheme
set background=dark
colorscheme tomorrow-night

" Layout stuff
syntax enable
set number
set cul                   " Highlight the current line
set textwidth=80
set scrolloff=5           " Scroll distance at the top / bottom
set wildmenu
au VimResized * :wincmd = " Resize split when the terminal is resized

" Color tabs
hi TabLine      guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=4 cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none

" File types
filetype off
filetype plugin indent on
autocmd BufWritePost .vimrc source % " Automatically reload .vimrc
au BufRead,BufNewFile,BufWrite,BufEnter {Gemfile,Rake,ZZfile,Vagrantfile,Thorfile,Procfile,Capfile,Guardfile,config.ru,.caprc,.irbrc,*.rake} setf ruby
au BufRead,BufNewFile,BufWrite,BufEnter *.zsh/* setf zsh
au BufRead,BufNewFile,BufWrite,BufEnter *.sqlite setf sql

" Delete all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Backup
set noswapfile
set nobackup

" Indentation
set smartindent
set autoindent
set noet ci pi sts=0 sw=4 ts=4 " Tabs, shown as 4 spaces
autocmd Filetype {ruby,yaml,javascript,singular} setlocal et sw=2 sts=2 " 2 spaces for Ruby and YAML
autocmd BufReadPost * :DetectIndent

" Search
set ignorecase
set incsearch " Search as you type
set gdefault  " Always use the g flag for search

" Matching
set matchpairs+=<:> " Make % work for <>

" splits
set splitbelow
set splitright

" change cursor in insert mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" --- Custom key mappings ---

nmap <Space> :
map - <Leader>
map ü :TComment<CR>
nnoremap <Tab> %
vnoremap <Tab> %
command! Rel so ~/.vimrc

" ö/ä for easy tab switching with a German keyboard
map ö gT
map ä gt

" Easier tab handling
" alt+t
nnoremap † :tabe<CR>
inoremap † <Esc>:tabe<CR>

" alt+w
nnoremap ∑ :tabc<CR>
inoremap ∑ <Esc>:tabc<CR>

" alt+s
nnoremap ‚ :w<CR>
inoremap ‚ <Esc>:tabc<CR>

" Changing the case
nmap <Leader>u gUl
nmap <leader>l gul

map <Down> gj
map <Up> gk

" Navigating in wrapped lines
if !exists('vimpager')
	nnoremap j gj
	nnoremap k gk
endif

command! NT NERDTreeTabsToggle
map § :NERDTreeTabsToggle<CR>

" Always open help in a new tab
:cabbrev h tab help
:cabbrev he help

" --- Other vim event system stuff ---

" Auto compile LaTeX when a file is saved
command! CompileLaTeX :! (pdflatex % &>/dev/null) &
au BufWritePost *.tex silent CompileLaTeX

" --- Plugin Configs ---

" Startify Plugin
let g:startify_list_order = [
  \ ['   Bookmarks:'],
  \ 'bookmarks',
  \ ['   LRU:'],
  \ 'files',
  \ ['   LRU within this dir:'],
  \ 'dir',
  \ ['   Sessions:'],
  \ 'sessions',
\ ]

let g:startify_bookmarks = [
	\ '~/.vimrc',
\ ]

" NERDTree config
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store', '\.git$', '\.pyc$']

if !exists("vimpager")
	let g:nerdtree_tabs_open_on_console_startup=1
endif

let g:nerdtree_tabs_autofind=1

" AutoPairs config
au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}

" CtrlP config
let g:ctrlp_show_hidden=1
map <C-p> :CtrlP<CR>

" YankRing config
map _ :YRShow<CR>
let g:yankring_replace_n_pkey = 'π' " alt+p
let g:yankring_replace_n_nkey = '•' " alt+u

" Powerline config
let g:Powerline_colorscheme = 'solarized256'

" gitgutter config
let g:gitgutter_enabled = 1
highlight clear SignColumn

" vim session manager
let g:session_autosave = 'no'

" vim-move
let g:move_key_modifier = 'M'

" vim-latex-live-preview
let g:livepreview_previewer = 'open -a Skim'
autocmd Filetype tex setl updatetime=1000
command! Latex LLPStartPreview

" Align plugin
map <Leader>i <Plug>AM_tt " Just to silent the error message

" LaTeX stuff

ia itemize \begin{itemize}<CR>\end{itemize}<ESC>ko\item<ESC>>>A
ia ii \item
