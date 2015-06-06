" UI features "
hi ColorColumn ctermbg=236
hi CursorLine cterm=None ctermbg=17

" Change cursorline colour when in insert mode "
autocmd InsertEnter * hi CursorLine cterm=None ctermbg=52
autocmd InsertLeave,CursorMoved,CmdwinEnter * hi CursorLine cterm=None ctermbg=17

hi VertSplit ctermfg=233 ctermbg=233 cterm=None
hi StatusLine ctermfg=236 ctermbg=11 cterm=reverse,bold,italic
hi StatusLineNC ctermfg=233 ctermbg=106 cterm=reverse,italic
hi ModeMsg cterm=bold ctermbg=52 ctermfg=11
hi Directory ctermfg=69 cterm=None
hi Pmenu ctermfg=242 ctermbg=0 cterm=italic
hi PmenuSel ctermfg=253 ctermbg=22 cterm=italic
hi TabLine cterm=Bold,Italic ctermbg=233 ctermfg=106
hi TabLineSel cterm=Bold,Italic ctermbg=none ctermfg=11
hi TabLineFill cterm=Italic ctermbg=233 ctermfg=106

" Dynamic highlighting "
hi MatchParen ctermfg=yellow cterm=bold ctermbg=18
hi Search ctermfg=None ctermbg=20

" Syntax highlighting "
hi Constant ctermfg=131
hi Comment ctermfg=69 cterm=None
hi Todo term=bold ctermfg=11 ctermbg=none


