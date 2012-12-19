
set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ignorecase
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

set hlsearch
hi Search ctermfg=None ctermbg=20

" Create new split windows *after* the current one "
set splitbelow
set splitright

" Always show the status line "
set laststatus=2

" Search upwards for ctags file "
set tags=./tags;/

" Fix mouse wheel behaviour in urxvt "
set mouse=a

" Use ant for project builds by default; search upwards for build.xml "
set makeprg=ant\ -s\ build.xml\ $*

" Default to recursive grepping inside vim "
set grepprg=grep\ -rnI\ --exclude=tags\ $*\ .

" Use bash login but don't run .bashrc (avoids recursive virtualenv problem) "
set shell=/bin/bash\ --login\ --norc

" Use friendlier autocompletion "
set wildmenu
set wildmode=list:full

" Allow buffers with changes to be hidden "
set hidden

" NERDTree stuff "
let NERDTreeIgnore=['\.pyc$']
map <leader>q :NERDTree<cr>
map <leader>Q :NERDTreeToggle<cr>
map <leader>r :setlocal nocursorline<cr>:setlocal cc=0<cr>:NERDTreeFind<cr>:setlocal cursorline<cr>

map <leader>m :make<Up><cr>
