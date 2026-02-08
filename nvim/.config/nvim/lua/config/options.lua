-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.errorbells = true
opt.showtabline = 1 -- 2 for always show tabline
opt.wrap = true -- display lines as one long line
-- opt.guifont = "Hack:h12" -- the font used in graphical neovim applications
opt.fileformat = "unix"
opt.list = false
opt.swapfile = false
opt.listchars = "eol:$,tab:>-,trail:~,extends:>,precedes:<"
opt.matchpairs:append("<:>")

vim.g.python3_host_prog = "/Users/cesarcastanon/.pyenv/versions/neovim/bin/python3"
