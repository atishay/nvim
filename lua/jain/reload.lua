local M = {}
local R
local P


P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

local function get_module_name(s)
  local module_name;

  module_name = s:gsub("%.lua", "")
  module_name = module_name:gsub("/", ".")
  module_name = module_name:gsub(".*config.nvim.lua", "")
  module_name = module_name:gsub("%.init", "")

  return module_name
end

function M.reload()
  local info = vim.fn.expand('%:p')
  if string.match(info, "config/nvim/lua") then
    local name = get_module_name(info)
    R(name)
    P(name .. " RELOADED!!!")
  else
    P(info .. " not in the right folder")
  end
end

function M.open()
  local prompt_title = "~ neovim modules ~"

  -- sets the path to the lua folder
  local path = "~/.config/nvim/lua"

  local opts = {
    prompt_title = prompt_title,
    cwd = path,
  }

  -- call the builtin method to list files
  require('telescope.builtin').find_files(opts)
end

return M;
