
set t_Co=256
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set ignorecase
hi ColorColumn ctermbg=0
""set cc=80
hi MatchParen ctermfg=yellow cterm=bold ctermbg=17

hi CursorLine cterm=None ctermbg=17
" Only set cursorline on the current window "
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline|setlocal cc=80
    au WinLeave * setlocal nocursorline|setlocal cc=0
augroup END
""set cursorline
" Change cursorline colour when in insert mode "
autocmd InsertEnter * hi CursorLine cterm=None ctermbg=22
autocmd InsertLeave * hi CursorLine cterm=None ctermbg=17

set nowrap
hi VertSplit ctermfg=0 ctermbg=17
hi StatusLine ctermfg=0 ctermbg=11
hi StatusLineNC ctermfg=0 ctermbg=3

hi Constant ctermfg=249
hi Comment ctermfg=12 cterm=None
hi Todo term=bold ctermfg=11 ctermbg=none

set hlsearch
hi Search ctermbg=20

" Create new split windows *after* the current one "
set splitbelow
set splitright

set tags=./tags;/
