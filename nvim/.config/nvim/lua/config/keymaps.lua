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

map("n", "<M-h>", ":KittyNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<M-j>", ":KittyNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<M-k>", ":KittyNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<M-l>", ":KittyNavigateRight<cr>", { desc = "Go to Right Window", remap = true })

-- Move text up and down
map("n", "<M-J>", "<Esc>:m .+1<CR>", { desc = "Move line down", remap = true })
map("n", "<M-K>", "<Esc>:m .-2<CR>", { desc = "Move line up", remap = true })

-- Better Up/Down
map("n", "<C-j>", "<C-d>zz", { desc = "Move cursor down half-page", remap = true })
map("n", "<C-k>", "<C-u>zz", { desc = "Move cursor up half-page", remap = true })
