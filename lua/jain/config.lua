

-- Highlight on yank
vim.cmd [[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]]

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
vim.o.fillchars = 'vert:│'
vim.o.display='lastline'
vim.o.shortmess='atOI'
-- Folding
vim.o.foldmethod='manual'
vim.o.foldnestmax=10
vim.o.foldlevel=2
vim.o.inccommand='split'
vim.o.hidden=true
vim.o.mousemodel='popup_setpos'
vim.o.mousefocus=true
