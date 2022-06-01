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

" Nvim Compe using lexima
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
