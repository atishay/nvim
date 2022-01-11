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
-- Backspace
map("n", "<BS>", "i<BS><Esc>`^");
-- jj to Escape the insert mode
-- inoremap jj <C-[>   -- Via Vim Better Escape
map("i", "kk", "<C-o>");
map("t", "jj", "<C-\\><C-n>");
map("c", "jj", "<C-[>");
map("v", "jk", "<C-[>");

-- Update config. Need too much.
map('n', '<D-u>', '<cmd>:lua require("jain.reload").reload()<CR>')
map('i', '<D-u>', '<cmd>:lua require("jain.reload").reload()<CR>')
-- Update after nvim 0.6.2

-- Accidental quitting
map('n', 'qa!', ':qa!');
map('n', 'wq', ':wq');

-- Navigate soft line wraps with the j & k keys
map('n', 'j', 'v:count ? \'j\' : \'gj\'', {expr = true });
map('n', 'k', 'v:count ? \'k\' : \'gk\'', {expr = true });

-- File Menu
map('n', '<D-p>', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>');
map('n', '<D-S-p>', '<cmd>lua require(\'telescope.builtin\').commands()<cr>');
map('n', '<D-r>', '<cmd>lua require(\'telescope.builtin\').command_history()<cr>');

-- After nvim 0.6.2
-- map('n', '<D-p>', '', {callback = require('telescope.builtin').find_files});


-- Visual movement with the arrows and End-Home
map('n' '<Down>', 'gj');
map('n' '<Up>', 'gk');
map('v' '<Down>', 'gj');
map('v' '<Up>', 'gkjj');
map('i' '<Down>', '<C-o>gj');
map('i' '<Up>', '<C-o>gk');
map('i' '<Home>', '<C-o>g<Home>');
map('i' '<End> ', '<C-o>g<End> ');

-- -- Navigating splits

map('n', '<A-x>', ':sp<CR>');
map('n', '<A-v>', ':vsp<CR>');
map('n', '<C-J>', '<C-W><C-J>');
map('n', '<C-K>', '<C-W><C-K>');
map('n', '<C-L>', '<C-W><C-L>');
map('n', '<C-H>', '<C-W><C-H>');

map('n', '<A-x>', '<C-[>:sp<CR>');
map('n', '<A-v>', '<C-[>:vsp<CR>');
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
-- ----------------------------File Menu--------------------------------------
-- -- Save
-- nnoremap ⌘s :w<CR>
-- inoremap ⌘s <C-o>:w<CR>
-- vnoremap ⌘s <C-[>:w<CR>vgv


-- nnoremap ⌘p :Files<CR>
-- inoremap ⌘p <C-[>:Files<CR>
-- tnoremap ⌘p <c-\><c-n>:Files<CR>

-- nnoremap ⌘w :q<CR>
-- inoremap ⌘w <C-[>:q<CR>
-- tnoremap ⌘w <C-/><C-n><CR>
-- vnoremap ⌘w <C-[>:q<CR>

-- nnoremap ⌘⌥z :packadd undotree<CR>:UndotreeToggle<CR>

-- nnoremap ⌘v <C-O>u
-- nnoremap ⌘z u
-- vnoremap ⌘z <C-[>uvgv
-- inoremap ⌘z <C-O>u
-- nnoremap ⌘⇧z <C-r>
-- inoremap ⌘⇧z <C-O><C-r>


-- ------------------------------Edit Menu------------------------------
-- vnoremap ⌘c "+y
-- nnoremap ⌘c v"+y<Esc>
-- inoremap ⌘c <Esc>lv"+y<Esc>i

-- vnoremap ⌘x "+d
-- nnoremap ⌘v :set paste<CR>"+p
-- inoremap ⌘v <C-R><C-P>+
-- vnoremap ⌘v "+p
-- tnoremap ⌘v <C-\><C-N>"+pa
-- cnoremap ⌘v <C-R>+

-- nnoremap ⌘f /\V
-- inoremap ⌘f <C-[>/\V
-- nnoremap ⌘⌥f :%sno/
-- inoremap ⌘⌥f <C-[>:%sno/

-- nnoremap ⌘⇧f :Rg<CR>
-- inoremap ⌘⇧f <C-[>:Rg<CR>

-- ----------------------------Text Box--------------------------------------
-- -- Navigation
-- nnoremap ⌘← ^
-- inoremap ⌘← <C-o>^
-- vnoremap ⌘← ^
-- tnoremap ⌘← <left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
-- cnoremap ⌘← <C-b>


-- nnoremap ⌘→ $
-- vnoremap ⌘→ $
-- tnoremap ⌘→ <right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right><right>
-- inoremap ⌘→ <C-o>$
-- cnoremap ⌘→ <C-e>

-- nnoremap ⌘↑ gg
-- vnoremap ⌘↑ gg
-- inoremap ⌘↑ <C-o>gg

-- nnoremap ⌘↓ G
-- vnoremap ⌘↓ G
-- inoremap ⌘↓ <C-o>G

-- noremap ⌥← B
-- vnoremap ⌥← B
-- inoremap ⌥← <C-o>B
-- tnoremap ⌥← <A-b>
-- cnoremap ⌥← <C-left>

-- tnoremap ⌥→ <A-f>
-- nnoremap ⌥→ W
-- vnoremap ⌥→ W
-- inoremap ⌥→ <C-o>W
-- cnoremap ⌥→ <C-right>

-- noremap <A-left> B
-- vnoremap <A-left> B
-- inoremap <A-left> <C-o>B
-- tnoremap <A-left> <A-b>
-- cnoremap <A-left> <C-left>

-- tnoremap <A-right> <A-f>
-- nnoremap <A-right> W
-- vnoremap <A-right> W
-- inoremap <A-right> <C-o>W
-- cnoremap <A-right> <C-right>

-- -- Deletion
-- inoremap ⌘⌫ <C-o>d0
-- nnoremap ⌘⌫ d0
-- vnoremap ⌘⌫ dd0
-- tnoremap ⌘⌫ <C-u>
-- cnoremap ⌘⌫ <C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w><C-w>

-- nnoremap ⌥⌫ dB
-- inoremap ⌥⌫ <C-o>dB
-- vnoremap ⌥⌫ <C-o>ddB
-- cnoremap ⌥⌫ <C-w>

-- -- Selection
-- nmap <S-Up> v<Up>
-- nmap <S-Down> v<Down>
-- nmap <S-Left> v<Left>
-- nmap <S-Right> v<Right>
-- vmap <S-Up> <Up>
-- vmap <S-Down> <Down>
-- vmap <S-Left> <Left>
-- vmap <S-Right> <Right>
-- imap <S-Up> <C-[>v<Up>
-- imap <S-Down> <C-[>v<Down>
-- imap <S-Left> <C-[>v<Left>
-- imap <S-Right> <C-[>v<Right>
-- tmap <S-Up> <C-[><C-n>v<Up>
-- tmap <S-Down> <C-\><C-n>v<Down>
-- tmap <S-Left> <C-\><C-n>v<Left>
-- tmap <S-Right> <C-\><C-n>v<Right>

-- nmap ⌘⇧← v0
-- nmap ⌘⇧→ v$
-- nmap ⌘⇧↓ vG
-- nmap ⌘⇧↑ vgg
-- vmap ⌘⇧← 0
-- vmap ⌘⇧→ $
-- vmap ⌘⇧↓ vG
-- vmap ⌘⇧↑ vgg
-- imap ⌘⇧← <C-[>v0
-- imap ⌘⇧→ <C-[>v$
-- imap ⌘⇧↓ <C-[>vG
-- imap ⌘⇧↑ <C-[>vgg
-- tmap ⌘⇧← <C-/><C-n>v0
-- tmap ⌘⇧→ <C-/><C-n>v$
-- tmap ⌘⇧↓ <C-/><C-n>vG
-- tmap ⌘⇧↑ <C-/><C-n>vgg

-- nmap <A-S-left> vB
-- nmap <A-S-right> vW
-- vmap <A-S-left> B
-- vmap <A-S-right> W
-- imap <A-S-left> <C-[>vB
-- imap <A-S-right> <C-[>vW
-- tmap <A-S-left> <C-\><C-n>vB
-- tmap <A-S-right> <C-\><C-n>vW

-- -- Shifting
-- nnoremap <A-j> :m .+1<CR>==
-- nnoremap <A-k> :m .-2<CR>==
-- inoremap <A-j> <Esc>:m .+1<CR>==gi
-- inoremap <A-k> <Esc>:m .-2<CR>==gi
-- vnoremap <A-j> :m '>+1<CR>gv=gv
-- vnoremap <A-k> :m '<-2<CR>gv=gv

-- nnoremap <A-down> :m .+1<CR>==
-- nnoremap <A-up> :m .-2<CR>==
-- inoremap <A-down> <Esc>:m .+1<CR>==gi
-- inoremap <A-up> <Esc>:m .-2<CR>==gi
-- vnoremap <A-down> :m '>+1<CR>gv=gv
-- vnoremap <A-up> :m '<-2<CR>gv=gv


-- ------------------------------Others--------------------------------

-- -- Clear terminal
-- tnoremap <A-c> <C-l>

-- -- Open explorer
-- nnoremap ⌘b :Vexplore<CR>
-- inoremap ⌘b <C-o>:Vexplore<CR>
-- vnoremap ⌘b <C-[>:Vexplore<CR>
-- tnoremap ⌘b <C-\><C-n>:Vexplore<CR>

-- -- Comment
-- nmap ⌘/ gcc
-- vmap ⌘/ gc
-- imap ⌘/ <C-o>gcc

-- -- Indentation
-- vnoremap > >gv
-- vnoremap < <gv
-- nnoremap ⌘] >>
-- nnoremap ⌘[ <<
-- inoremap ⌘] <C-o>>>
-- inoremap ⌘[ <C-o><<
-- vnoremap ⌘[ <gv
-- vnoremap ⌘] >gv

-- -- Multiple Cursors
-- nnoremap ⌘⇧d :packadd vim-visual-multi<CR>
-- inoremap ⌘⇧d <C-o>:packadd vim-visual-multi<CR>
-- vnoremap ⌘⇧d <C-[>:packadd vim-visual-multi<CR>
-- nmap ⌘d <C-n>
-- imap ⌘d <C-n>
-- vmap ⌘d <C-n>
-- vmap ⌘⇧l \\c

-- nnoremap ⌃` :split term://zsh<CR>
-- inoremap ⌃` <C-[>:split term://zsh<CR>
-- vnoremap ⌃` :split term://zsh<CR>

-- -- Visual Mode
-- vnoremap <A-"> di""<Esc>PlvF""
-- vnoremap <A-'> di''<Esc>PlvF'
-- vnoremap <A-<> di<><Esc>PlvF<
-- vnoremap <A-{> di{}<Esc>PlvF{
-- vnoremap <A-[> di[]<Esc>PlvF[
-- vnoremap <A-(> di()<Esc>PlvF(
