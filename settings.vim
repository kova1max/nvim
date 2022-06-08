filetype plugin indent on
highlight link CompeDocumentation NormalFloat
highlight link GitGutterChangeLine DiffText

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

set number
set autoindent
set smarttab
set noswapfile
set expandtab
set termguicolors
set cursorline
set lazyredraw
set nowrap
set ai
set si

set encoding=utf-8
set fileformat=unix
set mouse=a
set completeopt=menu,menuone,noselect
set clipboard^=unnamed,unnamedplus
set inccommand=split
set backspace=start,eol,indent
set completeopt=menu,menuone,noselect
set shortmess+=c

set wildignore+=*/node_modules/*

set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=14
set colorcolumn=120
set cmdheight=2
set updatetime=300

" Theme
let ayucolor="mirage"
colorscheme ayu

" Colors fix
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

lua << EOF

  -- Nvim Tree
  require('nvim-tree').setup{
    open_on_setup = true,
    open_on_setup_file = true,
    filters = {
      dotfiles = false,
      custom = {'node_modules', 'dist', '.idea', '.vscode', '.git', '.github'},
      exclude = {},
    },
    renderer = {
      icons = {
       webdev_colors = true,
       git_placement = "after",
       show = {
         file = true,
         folder = false,
         folder_arrow = true,
         git = true,
         },
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    view = {
      width = 40
    },
    actions = {
      open_file = {
          resize_window = true
        }
      }
  }

EOF
