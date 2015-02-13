set nocompatible

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'bling/vim-airline'
NeoBundle 'godlygeek/tabular'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'spolu/dwm.vim'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'rainerborene/vim-reek'

" Colors.
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'tomasr/molokai'
"NeoBundle 'gregstallings/vim-greyhouse'
NeoBundle 'john2x/flatui.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/mayansmoke'
NeoBundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
NeoBundle 'ChasingLogic/ChasingLogic-colorscheme-vim'
NeoBundle 'atelierbram/vim-colors_atelier-schemes'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'noahfrederick/vim-noctu'
NeoBundle 'twerth/ir_black'
NeoBundle 'w0ng/vim-hybrid'

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

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

:let ruby_space_errors = 1
let g:syntastic_check_on_open=1

nmap <F8> :TagbarToggle<CR>

nmap \p :set paste!<CR>
nmap ; :CtrlPBuffer<CR>

noremap <Leader>pry orequire'pry';binding.pry<Esc>
noremap <Leader>PRY Orequire'pry';binding.pry<Esc>

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline_theme='hybrid'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1

let g:tagbar_ctags_bin ='/opt/boxen/homebrew/bin/ctags'
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

set colorcolumn=80
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
