call plug#begin('~/.config/nvim/plugins')

" Git
Plug 'tpope/vim-fugitive'

" Auto close parentheses
Plug 'cohama/lexima.vim'

" Manage parentheses and tags
Plug 'tpope/vim-surround'

" Icons
Plug 'ryanoasis/vim-devicons'

" Commentaries
Plug 'tpope/vim-commentary'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Languages highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Completion
Plug 'nvim-lua/completion-nvim'

" Float terminal
Plug 'voldikss/vim-floaterm'

call plug#end()
