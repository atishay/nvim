local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
  "savq/paq-nvim";                                    -- Let Paq manage itself
  "mhinz/vim-hugefile";                               -- Support for large files
  "tanvirtin/monokai.nvim";                           -- Color Scheme
  {"ms-jpq/coq_nvim", branch="coq"};                  -- Code Completion
  {"ms-jpq/coq.artifacts", branch="artifacts"};       -- Code completion list
  {"ms-jpq/coq.thirdparty", branch = "3p"};          	-- Code completion third-party list
  "nvim-lua/plenary.nvim";           	                -- Telescope dependency
  "nvim-telescope/telescope.nvim";                    -- Telescope for Ctrl+P menu
  "github/copilot.vim";                               -- GitHub Copilot
  {"nvim-treesitter/nvim-treesitter",run=':TSUpdate'};-- Syntax highlighting
  "lewis6991/impatient.nvim";                         -- Performance Improvement
  "kyazdani42/nvim-web-devicons";                     -- Icons
  "max397574/better-escape.nvim";                     -- Better jj and jk
  {"mbbill/undotree", opt=true};                      -- Undo tree
  {"mg979/vim-visual-multi", opt=true};               -- Multiple Cursors
  {"nvim-pack/nvim-spectre", opt=true};               -- Find/Replace All
  'ygm2/rooter.nvim';                                 -- Project Root
  'kyazdani42/nvim-tree.lua';                         -- File Browser
  'yggdroot/indentline';                              -- Indent line for spaces
  {'echasnovski/mini.nvim', branch="stable"};         -- Small Utilities
  'akinsho/toggleterm.nvim';                          -- Better terminal
  'haya14busa/is.vim';                                -- Incremental Search
  'nvim-lualine/lualine.nvim';                        -- Status Bar

}

-- Space as leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]

local fsize = vim.fn.getfsize(vim.fn.expand("%:p:f"))
if fsize == nil or fsize < 0 then
  fsize = 1
end

local huge = false

if fsize > 1024 * 1024 then
  local huge = true
end

-- More setups
require('impatient');
require('nvim-tree').setup();
require('mini.surround').setup();
require('mini.comment').setup();
require('mini.cursorword').setup();
require('mini.jump').setup();
require('mini.pairs').setup();
require('mini.surround').setup();
require('mini.trailspace').setup();
-- https://github.com/windwp/nvim-ts-autotag

  -- https://github.com/echasnovski/mini.nvim
  -- https://github.com/neovim/nvim-lspconfig
  -- https://github.com/williamboman/nvim-lsp-installer
  -- https://github.com/akinsho/toggleterm.nvim
  -- https://github.com/kassio/neoterm
  -- https://github.com/ray-x/nvim
  -- https://github.com/akinsho/bufferline.nvim
  -- https://github.com/nvim-lualine/lualine.nvim
  -- https://github.com/skywind3000/vim-quickui#context-menu/ https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
  -- Use with git blame, launch diff from commit
  -- Spelling suggestions :   call append(0, spellsuggest(s:current_word))
  -- Reveal in finder
  -- Reveal in sidebar
  -- https://github.com/Kritiqual/nvim-1
  -- https://github.com/AckslD/nvim-neoclip.lua

  -- Initial Setup
  require('monokai').setup { palette = require('monokai').pro }
  require("better_escape").setup()
  require'nvim-web-devicons'.setup()

  vim.g.coq_settings = {
    auto_start = true,
    clients = {
      tabnine = {
        enabled = true,
      }
    },
    keymap = {
      jump_to_mark = '',
      bigger_preview = ''
    }
  }

  require "coq_3p"  {
    { src = "copilot", short_name = "COP", accept_key = "<D-CR>" },
    { src = "bc", short_name = "MATH", precision = 6 },
    { src = "nvimlua", short_name = "nLUA" },
  }

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,                 -- false will disable the whole extension
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
  }

  require("toggleterm").setup{}
  require('lualine').setup()

  vim.cmd('colorscheme monokai')
  vim.o.number = true
  vim.o.expandtab = true
  vim.o.linebreak = true
  vim.o.softtabstop = 2
  vim.o.tabstop = 2
  vim.o.shiftwidth=2
  vim.o.spelllang= 'en'
  vim.o.visualbell = true
  vim.o.listchars='tab:>┊,trail:~,extends:>,precedes:<'
  vim.o.ttyfast = true
  vim.o.hlsearch = true
  vim.o.list = true
  vim.o.splitbelow = true
  vim.o.splitright = true
  vim.o.autowriteall = true
  vim.o.lazyredraw = true
  vim.o.ignorecase = true
  vim.o.smartcase = true
  vim.o.wildignore= 'node_modules,dist'
  vim.o.wildmode='longest,list,full'
  vim.o.fillchars=vim.o.fillchars .. 'vert:│'
  vim.o.display='lastline'
  vim.o.shortmess='atOI'
  -- Folding
  vim.o.foldmethod='manual'
  vim.o.foldnestmax=10
  vim.o.foldenable=false
  vim.o.foldlevel=2
  vim.o.inccommand='split'
  vim.o.hidden=true


  vim.g.rooter_pattern = {'.git'} 
  vim.g.outermost_root = false
  require('rooter');
  require('jain.keyboard')

