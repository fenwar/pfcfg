
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
autocmd InsertLeave * hi CursorLine cterm=None ctermbg=17

set nowrap
hi VertSplit ctermfg=233 ctermbg=233 cterm=None
hi StatusLine ctermfg=236 ctermbg=11 cterm=reverse,bold,italic
hi StatusLineNC ctermfg=233 ctermbg=106 cterm=reverse,italic

hi Constant ctermfg=131
hi Comment ctermfg=69 cterm=None
hi Directory ctermfg=69 cterm=None
hi Todo term=bold ctermfg=11 ctermbg=none

set hlsearch
hi Search ctermbg=20

" Create new split windows *after* the current one "
set splitbelow
set splitright
set tags=./tags;/
