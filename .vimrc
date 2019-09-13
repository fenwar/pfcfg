" Some defaults taken from the Debian configuration:
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing
set ruler

" My config:
set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

set ignorecase
set smartcase
set incsearch

set history=1000
set viminfo='1000,<200,s10,h

hi ColorColumn ctermbg=236 guibg=Grey10
""set cc=80
hi MatchParen ctermfg=yellow cterm=bold ctermbg=233

hi CursorLine cterm=None ctermbg=17 guibg=DarkBlue
" Only set cursorline on the current window "
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline|setlocal cc=80
    au WinLeave * setlocal nocursorline|setlocal cc=0
augroup END
""set cursorline
" Change cursorline colour when in insert mode "
autocmd InsertEnter * hi CursorLine cterm=None ctermbg=52 guibg=DarkRed
autocmd InsertLeave,CursorMoved,CmdwinEnter * hi CursorLine cterm=None ctermbg=17 guibg=DarkBlue

set nowrap
set linebreak
set numberwidth=5

" When auto-formatting, use 78 columns. "
" set textwidth=78 "

" UI Highlighting "
hi VertSplit ctermfg=22 ctermbg=22 cterm=None
hi LineNr ctermfg=235 ctermbg=233 cterm=None
hi CursorLineNr ctermfg=236 ctermbg=17 cterm=None
hi StatusLine ctermfg=22 ctermbg=11 cterm=reverse,bold,italic
hi StatusLineNC ctermfg=22 ctermbg=106 cterm=reverse,italic
hi Pmenu ctermfg=242 ctermbg=0 cterm=italic
hi PmenuSel ctermfg=253 ctermbg=22 cterm=italic
hi TabLine cterm=None ctermbg=57 ctermfg=15
hi TabLineSel cterm=Bold ctermbg=19 ctermfg=11
hi TabLineFill cterm=None ctermbg=57 ctermfg=15

hi ModeMsg cterm=bold ctermbg=52 ctermfg=11
hi Visual cterm=reverse ctermfg=7 ctermbg=None

set hlsearch
hi Search ctermfg=None ctermbg=20

" Syntax Highlighting "
hi Constant ctermfg=155
hi Comment ctermfg=81 cterm=None
hi Directory ctermfg=69 cterm=None
hi Todo term=bold ctermfg=11 ctermbg=none
hi Statement ctermfg=166
hi Type ctermfg=225

" Highlight trailing whitespace "      
    
hi TrailingWhiteSpace ctermbg=52 ctermfg=None
match TrailingWhiteSpace /\s\+$/
set listchars=eol:¶,tab:»\ ,trail:·,nbsp:·
hi nontext ctermfg=238
hi specialkey ctermfg=238

" Fix diff colours "
hi DiffAdd ctermbg=28 cterm=bold ctermfg=None
hi DiffDelete ctermbg=52 cterm=italic ctermfg=None
hi DiffChange cterm=None ctermbg=None
hi DiffText ctermbg=94 cterm=bold ctermfg=None

" Create new split windows *after* the current one "
set splitbelow
set splitright
set noequalalways

" Always show the status line "
set laststatus=2

" Search upwards for ctags file "
set tags=./tags;/

command! Tgenerate execute ":!ctags -R"

command! -range Ghurl call GitHubUrl("%", "<line1>", "<line2>")
fun! GitHubUrl(file, startline, endline)
    execute "!echo $(gh_url.sh " . a:file . " " . a:startline . " " . a:endline . ")"
    redraw!
endfun

command! -range Ghjump call GitHubJump("%", "<line1>", "<line2>")
fun! GitHubJump(file, startline, endline)
    silent execute "!x-www-browser $(gh_url.sh " . a:file . " " . a:startline . " " . a:endline . ") &>/dev/null"
    redraw!
endfun

" Fix mouse wheel behaviour in urxvt "
set mouse=a
noremap <LeftDrag> <LeftMouse>
noremap! <LeftDrag> <LeftMouse>

" Use ant for project builds by default; search upwards for build.xml "
set makeprg=ant\ -s\ build.xml\ $*

" Default to recursive grepping inside vim "
"" set grepprg=grep\ -rnI\ --exclude=tags\ $*\ .
set grepprg=ack\ --smart-case\ -H\ $*

" Use bash login but don't run .bashrc (avoids recursive virtualenv problem) "
set shell=/bin/bash\ --login\ --norc

" Use friendlier autocompletion "
set wildmenu
set wildmode=list:full
set wildignore+=*.pyc,*.swp

" Grep word accelerator "
map <leader>w :grep "\\b\\b"<cr>

