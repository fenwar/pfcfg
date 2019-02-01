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

" NERDTree stuff "
let NERDTreeIgnore=['\.pyc$']
map <leader>q :NERDTree<cr>
map <leader>Q :NERDTreeToggle<cr>
map <leader>r :setlocal nocursorline<cr>:setlocal cc=0<cr>:NERDTreeFind<cr>:setlocal cursorline<cr>

" LustyExplorer triggers "
""map <leader>b :LustyBufferExplorer<cr>
map <leader>h :LustyFilesystemExplorer<cr>
map <leader>f :LustyFilesystemExplorerFromHere<cr>
map <C-f> :LustyFilesystemExplorerFromHere<cr>
map <leader>g :LustyBufferGrep<cr>

hi LustySelected ctermfg=3 ctermbg=17

" Taglist triggers "
""map <leader>t :TlistOpen<cr>
""map <leader>T :TlistClose<cr>

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


" Command-T "
let g:CommandTMaxCachedDirectories=4
let g:CommandTMaxHeight=10
let g:CommandTMinHeight=10
"" let g:CommandTMatchWindowReverse=1
let g:CommandTClearMap=['<C-w>', '<C-u>']
let g:CommandTCancelMap=['<C-c>', '<Esc>']
hi PFCommandTHighlightColor cterm=bold ctermbg=28 ctermfg=11
let g:CommandTHighlightColor='PFCommandTHighlightColor'
let g:CommandTScanDotDirectories=1
let g:CommandTWildIgnore=&wildignore . ",*.git,*/dist/*,*/src/static/*,*/target/*,*/dist-*/*,*/node_modules/*,*/src-copy/*,*/docs/*,*.png"

"" map <C-e> :CommandT<cr>
map <C-j> <C-c>:CommandT<cr>
map <C-k> <C-c>:CommandTBuffer<cr>

"" map! <C-e> <Esc>:CommandT<cr>
map! <C-j> <C-c>:CommandT<cr>
map! <C-k> <C-c>:CommandTBuffer<cr>

"" function s:CommandTForCurrentDir()
""  let pfcurdir = getcwd()
""  cd %:h
""  CommandT
"" endfunction
"" command! CommandTForCurrentDir call <SID>CommandTForCurrentDir()
"" map <C-d> :CommandTForCurrentDir<cr>

map <F5> :bufdo checktime<cr>

map <C-h> :bro ol<cr>

" Change cursor shape when in insert mode "
" solid underscore
let &t_SI .= "\<Esc>[3 q"
" solid block
let &t_EI .= "\<Esc>[1 q"

"set background=dark
"colorscheme solarized
