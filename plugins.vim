call plug#begin('~/.config/nvim/plugins')

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Icons
Plug 'kyazdani42/nvim-web-devicons' " Nvim-tree requires

" Emmet
Plug 'mattn/emmet-vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Repeater
Plug 'tpope/vim-repeat'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Vim comments
Plug 'tpope/vim-commentary'

" Auto close parentheses
Plug 'cohama/lexima.vim'

" Manage parentheses and tags
Plug 'tpope/vim-surround'

" Nvim Tree
Plug 'kyazdani42/nvim-tree.lua'

" Color theme
Plug 'ayu-theme/ayu-vim'

" Bottom line
Plug 'nvim-lualine/lualine.nvim'

" NVIM Tree
Plug 'kyazdani42/nvim-tree.lua'

call plug#end()
