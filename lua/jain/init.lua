local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
    "savq/paq-nvim";                                	  -- Let Paq manage itself
    "mhinz/vim-hugefile";                               -- Support for large files
    "tanvirtin/monokai.nvim";                           -- Color Scheme
    {"ms-jpq/coq_nvim", branch="coq"};              	  -- Code Completion
    {"ms-jpq/coq.artifacts", branch="artifacts"};       -- Code completion list
    {"ms-jpq/coq.thirdparty", branch = "3p"};          	-- Code completion third-party list
    "nvim-lua/plenary.nvim";           			            -- Telescope dependency
    "nvim-telescope/telescope.nvim";    		            -- Telescope for Ctrl+P menu
    "github/copilot.vim";				                        -- GitHub Copilot
    {"nvim-treesitter/nvim-treesitter",run=':TSUpdate'};-- Syntax highlighting
    "lewis6991/impatient.nvim";                         -- Performance Improvement
    "max397574/better-escape.nvim";                     -- Better jj and jk
}

require('impatient')

-- https://github.com/echasnovski/mini.nvim
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/nvim-lsp-installer
-- https://github.com/akinsho/toggleterm.nvim
-- https://github.com/nvim-pack/nvim-spectre
-- https://github.com/kassio/neoterm
-- https://github.com/lukas-reineke/indent-blankline.nvim
-- https://github.com/ray-x/nvim
-- https://github.com/gelguy/wilder.nvim
-- https://github.com/akinsho/bufferline.nvim
-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/lewis6991/impatient.nvim
-- https://github.com/mhinz/vim-hugefile
-- https://github.com/skywind3000/vim-quickui#context-menu/ https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
  -- Use with git blame, launch diff from commit
  -- Spelling suggestions :   call append(0, spellsuggest(s:current_word))
  -- Reveal in finder
  -- Reveal in sidebar
-- https://github.com/Kritiqual/nvim-1

-- Initial Setup
require('monokai').setup { palette = require('monokai').pro }
require("better_escape").setup()

vim.g.coq_settings = {
    auto_start = true,
    clients = {
      tabnine = {
        enabled = true,
      }
  }
}

require "coq_3p"  {
 { src = "copilot", short_name = "COP", accept_key = "<D-CR>" }
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,                 -- false will disable the whole extension
    },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
}

vim.cmd('colorscheme monokai')
vim.o.number = true
require('jain/keyboard')

