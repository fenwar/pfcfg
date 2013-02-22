
set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ignorecase
set smartcase
hi ColorColumn ctermbg=236
""set cc=80
hi MatchParen ctermfg=yellow cterm=bold ctermbg=18

hi CursorLine cterm=None ctermbg=17
" Only set cursorline on the current window "
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline|setlocal cc=80
    au WinLeave * setlocal nocursorline|setlocal cc=0
augroup END
""set cursorline
" Change cursorline colour when in insert mode "
autocmd InsertEnter * hi CursorLine cterm=None ctermbg=52
autocmd InsertLeave,CursorMoved,CmdwinEnter * hi CursorLine cterm=None ctermbg=17

set nowrap
hi VertSplit ctermfg=233 ctermbg=233 cterm=None
hi StatusLine ctermfg=236 ctermbg=11 cterm=reverse,bold,italic
hi StatusLineNC ctermfg=233 ctermbg=106 cterm=reverse,italic
hi Pmenu ctermfg=242 ctermbg=0 cterm=italic
hi PmenuSel ctermfg=253 ctermbg=22 cterm=italic
hi TabLine cterm=Bold,Italic ctermbg=233 ctermfg=106
hi TabLineSel cterm=Bold,Italic ctermbg=none ctermfg=11
hi TabLineFill cterm=Italic ctermbg=233 ctermfg=106

hi Constant ctermfg=131
hi Comment ctermfg=69 cterm=None
hi Directory ctermfg=69 cterm=None
hi Todo term=bold ctermfg=11 ctermbg=none

hi ModeMsg cterm=bold ctermbg=52 ctermfg=11

set hlsearch
hi Search ctermfg=None ctermbg=20

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

" NERDTree stuff "
let NERDTreeIgnore=['\.pyc$']
map <leader>q :NERDTree<cr>
map <leader>Q :NERDTreeToggle<cr>
map <leader>r :setlocal nocursorline<cr>:setlocal cc=0<cr>:NERDTreeFind<cr>:setlocal cursorline<cr>

" LustyExplorer triggers "
map <leader>b :LustyBufferExplorer<cr>
map <leader>h :LustyFilesystemExplorer<cr>
map <leader>f :LustyFilesystemExplorerFromHere<cr>

hi LustySelected ctermfg=3 ctermbg=17

" Taglist triggers "
map <leader>t :TlistOpen<cr>
map <leader>T :TlistClose<cr>

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
