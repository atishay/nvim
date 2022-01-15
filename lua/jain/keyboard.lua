----------------------------------------------------------------------------
-- Keyboard Mapping
----------------------------------------------------------------------------


-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

------------------------------------------------------------------------------------
--  Basic Keyboard shortcuts,
------------------------------------------------------------------------------------
-- jj to Escape the insert mode
-- inoremap jj <C-[>   -- Via Vim Better Escape
map("i", "kk", "<C-o>");
map("t", "jj", "<C-\\><C-n>");
map("c", "jj", "<C-[>");
map("v", "jk", "<C-[>");

-- Update config. Need too much.
map('n', '<D-S-u>', '<cmd>:lua require("jain.reload").reload()<CR>')
map('i', '<D-S-u>', '<cmd>:lua require("jain.reload").reload()<CR>')

map('n', '<D-u>', '<cmd>:lua require("jain.reload").open()<CR>')
map('i', '<D-u>', '<cmd>:lua require("jain.reload").open()<CR>')
-- Update after nvim 0.6.2

-- Accidental quitting
map('n', 'qa!', ':qa!');
map('n', 'wq', ':wq');

-- Navigate soft line wraps with the j & k keys
map('n', 'j', 'v:count ? \'j\' : \'gj\'', {expr = true });
map('n', 'k', 'v:count ? \'k\' : \'gk\'', {expr = true });

-- After nvim 0.6.2
-- map('n', '<D-p>', '', {callback = require('telescope.builtin').find_files});


-- Visual movement with the arrows and End-Home
map('n', '<Down>', 'gj');
map('n', '<Up>', 'gk');
map('v', '<Down>', 'gj');
map('v', '<Up>', 'gkjj');
map('i', '<Down>', '<C-o>gj');
map('i', '<Up>', '<C-o>gk');
map('i', '<Home>', '<C-o>g<Home>');
map('i', '<End> ', '<C-o>g<End> ');

-- Navigating splits

map('n', '<M-x>', ':sp<CR>');
map('n', '<M-v>', ':vsp<CR>');

map('n', '<D-j>', '<C-W><C-j>');
map('n', '<D-k>', '<C-W><C-k>');
map('n', '<D-l>', '<C-W><C-l>');
map('n', '<D-h>', '<C-W><C-h>');

map('n', '<C-j>', '<C-W><C-j>');
map('n', '<C-k>', '<C-W><C-k>');
map('n', '<C-l>', '<C-W><C-l>');
map('n', '<C-h>', '<C-W><C-h>');

map('i', '<M-x>', '<C-[>:sp<CR>');
map('i', '<M-v>', '<C-[>:vsp<CR>');

map('i', '<D-J>', '<C-[><C-W><C-J>');
map('i', '<D-K>', '<C-[><C-W><C-K>');
map('i', '<D-L>', '<C-[><C-W><C-L>');
map('i', '<D-H>', '<C-[><C-W><C-H>');

map('i', '<C-J>', '<C-[><C-W><C-J>');
map('i', '<C-K>', '<C-[><C-W><C-K>');
map('i', '<C-L>', '<C-[><C-W><C-L>');
map('i', '<C-H>', '<C-[><C-W><C-H>');

map('n', '<C-Down>', '<C-W><C-J>');
map('n', '<C-Up>', '<C-W><C-K>');
map('n', '<C-Right>', '<C-W><C-L>');
map('n', '<C-Left>', '<C-W><C-H>');

map('i', '<C-Down>', '<C-[><C-W><C-J>');
map('i', '<C-Up>', '<C-[><C-W><C-K>');
map('i', '<C-Right>', '<C-[><C-W><C-L>');
map('i', '<C-Left>', '<C-[><C-W><C-H>');

map('t', '<C-Down>', '<C-\\><c-n><C-W><C-J>');
map('t', '<C-Up>', '<C-\\><c-n><C-W><C-K>');
map('t', '<C-Right>', '<C-\\><c-n><C-W><C-L>');
map('t', '<C-Left>', '<C-\\><c-n><C-W><C-H>');

map('t', '<D-j>', '<C-\\><c-n><C-W><C-J>');
map('t', '<D-k>', '<C-\\><c-n><C-W><C-K>');
map('t', '<D-l>', '<C-\\><c-n><C-W><C-L>');
map('t', '<D-h>', '<C-\\><c-n><C-W><C-H>');

map('t', '<C-j>', '<C-\\><c-n><C-W><C-J>');
map('t', '<C-k>', '<C-\\><c-n><C-W><C-K>');
map('t', '<C-l>', '<C-\\><c-n><C-W><C-L>');
map('t', '<C-h>', '<C-\\><c-n><C-W><C-H>');



----------------------------File Menu--------------------------------------

-- Save
map('n', '<D-s>', ':w<CR>');
map('i', '<D-s>', '<C-o>:w<CR>');
map('v', '<D-s>', '<C-[>:w<CR>vgv');

map('n', '<D-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>');
map('n', '<D-S-p>', '<cmd>lua require(\'telescope.builtin\').builtin()<cr>');
map('n', '<D-r>', '<cmd>lua require(\'telescope.builtin\').commands()<cr>');

map('i', '<D-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>');
map('i', '<D-S-p>', '<cmd>lua require(\'telescope.builtin\').builtin()<cr>');
map('i', '<D-r>', '<cmd>lua require(\'telescope.builtin\').commands()<cr>');

map('t', '<D-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>');
map('t', '<D-S-p>', '<cmd>lua require(\'telescope.builtin\').builtin()<cr>');
map('t', '<D-r>', '<cmd>lua require(\'telescope.builtin\').commands()<cr>');

map('n', '<D-w>', ':bd<CR>');
map('i', '<D-w>', '<C-[>:bd<CR>');
map('t', '<D-w>', '<C-/><C-n><CR>');
map('v', '<D-w>', '<C-[>:bd<CR>');

map('n', '<D-q>', ':%bdCR>');
map('i', '<D-q>', '<C-[>:%bd<CR>');
map('t', '<D-q>', '<C-/><C-n><CR>');
map('v', '<D-q>', '<C-[>:%bd<CR>');

map('n', '<M-D-z>', ':packadd undotree<CR>:UndotreeToggle<CR>');
map('n', '<D-z>', 'u');
map('v', '<D-z>', '<C-[>uvgv');
map('i', '<D-z>', '<C-O>u');
map('n', '<D-S-z>', '<C-r>');
map('i', '<D-S-z>', '<C-O><C-r>');


------------------------------Edit Menu------------------------------
map('v', '<D-c>', '"+y');
map('n', '<D-c>', 'v"+y<Esc>');
map('i', '<D-c>', '<Esc>lv"+y<Esc>i');

map('v', '<D-x>', '"+d');
map('n', '<D-v>', ':set paste<CR>"+p');
map('i', '<D-v>', '<C-R><C-P>+');
map('v', '<D-v>', '"+p');
map('t', '<D-v>', '<C-\\><C-N>"+pa');
map('c', '<D-v>', '<C-R>+');

map('n', '<D-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>');
map('i', '<D-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>');
map('t', '<D-f>', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>');


map('n', '<D-M-f>',  ':%sno/');
map('i', '<D-M-f>',  '<C-[>:%sno/');

map('n', '<D-S-f>', ':packadd nvim-spectre<CR>:lua require(\'spectre\').open()<CR>');
map('i', '<D-S-f>', '<C-[>:packadd nvim-spectre<CR>:lua require(\'spectre\').open()<CR>');

----------------------------Text Box--------------------------------------
-- Navigation
map('n', '<D-left>',  '^');
map('n', '<D-left><D-left>',  '0');
map('i', '<D-left>',  '<C-o>^');
map('v', '<D-left>',  '^');
map('t', '<D-left>',  '<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>');
map('c', '<D-left>',  '<C-b>');


map('n', '<D-right>', '$');
map('v', '<D-right>', '$');
map('t', '<D-right>', '<right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right>');
map('i', '<D-right>', '<C-o>$');
map('c', '<D-right>', '<C-e>');

map('n', '<D-up>', 'gg');
map('v', '<D-up>', 'gg');
map('i', '<D-up>', '<C-o>gg');

map('n', '<D-down>', 'G');
map('v', '<D-down>', 'G');
map('i', '<D-down>', '<C-o>G');

map('n', '<M-left>', 'B');
map('v', '<M-left>', 'B');
map('i', '<M-left>', '<C-o>B');
map('t', '<M-left>', '<M-b>');
map('c', '<M-left>', '<C-left>');

map('t', '<M-right>', '<M-f>');
map('n', '<M-right>', 'W');
map('v', '<M-right>', 'W');
map('i', '<M-right>', '<C-o>W');
map('c', '<M-right>', '<C-right>');

-- Backspace
map("n", "<BS>", "i<BS><Esc>`^");
map('i', '<D-BS>', '<C-o>d0');
map('n', '<D-BS>', 'd0');
map('v', '<D-BS>', 'dd0');
map('t', '<D-BS>', '<C-u>');
map('c', '<D-BS>', '<C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w>');

map('n', '<M-BS>', 'dB');
map('i', '<M-BS>', '<C-o>dB');
map('v', '<M-BS>', '<C-o>ddB');
map('c', '<M-BS>', '<C-w>');

-- Selection
map('n', '<S-Up>', 'v<Up>');
map('n', '<S-Down>', 'v<Down>');
map('n', '<S-Left>', 'v<Left>');
map('n', '<S-Right>', 'v<Right>');
map('v', '<S-Up>', '<Up>');
map('v', '<S-Down>', '<Down>');
map('v', '<S-Left>', '<Left>');
map('v', '<S-Right>', '<Right>');
map('i', '<S-Up>', '<C-[>v<Up>');
map('i', '<S-Down>', '<C-[>v<Down>');
map('i', '<S-Left>', '<C-[>v<Left>');
map('i', '<S-Right>', '<C-[>v<Right>');
map('t', '<S-Up>', '<C-[><C-n>v<Up>');
map('t', '<S-Down>', '<C-\\><C-n>v<Down>');
map('t', '<S-Left>', '<C-\\><C-n>v<Left>');
map('t', '<S-Right>', '<C-\\><C-n>v<Right>');

map('n', '<D-S-left><D-S-left>', 'v0');
map('n', '<D-S-left>', 'v^');
map('n', '<D-S-right>', 'v$');
map('n', '<D-S-down>', 'vG');
map('n', '<D-S-up>', 'vgg');
map('v', '<D-S-left>', '0');
map('v', '<D-S-right>', '$');
map('v', '<D-S-down>', 'vG');
map('v', '<D-S-up>', 'vgg');
map('i', '<D-S-left>', '<C-[>v0');
map('i', '<D-S-right>', '<C-[>v$');
map('i', '<D-S-down>', '<C-[>vG');
map('i', '<D-S-up>', '<C-[>vgg');
map('t', '<D-S-left>', '<C-/><C-n>v0');
map('t', '<D-S-right>', '<C-/><C-n>v$');
map('t', '<D-S-down>', '<C-/><C-n>vG');
map('t', '<D-S-up>', '<C-/><C-n>vgg');

map('n', '<M-S-left>', 'vB');
map('n', '<M-S-right>', 'vW');
map('v', '<M-S-left>', 'B');
map('v', '<M-S-right>', 'W');
map('i', '<M-S-left>', '<C-[>vB');
map('i', '<M-S-right>', '<C-[>vW');
map('t', '<M-S-left>', '<C-\\><C-n>vB');
map('t', '<M-S-right>', '<C-\\><C-n>vW');

-- Shifting
map('n', '<M-j>', ':m .+1<CR>==');
map('n', '<M-k>', ':m .-2<CR>==');
map('i', '<M-j>', '<Esc>:m .+1<CR>==gi');
map('i', '<M-k>', '<Esc>:m .-2<CR>==gi');
map('v', '<M-j>', ':m \'>+1<CR>gv=gv');
map('v', '<M-k>', ':m \'<-2<CR>gv=gv');

map('n', '<M-down>', ':m .+1<CR>==');
map('n', '<M-up>', ':m .-2<CR>==');
map('i', '<M-down>', '<Esc>:m .+1<CR>==gi');
map('i', '<M-up>', '<Esc>:m .-2<CR>==gi');
map('v', '<M-down>', ':m \'>+1<CR>gv=gv');
map('v', '<M-up>', ':m \'<-2<CR>gv=gv');


------------------------------Others--------------------------------

-- Clear terminal
map('t', '<M-c>', '<C-l>');

-- Open explorer
map('n', '<D-b>', ':NvimTreeToggle<CR>');
map('i', '<D-b>', '<C-o>:NvimTreeToggle<CR>');
map('v', '<D-b>', '<C-[>:NvimTreeToggle<CR>');
map('t', '<D-b>', '<C-\\><C-n>:NvimTreeToggle<CR>');

-- Comment
map('n', '<D-/>', 'gcc', {noremap = false});
map('v', '<D-/>', 'gc', {noremap = false});
map('i', '<D-/>', '<C-o>gcc', {noremap = false});

-- Indentation
map('v', '>', '>gv')
map('v', '<', '<gv')
map('n', '<D-]>', '>>');
map('n', '<D-[>', '<<');
map('i', '<D-]>', '<C-o>>>');
map('i', '<D-[>', '<C-o><<');
map('v', '<D-[>', '<gv');
map('v', '<D-]>', '>gv');

-- Multiple Cursors
-- nnoremap ⌘⇧d :packadd vim-visual-multi<CR>
-- inoremap ⌘⇧d <C-o>:packadd vim-visual-multi<CR>
-- vnoremap ⌘⇧d <C-[>:packadd vim-visual-multi<CR>
-- nmap ⌘d <C-n>
-- imap ⌘d <C-n>
-- vmap ⌘d <C-n>
-- vmap ⌘⇧l \\c

map('n', '<C-`>', ':ToggleTerm<CR>');
map('i', '<C-`>', '<C-[>:ToggleTerm<CR>');
map('v', '<C-`>', ':ToggleTerm<CR>');
map('t', '<C-`>', '<C-\\><C-n>:ToggleTerm<CR>');

map('n', '<C-1>', ':ToggleTerm 2<CR>');
map('i', '<C-1>', '<C-[>:ToggleTerm 2<CR>');
map('v', '<C-1>', ':ToggleTerm 2<CR>');
map('t', '<C-1>', '<C-\\><C-n>:ToggleTerm 2<CR>');

-- Visual Mode
-- If it pains too much choose key or vim surround.
-- map('v', '<M-S-\'>', 'di""<Esc>PlvF""');
-- map('v', '<M-\'>', 'di\'\'<Esc>PlvF\'');
-- map('v', '<M-,>', 'di<><Esc>PlvF<');
-- map('v', '<M-S-[>', 'di{}<Esc>PlvF{');
-- map('v', '<M-[>', 'di[]<Esc>PlvF[');
-- map('v', '<M-S-9>', 'di()<Esc>PlvF(');
