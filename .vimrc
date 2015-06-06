
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ignorecase
set smartcase

" Only set cursorline and colourcolumn on the current window "
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline|setlocal cc=80
    au WinLeave * setlocal nocursorline|setlocal cc=0
augroup END

set nowrap

set hlsearch

" Create new split windows *after* the current one "
set splitbelow
set splitright

" Always show the status line "
set laststatus=2

" Search upwards for ctags file "
set tags=./tags;/

command! Tgenerate execute ":!ctags -R"

" Fix mouse wheel behaviour in urxvt "
set mouse=a

" Use ant for project builds by default; search upwards for build.xml "
set makeprg=ant\ -s\ build.xml\ $*

" Default to recursive grepping inside vim "
"" set grepprg=grep\ -rnI\ --exclude=tags\ $*\ .
set grepprg=ack-grep\ --smart-case\ $*

" Use bash login but don't run .bashrc (avoids recursive virtualenv problem) "
set shell=/bin/bash\ --login\ --norc

" Use friendlier autocompletion "
set wildmenu
set wildmode=list:full
set wildignore+=*.pyc,*.swp

" Allow buffers with changes to be hidden "
set hidden

set updatetime=250

map <leader>m :make<Up><cr><cr>

" Tab and window switching, the easy way. "
map [5^ :wincmd W<cr>
map! [5^ :wincmd W<cr>
map [6^ :wincmd w<cr>
map! [6^ :wincmd w<cr>

map [5@ :tabprev<cr>
map! [5@ :tabprev<cr>
map [6@ :tabnext<cr>
map! [6@ :tabnext<cr>

map [7^ :bprev<cr>
map! [7^ :bprev<cr>
map [8^ :bnext<cr>
map! [8^ :bnext<cr>

" Close a file without losing the window layout "

command! Close execute ":b#<bar>bd#<bar>bp<bar>bn"
command! BD execute ":b#<bar>bd#<bar>bp<bar>bn"
command! BW execute ":b#<bar>bw#<bar>bp<bar>bn"

" Quickly get rid of search highlighting. "

map <leader>/ :nohls<cr>

map ]] :cn<cr>
map [[ :cp<cr>

autocmd QuickFixCmdPost * nested copen 5


" Nicer ways to get out of insert mode? "
"" inoremap <CR> <ESC>l
map <ESC>; :
map! <ESC>; <ESC>:
map [29~ i
imap [29~ <ESC>l

set title
set titlestring=%{$TERM_TITLE}\ %t\ %m\ (%f)\ -\ VIM!

" TODO: why won't rxvt let me map shift-enter/ctrl-enter? "

source $HOME/.vim/rc/$HOSTNAME.vim
