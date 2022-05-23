call plug#begin('~/.config/nvim/plugins')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'ray-x/lsp_signature.nvim'

" Git
Plug 'tpope/vim-fugitive'

" Auto close parentheses
Plug 'cohama/lexima.vim'

" Manage parentheses and tags
Plug 'tpope/vim-surround'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Color theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Colors highlight
Plug 'norcalli/nvim-colorizer.lua'

" Commentaries
Plug 'tpope/vim-commentary'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Languages highlight
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Bottom line
Plug 'nvim-lualine/lualine.nvim'

" NVIM Tree
Plug 'kyazdani42/nvim-tree.lua'

" LuaSnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" CMP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'

" Files Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/plenary.nvim'

" Float terminal
Plug 'voldikss/vim-floaterm'

" Pop-up
Plug 'nvim-lua/popup.nvim'
Plug 'Ajnasz/vim-popup-menu'

call plug#end()
