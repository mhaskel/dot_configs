set nocompatible

set autoindent
set autoread
set backspace=indent,eol,start
"set bg=dark
set complete-=i
set encoding=utf-8
set expandtab
set fileformats+=mac
set laststatus=2
set laststatus=2
set nrformats-=octal
set ruler
set shiftround
set shiftwidth=2
set showcmd
set showmatch
set smarttab
set softtabstop=2
set tabstop=2
set ttimeout
set ttimeoutlen=50
set wildmenu

syntax on
"colorscheme base16-ocean
"colorscheme solarized
"colo Tomorrow
"set background=light
let g:hybrid_use_iTerm_colors = 1
let g:hybrid_reduced_contrast = 1
colorscheme hybrid


filetype plugin indent on

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

:let ruby_space_errors = 1
let g:syntastic_check_on_open=1

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set colorcolumn=80
