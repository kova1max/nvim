" TODO: bind fzf(files, grep), git(gdiff, bcommits, commits, log)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Basic
nnoremap <silent> ,, :nohlsearch<cr>
nnoremap <C-h> <cmd>History<cr>

" Find Files
nnoremap <C-f>f <cmd>Files<cr>
nnoremap <C-f>r <cmd>Rg<cr>

" Git
nnoremap <C-g>c <cmd>BCommits<cr>
nnoremap <C-g>ac <cmd>Commits<cr>
nnoremap <C-g>d <cmd>Gdiffsplit<cr>

" Tab with selection
vnoremap > >gv
vnoremap < <gv

nnoremap <C-d> Y<Esc>p

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Commentaries
vnoremap / <Plug>Commentary

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy :vsp<Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Eslint fix problems
nmap <silent> <M-f> :CocCommand eslint.executeAutofix<CR>

" Git commands
nmap <silent> <M-g> :GitGutterLineHighlightsToggle<CR>
nmap <silent> <M-d> :GitGutterDiffOrig<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <silent><M-r> <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <silent><M-a>  <Plug>(coc-codeaction)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Show commands.
nnoremap <silent><nowait> <M-c>  :<C-u>CocList commands<cr>

nnoremap <silent><nowait> <M-o> :OR<CR>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
