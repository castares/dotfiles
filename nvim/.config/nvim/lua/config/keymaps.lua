-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = LazyVim.safe_keymap_set

-- Move to window using the <ctrl> hjkl keys
-- vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-j>")
-- vim.keymap.del("n", "<C-k>")
-- vim.keymap.del("n", "<C-l>")

vim.g.kitty_navigator_no_mappings = 1

-- TODO: remove and use LazyVim defaults
map("n", "<M-h>", ":KittyNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<M-j>", ":KittyNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<M-k>", ":KittyNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<M-l>", ":KittyNavigateRight<cr>", { desc = "Go to Right Window", remap = true })
map("n", "<M-J>", "<Esc>:m .+1<CR>", { desc = "Move line down", remap = true })
map("n", "<M-K>", "<Esc>:m .-2<CR>", { desc = "Move line up", remap = true })

map("n", "<C-n>", "<C-d>zz", { desc = "Move cursor down half-page", remap = true })
map("n", "<C-p>", "<C-u>zz", { desc = "Move cursor up half-page", remap = true })
map("n", "<leader>n", "<Esc>:nohl<CR>", { desc = "Remove Highligted Content", remap = true })
map("n", "<Leader>v", ":vsplit<CR>", { desc = "Split Window Right", remap = true })
map("x", "p", '"_dP', { desc = "Replace without losing the pasted content" })
map("n", "<M-v>", "<C-v>", { desc = "Enter Visual Block Mode" })
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "Go to Left Window from Terminal" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "Go to Left Window from Terminal" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "Go to Left Window from Terminal" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "Go to Left Window from Terminal" })

map("n", "<leader>ww", ":w<CR>", { desc = "Save File" })
map("n", "<leader>wa", ":wa<CR>", { desc = "Save All" })

map("n", "<leader>qq", ":q<CR>", { desc = "Close Window" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Close All" })

map("n", "<leader>z", "<cmd>lua require('maximize').toggle()<CR>", { desc = "Maximize Window" })

-- Diagnostics
map("n", "<leader>cj", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
map("n", "<leader>ck", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })

map("n", "<leader>ut", "<cmd>:Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle inline blame" })
