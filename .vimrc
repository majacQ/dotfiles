" Vim
" ===

" Source ~/.vimrc.before if it exists
if filereadable(expand('~/.vimrc.before'))
  source ~/.vimrc.before
endif

set nocompatible               " be iMproved
filetype off                   " required!

" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'andyl/vim-textobj-elixir'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'epmatsw/ag.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'gcmt/wildfire.vim'
Plug 'godlygeek/tabular'
Plug 'inside/vim-textobj-jsxattr'
Plug 'jayflo/vim-skip'
Plug 'jiangmiao/auto-pairs'
Plug 'jparise/vim-graphql'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-github-dashboard'
Plug 'justinmk/vim-gtfo'
Plug 'kana/vim-textobj-user'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mxw/vim-jsx'
Plug 'reedes/vim-textobj-sentence'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tek/vim-textobj-ruby'
Plug 'tmux-plugins/vim-tmux'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/gem.vim'
Plug 'w0rp/ale'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'pengwynn/jsgf.vim', { 'branch': 'enhancemen-ts' }
Plug 'metakirby5/codi.vim'
call plug#end()


" Per-directory .vimrc files
set exrc
set secure

" Syntax
" ======

syntax on
syntax enable
set t_Co=256

" General Config
" ==============

let mapleader='\'
set gfn=Menlo:h14
set encoding=utf-8
set number                      " Line numbers are good
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set laststatus=2                " Always show status line
set clipboard=unnamed           " Use system clipboard
set hidden                      " Buffers can exist in the background
set splitright                  " Opens vertical split right of current window
set splitbelow                  " Opens horizontal split below current window
"set shortmess=filnxtToOI       " see :help shortmess
                                " http://items.sjbach.com/319/configuring-vim-right
" tmux nav

" Mouse
" ======

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Search Settings
" ===============

set incsearch        " Find the next match as we type the search
set hlsearch         " Hilight searches by default
set viminfo='100,f1  " Save up to 100 marks, enable capital marks

" Turn Off Swap Files
" ===================

set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Persistent Undo
" ===============

" Keep undo history across sessions, by storing in file
" Only works in MacVim (gui) mode
if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
  " Hide the toolbar
  set guioptions-=T
endif

" Indentation and Display
" =======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set nowrap                            " Don't wrap lines
set linebreak                         " Wrap lines at convenient points

" Folds
" =====

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Don't fold by default

" Completion
" ==========

"set wildmode=list:longest
set wildmode=longest,list,full
set wildmenu                    " Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
set wildignore+=*vim/backups*

" Scrolling
" =========

" Start scrolling when we're getting close to margins
set scrolloff=10
set sidescrolloff=15
set sidescroll=1

" Status Line
" ===========

set statusline=                                 " Override default
set statusline+=%{fugitive#statusline()[4:-2]}  " Show fugitive git info
set statusline+=\ %f\ %m\ %r                    " Show filename/path
set statusline+=%=                              " Set right-side status info after this line
set statusline+=%l/%L:%v                        " Set <line number>/<total lines>:<column>
set statusline+=\                               " Set ending space

let base16colorspace=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" NERDTree
" ========
function! ShowFileInNERDTree()
  if exists("t:NERDTreeBufName")
    NERDTreeFind
  else
    NERDTree
    wincmd l
    NERDTreeFind
  endif
endfunction
map <leader>r :call ShowFileInNERDTree()<cr>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeIgnore=['node_modules$[[dir]]']

" Git Gutter
" ==========
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" GH Dashboard
" ==========
let g:github_dashboard = { 'username': 'pengwynn', 'password': $GITHUB_TOKEN }

" JSX in .js files
" ==========
let g:jsx_ext_required = 0

" Searching
" ==========
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" Committing
" =========
"
" BufRead seems more appropriate here but for some reason the final `wincmd p` doesn't work if we do that.
autocmd VimEnter COMMIT_EDITMSG call OpenCommitMessageDiff()
function OpenCommitMessageDiff()
  " Save the contents of the z register
  let old_z = getreg("z")
  let old_z_type = getregtype("z")

  try
    call cursor(1, 0)
    let diff_start = search("^diff --git")
    if diff_start == 0
      " There's no diff in the commit message; generate our own.
      let @z = system("git diff --cached -M -C")
    else
      " Yank diff from the bottom of the commit message into the z register
      :.,$yank z
      call cursor(1, 0)
    endif

    " Paste into a new buffer
    vnew
    normal! V"zP
  finally
    " Restore the z register
    call setreg("z", old_z, old_z_type)
  endtry

  " Configure the buffer
  set filetype=diff noswapfile nomodified readonly
  silent file [Changes\ to\ be\ committed]

  " Get back to the commit message
  wincmd p
endfunction

" " Completion
" " ==========
" " Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_highlighting = 0
" " Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