" Allow buffers with changes to be hidden "
set hidden

set updatetime=250

map <leader>m :make<Up><cr><cr>

" Tab and window switching, the easy way... "
" CTRL + PGUP/PGDN : next/prev window "
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

" Buffer switching, the slightly more Vimmish way... "

map gb :bn<cr>
map gB :bp<cr>

" Check all buffers for updates on disk "

map <F5> :bufdo checktime<cr>

" Close a file without losing the window layout "

command! Close execute ":b#<bar>bd#<bar>bp<bar>bn"
command! BD execute ":b#<bar>bd#<bar>bp<bar>bn"
command! BW execute ":b#<bar>bw#<bar>bp<bar>bn"

" Quickly get rid of search highlighting. "

map <leader>/ :nohls<cr>

map ]] :cn<cr>
map [[ :cp<cr>

autocmd QuickFixCmdPost * nested copen 10


" Nicer ways to get out of insert mode? "
"" inoremap <CR> <ESC>l
map <ESC>; :
map! <ESC>; <ESC>:
map [29~ i
imap [29~ <ESC>l

set title
set titlestring=%{$TERM_TITLE}\ %t\ %m\ (%f)\ -\ VIM!


" Pylint "

au FileType python set makeprg=python\ -m\ flake8\ --exclude=legacy,migrations,message_catalogue.py\ --max-line-length=120\ %:p
" au FileType python set efm=%A%f:%l:\ [%t%n%.%#]\ %m,%Z%p^^,%-C%.%#"

" gvim defaults "
if has("gui_running")
    set co=120
    set lines=30
    " set guifont=Source\ Code\ Pro\ 9
    set guifont=Ubuntu\ Mono\ 12
    colorscheme murphy
    set guioptions-=m
    set guioptions-=T
    " This is mainly going to be used from Pentadactyl, so: "
    set wrap
    set colorcolumn=0
    hi ColorColumn ctermbg=236 guibg=Grey10
endif

"==========="
" Command-T "
"==========="
let g:CommandTMaxCachedDirectories=4
let g:CommandTMaxHeight=20
let g:CommandTMinHeight=5
let g:CommandTMatchWindowReverse=1
let g:CommandTClearMap=['<C-u>']
let g:CommandTCancelMap=['<C-c>', '<Esc>']
hi PFCommandTHighlightColor cterm=bold ctermbg=28 ctermfg=11
let g:CommandTHighlightColor='PFCommandTHighlightColor'
let g:CommandTScanDotDirectories=1
let g:CommandTFileScanner='find'
let g:CommandTWildIgnore=&wildignore . ",.git/*,.venv/*,*/dist/*,*/src/static/*,*/target/*,*/dist-*/*,*/node_modules/*,*/src-copy/*,*/docs/*,*.png"
let g:CommandTTagIncludeFilenames=1
let g:CommandTInputDebounce=2

map <F1> :CommandTHelp<cr>
" Ctrl-B    CmdT buffers
map <C-b> <C-c>:CommandTBuffer<cr>
" Ctrl-F    CmdT files, prefixed with current buffer's dir (hack implementation below)
map <C-f> :CmdTCurDir<cr>Q
" Ctrl-G    CmdT tags
map <C-g> <Plug>(CommandTTag)
" Ctrl-H    :browse oldfiles (I would love to replace this with a CmdT persistent MRU)
map <C-h> :bro ol<cr>
" Ctrl-J    CmdT jump
map <C-j> <C-c>:CommandTJump<cr>
" Ctrl-K    CmdT buffers but in MRU order
map <C-k> <C-c>:CommandTMRU<cr>
" Ctrl-L    CmdT lines
map <C-l> <C-c>:CommandTLine<cr>
" Ctrl-T    CmdT files (default behaviour)
map <C-t> <C-c>:CommandT<cr>

" Very hacky way of starting CommandT with the buffer's parent directory
" already entered, which gives us the closest thing to LustyExplorerHere
" Temporarily map `Q` to press the keys to open Command-T and type the buffer's
" directory in. Bind this as `:CmdTCurDir<cr>Q` so it executes immediately.
command! CmdTCurDir call CmdTCurDir()
fun! CmdTCurDir()
    let bcwd=expand("%:h")
    let execmd=":CommandT<cr>".bcwd
    let mapcmd=":map Q :CommandT<cr>".bcwd."/"
    execute mapcmd
endfun






" Change cursor shape when in insert mode "
" solid underscore
let &t_SI .= "\<Esc>[3 q"
" solid block
let &t_EI .= "\<Esc>[1 q"

"set background=dark
"colorscheme solarized
