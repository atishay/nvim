-- Space as leader
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })


require('jain.plugins')
require('jain.config')
require('jain.keyboard')
-- local fsize = vim.fn.getfsize(vim.fn.expand("%:p:f"))
-- if fsize == nil or fsize < 0 then
--   fsize = 1
-- end

-- local huge = false

-- if fsize > 1024 * 1024 then
--   local huge = true
-- end
--
-- https://github.com/nvim-telescope/telescope-ui-select.nvim
-- Telescope key bindings
-- Telescope register shortcut

-- https://github.com/neovim/nvimlspconfig
-- diff view
-- https://github.com/williamboman/nvim-lsp-installer
-- https://github.com/ray-x/nvim
-- https://github.com/skywind3000/vim-quickui#context-menu/ https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
-- Use with git blame, launch diff from commit
-- Spelling suggestions :   call append(0, spellsuggest(s:current_word))
-- Reveal in finder
-- Reveal in sidebar
-- https://github.com/AckslD/nvim-neoclip.lua


