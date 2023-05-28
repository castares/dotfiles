-- default LunarVim options: https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/config/settings.lua
vim.g.python3_host_prog = vim.fn.expand("~/.conda/envs/neovim/bin/python3.9")

vim.opt.errorbells = true
vim.opt.showtabline = 1 -- 2 for always show tabline
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4
vim.opt.tabstop = 4 -- insert # spaces for a tab
vim.opt.cursorline = true -- highlight the current line
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.wrap = true -- display lines as one long line
vim.opt.showcmd = true -- Show input in normal mode
vim.opt.guifont = "Hack:h12" -- the font used in graphical neovim applications

vim.opt.matchpairs:append("<:>")
vim.cmd("set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<") --enable with :set list
