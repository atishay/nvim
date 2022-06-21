local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

local function tsUpdate()
  vim.api.nvim_command('TSUpdate')
end

require "paq" {
  "savq/paq-nvim";                                                      -- Let Paq manage itself
  "mhinz/vim-hugefile";                                                 -- Support for large files
  "tanvirtin/monokai.nvim";                                             -- Color Scheme
  {"ms-jpq/coq_nvim", branch="coq"};                                    -- Code Completion
  {"ms-jpq/coq.artifacts", branch="artifacts"};                         -- Code completion list
  {"ms-jpq/coq.thirdparty", branch = "3p"};                             -- Code completion third-party list
  "nvim-lua/plenary.nvim";                                              -- Telescope dependency
  "nvim-telescope/telescope.nvim";                                      -- Telescope for Ctrl+P menu
  "nvim-telescope/telescope-fzy-native.nvim";                           -- Telescope Fuzzy Native
  -- "github/copilot.vim";                                                 -- GitHub Copilot
  {"nvim-treesitter/nvim-treesitter", run = tsUpdate };                 -- Syntax highlighting
  {"nvim-treesitter/nvim-treesitter-refactor"};                         -- Refactor
  {"nvim-treesitter/nvim-treesitter-textobjects"};                      -- Text Objects
  'windwp/nvim-ts-autotag';                                             -- Autotag
  "lewis6991/impatient.nvim";                                           -- Performance Improvement
  "kyazdani42/nvim-web-devicons";                                       -- Icons
  "max397574/better-escape.nvim";                                       -- Better jj and jk
  {"mbbill/undotree", opt=true};                                        -- Undo tree
  {"nvim-pack/nvim-spectre", opt=true};                                 -- Find/Replace All
  'airblade/vim-rooter';                                                -- Project Root
  'kyazdani42/nvim-tree.lua';                                           -- File Browser
  'yggdroot/indentline';                                                -- Indent line for spaces
  {'echasnovski/mini.nvim', branch="stable"};                           -- Small Utilities
  'akinsho/toggleterm.nvim';                                            -- Better terminal
  'haya14busa/is.vim';                                                  -- Incremental Search
  'nvim-lualine/lualine.nvim';                                          -- Status Bar
  'windwp/nvim-autopairs';                                              -- Auto Pairs (mini is not good)
  'mg979/vim-visual-multi';                                             -- Multiple Cursors
  'tpope/vim-surround';                                                 -- Surround (original)
  'akinsho/bufferline.nvim';                                            -- Buffer Line
  'pgdouyon/vim-evanesco';                                              -- Remove annoying search highlight.
  'sbdchd/neoformat';                                                   -- Formatting
  'MunifTanjim/nui.nvim';                                               -- Create UI (Context Menu)
  'sindrets/diffview.nvim';                                             -- Diff View
  'neovim/nvim-lspconfig';                                              -- LSP
  'williamboman/nvim-lsp-installer',                                    -- LSP Installer
  {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},                     -- Navigatior Lua dependency
  'ray-x/navigator.lua',                                                -- Navigator
}

require'navigator'.setup({
  lsp_installer = true
})

vim.g.neoformat_enabled_html = {'prettier', 'jsbeautify'}
vim.g.neoformat_enabled_json = {'jsbeautify', 'prettier'}
vim.g.neoformat_enabled_javascript = {'prettier', 'jsbeautify'}
vim.g.neoformat_enabled_typescript = {'prettier', 'jsbeautify'}
vim.g.neoformat_enabled_lua = {'lua-format'}

-- local Menu = require("nui.menu")

require('impatient');


-- local function sidebar_context_menu(node)
--   -- require("nvim-tree.view").focus()
--   vim.cmd [[
--   execute "normal! \<LeftMouse>"
--   ]]
--   local lib = require'nvim-tree.lib'
--   local node = lib.get_node_at_cursor()
--   if not node then return end
--   print("Creating menu")
--   local popup_options = {
--     relative = "cursor",
--     position = {
--       row = 1,
--       col = 0,
--     },
--     border = {
--       style = "rounded",
--     }
--   }
--   local event = require("nui.utils.autocmd").event
--   local menu = Menu(popup_options, {
--     lines = {
--       Menu.separator("Group One"),
--       Menu.item("Item 1"),
--       Menu.item("Item 2"),
--       Menu.separator("Group Two", {
--         char = "-",
--         text_align = "right",
--       }),
--       Menu.item("Item 3"),
--       Menu.item("Item 4"),
--     },
--     max_width = 150,
--     keymap = {
--       focus_next = { "j", "<Down>", "<Tab>" },
--       focus_prev = { "k", "<Up>", "<S-Tab>" },
--       close = { "<Esc>", "<C-c>" },
--       submit = { "<CR>", "<Space>" },
--     },
--     on_close = function()
--       print("CLOSED")
--     end,
--     on_submit = function(item)
--       print("SUBMITTED", vim.inspect(item))
--     end,
--   })
--   -- print(node.absolute_path)
--   -- mount the component
--   menu:mount()
--
--   -- close menu when cursor leaves buffer
--   menu:on(event.BufLeave, menu.menu_props.on_close, { once = true })
-- end

