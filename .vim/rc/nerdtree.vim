" Configure NERDTree plugin "
let NERDTreeIgnore=['\.pyc$']
map <leader>q :NERDTree<cr>
map <leader>Q :NERDTreeToggle<cr>
map <leader>r :setlocal nocursorline<cr>:setlocal cc=0<cr>:NERDTreeFind<cr>:setlocal cursorline<cr>

