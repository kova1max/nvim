

" Basic
nnoremap <space>, :nohlsearch<cr>

" Find Files
nnoremap <C-f>f <cmd>Files<cr>
nnoremap <C-f>r <cmd>Rg<cr>

" Tab with selection
vnoremap > >gv
vnoremap < <gv

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Commentaries
vnoremap / <Plug>Commentary

" Float Terminal
let g:floaterm_keymap_toggle = '`'
