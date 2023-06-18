local n_keymap = lvim.keys.normal_mode
local x_keymap = lvim.keys.visual_mode
local v_keymap = lvim.keys.visual_block_mode
local c_keymap = lvim.keys.command_mode
local t_keymap = lvim.keys.term_mode

-- Normal --
-- knubie/vim-kitty-navigator
n_keymap["<C-h>"] = false
n_keymap["<C-j>"] = false
n_keymap["<C-k>"] = false
n_keymap["<C-l>"] = false

vim.g.kitty_navigator_no_mappings = 1

n_keymap["<M-j>"] = false
n_keymap["<M-k>"] = false

n_keymap["<M-h>"] = ":KittyNavigateLeft<cr>"
n_keymap["<M-j>"] = ":KittyNavigateDown<cr>"
n_keymap["<M-k>"] = ":KittyNavigateUp<cr>"
n_keymap["<M-l>"] = ":KittyNavigateRight<cr>"

-- Move text up and down
n_keymap["<M-J>"] = "<Esc>:m .+1<CR>"
n_keymap["<M-K>"] = "<Esc>:m .-2<CR>"

-- Better Up/Down
n_keymap["<C-j>"] = "<C-d>zz"
n_keymap["<C-k>"] = "<C-u>zz"

-- Remove search highlighting with CTRL+n
n_keymap["<C-n>"] = "<Esc>:nohl<CR>"

-- Open splits:
n_keymap["<Leader>v"] = ":vsplit<CR>"
n_keymap["<Leader>-"] = ":split<CR>"

-- Command --
-- Save and close with capital letters also
c_keymap["W"] = "w"
c_keymap["Q"] = "q"
c_keymap["X"] = "x"

-- Visual --
-- Stay in indent mode
x_keymap[">"] = ">gv"
x_keymap["<"] = "<gv"

-- Move text up and down
x_keymap["<A-u>"] = ":m .-2<CR>=="
x_keymap["<A-d>"] = ":m .+1<CR>=="
x_keymap["p"] = '"_dP'

-- Visual Block --
-- Remap Enter mode
n_keymap["<M-v>"] = "<C-v>"
-- Move text up and down
v_keymap["K"] = ":move '<-2<CR>gv-gv"
v_keymap["J"] = ":move '>+1<CR>gv-gv"
v_keymap["<A-j>"] = ":move '>+1<CR>gv-gv"
v_keymap["<A-k>"] = ":move '<-2<CR>gv-gv"

-- Terminal --
-- Better terminal navigation
t_keymap["<C-h>"] = "<C-\\><C-N><C-w>h"
t_keymap["<C-j>"] = "<C-\\><C-N><C-w>j"
t_keymap["<C-k>"] = "<C-\\><C-N><C-w>k"
t_keymap["<C-l>"] = "<C-\\><C-N><C-w>l"

-- Gitsigns --
vim.keymap.set({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>", {desc="Inner Hunk"})

-- LSP Mappings --
lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<CR>", "Goto Definition" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<CR>", "Goto References" }
lvim.lsp.buffer_mappings.normal_mode["gi"] = { "<cmd>Telescope lsp_implementation<CR>", "Goto Implementation" }
lvim.lsp.buffer_mappings.normal_mode["gt"] = { "<cmd>Telescope lsp_type_definitions<CR>",
    "Goto Type Definition" }
