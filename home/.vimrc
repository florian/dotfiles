set nocompatible " Be Improved

" Plugin managment with Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wavded/vim-stylus'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'Lokaltog/vim-powerline'
Plugin 'lepture/vim-velocity'
Plugin 'mru.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ciaranm/detectindent'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-scripts/Toggle'
Plugin 'ap/vim-css-color'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kien/ctrlp.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'mileszs/ack.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mhinz/vim-startify'

call vundle#end()
filetype plugin indent on

" Basics
set mouse=a
set clipboard=unnamed
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noeb vb t_vb=  " Disable sound
set nojoinspaces   " No double space when joining lines
set whichwrap=b,s,[,],<,>,h,l " Allow cursor to wrap between lines
set showcmd
set shortmess+=I   " Hide Vim startup message
set autoread
set backspace=2

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
au VimResized * :wincmd = " Resize split when the terminal is resized

" File types
filetype off
filetype plugin indent on
au BufRead,BufNewFile,BufWrite,BufEnter *.json setf javascript
au BufRead,BufNewFile,BufWrite,BufEnter {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,Capfile,Guardfile,config.ru,.caprc,.irbrc,*.rake} setf ruby
au BufRead,BufNewFile,BufWrite,BufEnter .zsh/* setf zsh
au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", '`':'`'}

" Always open help in a new tab
:cabbrev help tab help
:cabbrev h tab help

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

" CtrlP config
let g:ctrlp_show_hidden=1

" Powerline config
let g:Powerline_colorscheme = 'solarized256'

" gitgutter config
let g:gitgutter_enabled = 1
highlight clear SignColumn

" Mapping
nmap <Space> :
map - <Leader>
map <C-7> :TComment
nnoremap <Tab> %
vnoremap <Tab> %

" Easier tab handling
" alt+t
nnoremap † :tabe<CR>
inoremap † <Esc>:tabe<CR>

" alt+w
nnoremap ∑ :tabc<CR>
inoremap ∑ <Esc>:tabc<CR>

" Changing the case
nmap <Leader>u gUl
nmap <leader>l gul

" Navigating in wrapped lines
if !exists('vimpager')
	nnoremap j gj
	nnoremap k gk
endif

map <Down> gj
map <Up> gk

" tmux integration
let g:tmux_is_last_pane = 0
au WinEnter * let g:tmux_is_last_pane = 0

" Like `wincmd` but also change tmux panes instead of vim windows when needed.
if !exists("*TmuxWinCmd")
	function TmuxWinCmd(direction)
  	  let nr = winnr()
  	  let tmux_last_pane = (a:direction == 'p' && g:tmux_is_last_pane)
  	  if !tmux_last_pane
    	" try to switch windows within vim
    	exec 'wincmd ' . a:direction
  	  endif
  	  " Forward the switch panes command to tmux if:
  	  " a) we're toggling between the last tmux pane;
  	  " b) we tried switching windows in vim but it didn't have effect.
  	  if tmux_last_pane || nr == winnr()
    	let cmd = 'tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR')
    	exec 'silent !'.cmd
    	redraw! " because `exec` fucked up the screen. why is this needed?? arrghh
    	let g:tmux_is_last_pane = 1
  	  else
    	let g:tmux_is_last_pane = 0
  	  endif
	endfunction
endif

" navigate between split windows/tmux panes
nmap <c-j> :call TmuxWinCmd('j')<cr>
nmap <c-k> :call TmuxWinCmd('k')<cr>
nmap <c-h> :call TmuxWinCmd('h')<cr>
nmap <c-l> :call TmuxWinCmd('l')<cr>
nmap <c-\> :call TmuxWinCmd('p')<cr>

" color the tabs
hi TabLine      guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel   guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=4 cterm=bold
hi TabLineFill  guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none

" change cursor in insert mode
" https://gist.github.com/andyfowler/1195581
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
