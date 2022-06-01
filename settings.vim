filetype plugin indent on
highlight link CompeDocumentation NormalFloat

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

set wildignore+=*/node_modules/*

set tabstop=2
set softtabstop=2
set shiftwidth=2
set scrolloff=14
set colorcolumn=120

" Theme
let ayucolor="mirage"
colorscheme ayu

let g:floaterm_position='top'

" Nvim Compe
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

" OneHalf Colors Fix

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Colors highlight
lua require'colorizer'.setup()

lua << EOF

  -- Icons
  require('nvim-web-devicons').get_icons()

  -- Tree sitter
  require('nvim-treesitter.configs').setup{}

  -- Lua line
  require('lualine').setup()

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

  -- LSP

  local lspconfig = require("lspconfig")
  local null_ls = require("null-ls")
  local ts_utils = require("nvim-lsp-ts-utils")
  
  local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
  end

  local on_attach = function(client, bufnr)
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
    
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")
    
    if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
  end
  
  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      
      ts_utils.setup({})
      ts_utils.setup_client(client)
      
      buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
      buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
      buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
      
      on_attach(client, bufnr)
    end,
  })
  null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
  })

  -- LSP Signature

  require('lsp_signature').setup({
    hind_enable = false,
    handler_options = {
      border = 'single'
    }
  })

  -- Nvim Compe

  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = {
      border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
      winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
      max_width = 120,
      min_width = 60,
      max_height = math.floor(vim.o.lines * 0.3),
      min_height = 1,
    };
    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      nvim_lua = true;
      vsnip = true;
      ultisnips = true;
      luasnip = true;
    };
  }

EOF
