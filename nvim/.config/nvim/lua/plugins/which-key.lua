return {
  "folke/which-key.nvim",
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true,
        suggestions = 20,
      }, -- use which-key for spelling hints
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = true, -- adds help for operators like d, y, ...
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = false, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    defaults = {
      -- mode = { "n", "v" },
      -- ["gs"] = { name = "+surround" },
      -- ["z"] = { name = "+fold" },
      -- ["]"] = { name = "+next" },
      -- ["["] = { name = "+prev" },
      -- ["<leader><tab>"] = { name = "+tabs" },
      -- ["<leader>b"] = { name = "+buffer" },
      -- ["<leader>c"] = { name = "+code" },
      -- ["<leader>f"] = { name = "+file/find" },
      -- ["<leader>g"] = { name = "+git" },
      -- ["<leader>gh"] = { name = "+hunks", ["_"] = "which_key_ignore" },
      -- ["<leader>q"] = { name = "+quit/session" },
      -- ["<leader>s"] = { name = "+search" },
      -- ["<leader>u"] = { name = "+ui" },
      -- ["<leader>w"] = { name = "+windows" },
      -- ["<leader>x"] = { name = "+diagnostics/quickfix" },
    },
  },
}