-- local function single_click_edit(node)
--   vim.cmd [[
--   execute "normal! \<LeftMouse>"
--   ]]
--   local lib = require'nvim-tree.lib'
--   local node = lib.get_node_at_cursor()
--   if not node then return end
--   local actions = require'nvim-tree.actions'
--   actions.on_keypress("edit")
-- end




require('nvim-tree').setup({
  view = {
    auto_resize = true,
    mappings = {
      list = {
        -- { key = "<RightMouse>", action = "context_menu", action_cb = sidebar_context_menu},
        { key = "<M-v>", action = "vsplit" },
        { key = "<M-x>", action = "split" },
        { key = "<M-t>", action = "tabnew" },
        { key = "<D-x>", action = "cut" },
        { key = "<D-c>", action = "copy" },
        { key = "<D-v>", action = "paste" },
        { key = "<D-r>", action = "refresh" },
        { key = "<Space>", action = "preview" },
        { key = "<BS>", action = "trash" },
        -- { key = "<LeftRelease>", action= "single_click_edit", action_cb = single_click_edit},
        { key = "<2-LeftMouse>", action = "cd" },

      }
    }
  }
});
require('mini.comment').setup();
require('mini.cursorword').setup();
require('mini.jump').setup();
require('mini.bufremove').setup();
require("diffview").setup();

require('mini.trailspace').setup();

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        require('mini.trailspace').trim()
    end,
    desc = "Trim spaces on save",
})

require('bufferline').setup{
  options = {
    close_command = "lua MiniBufremove.delete(%d, true)",
    right_mouse_command = "echo \"Right Mouse\"",
    indicator_icon = '',
    offsets = {{filetype = "NvimTree", text = "Files", text_align = "center", padding = 0 }},
  },
  highlights = {
    fill = {
      guifg = '#72696A',
      guibg = '#26292C'
    },
    background = {
      guifg = '#72696A',
      guibg = '#26292C'
    },
    tab = {
      guifg = '#72696A',
      guibg = '#26292C'
    },
    tab_selected = {
      guifg = '#72696A',
      guibg = '#333842'
    },
    tab_close = {
      guifg = '#72696A',
      guibg = '#26292C'
    },
    buffer_visible = {
      guifg = '#B1B1B1',
      guibg = '#26292C'
    },
    buffer_selected = {
      guifg = '#FFF1F3',
      guibg = '#333842'
    },
    close_button = {
      guifg = '#72696A',
      guibg = '#26292C'
    },
    separator_selected = {
      guibg = '#000000',
    },
    separator = {
      guibg = '#26292C'
    },
    info = {
      guibg = '#26292C'
    },
    close_button_visible = {
      guifg = '#B1B1B1',
      guibg = '#26292C'
    },
    close_button_selected = {
      guifg = '#FFF1F3',
      guibg = '#333842'
    },
    modified = {
      guifg = '#72696A',
      guibg = '#26292C'
    },
    modified_visible = {
      guifg = '#B1B1B1',
      guibg = '#26292C'
    },
    modified_selected = {
      guifg = '#FFF1F3',
      guibg = '#333842',
    }
  }
}

require('monokai').setup { palette = require('monokai').pro }

vim.cmd('colorscheme monokai')
require("better_escape").setup()
require'nvim-web-devicons'.setup()
require('telescope').setup()
require('telescope').load_extension('fzy_native');

vim.g.copilot_filetypes = {
  TelescopePrompt = false
}

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
  -- { src = "copilot", short_name = "COP", accept_key = "<D-CR>" },
  { src = "bc", short_name = "MATH", precision = 6 },
  { src = "nvimlua", short_name = "nLUA" },
}

require("coq");


vim.g.VM_mouse_mappings = 1

-- NVIM Auto Pairs Start
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({ map_bs = false, map_cr = false })

_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
-- Autopairs end


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "javascript", "tsx", "typescript", "yaml", "comment" , "go", "json", "lua", "css", "html", "vim",  }, -- one of "all", or a list of languages
  highlight = {
    enable = true,                 -- false will disable the whole extension
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true,
  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["aa"] = "@parameter.outer",
      ["ia"] = "@parameter.inner",
      ["ii"] = "@conditional.inner",
      ["ai"] = "@conditional.outer",
    },
  },
  move = {
    enable = true,
    set_jumps = false, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = "@class.outer",
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
  },
},
refactor = {
  highlight_definitions = { enable = true },
},
autotag = { enable = true },
}

require("toggleterm").setup{
  on_open = function(term)
    if vim.fn.has('gui_vimr') == 1 then
      term:send("tmux");
    end
  end
}

require('lualine').setup{
  options = {
    globalstatus = true
  }
}
