lvim.builtin.which_key.setup.plugins = {
  marks = true,     -- shows a list of your marks on ' and `
  registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  spelling = {
    enabled = true,
    suggestions = 20,
  }, -- use which-key for spelling hints
  -- the presets plugin, adds help for a bunch of default keybindings in Neovim
  -- No actual key bindings are created
  presets = {
    operators = true,    -- adds help for operators like d, y, ...
    motions = true,      -- adds help for motions
    text_objects = true, -- help for text objects triggered after entering an operator
    windows = false,     -- default bindings on <c-w>
    nav = true,          -- misc bindings to work with windows
    z = true,            -- bindings for folds, spelling and others prefixed with z
    g = true,            -- bindings for prefixed with g
  },
}

-- Change 2 split windows from vert to horiz or horiz to vert
lvim.builtin.which_key.mappings["sv"] = { "<C-w>t<C-w>H", "Switch Layout Vertical" }
lvim.builtin.which_key.mappings["so"] = { "<C-w>t<C-w>K", "Switch Layout Horizontal" }

lvim.builtin.which_key.mappings["f"] = {
  function()
    require("lvim.core.telescope.custom-finders").find_project_files()
  end,
  "Find Files",
}

lvim.builtin.which_key.mappings["F"] = {
  function()
    require("telescope.builtin").live_grep()
  end,
  "Live Grep",
}

lvim.builtin.which_key.mappings["b"] = {
  function()
    require("telescope.builtin").buffers()
  end,
  "Find Buffers",
}

lvim.builtin.which_key.mappings["P"] = {
  function()
    require('telescope').extensions.projects.projects()
  end,
  "Select Project",
}

lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }

lvim.builtin.which_key.mappings["z"] = { "<cmd>lua require('maximize').toggle()<CR>", "Maximize Split" }

lvim.builtin.which_key.mappings["x"] = {
  name = "Save and Quit",
  a = { "<cmd>xa<CR>", "Save All and Quit" },
  x = { "<cmd>x<CR>", "Save Buffer and Quit" }
}

lvim.builtin.which_key.mappings["q"] = {
  name = "Quit",
  a = { "<cmd>lua require('user.functions').smart_quit()<cr>", "Quit All" },
  q = { "<cmd>q<CR>", "Quit Buffer" }
}

lvim.builtin.which_key.mappings["w"] = {
  name = "Quit",
  a = { "<cmd>wa<CR>", "Save All" },
  w = { "<cmd>w<CR>", "Save Buffer" }
}

lvim.builtin.which_key.mappings["e"] = {
  name = "File Browser",
  e = { "<cmd>Telescope file_browser files=false hidden=true<cr>", "Folder Browser" },
  f = { "<cmd>Telescope file_browser path=%:p:h cwd_to_path=true hidden=true<cr>", "File Browser" },
  t = { "<cmd>NvimTreeToggle<CR>", "Tree Explorer" }
}

-- Git
lvim.builtin.which_key.mappings["g"]["g"] = nil
lvim.builtin.which_key.mappings["g"]["g"] = { "<cmd>:Neogit<cr>", "Neogit" }
lvim.builtin.which_key.mappings["gs"] = { "<cmd>Telescope git_status<CR>", "Git Status" }
lvim.builtin.which_key.mappings["go"] = nil
lvim.builtin.which_key.mappings["gb"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Line Blame" }
lvim.builtin.which_key.mappings["gB"] = { "<cmd>:Git blame<cr>", "Git Blame" }
lvim.builtin.which_key.mappings["gc"] = nil

-- Search
lvim.builtin.which_key.mappings["sc"] = { "<cmd>Telescope git_commits<cr>", "Checkout Commit" }
lvim.builtin.which_key.mappings["sk"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" }
lvim.builtin.which_key.mappings["sd"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" }
lvim.builtin.which_key.mappings["sg"] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Grep String" }
lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Switch Env" }
lvim.builtin.which_key.mappings["ss"] = {
  function()
    require('auto-session.session-lens').search_session()
  end,
  "Select Session",
}

-- Sessions
lvim.builtin.which_key.mappings["S"] = {
  name = "Sessions",
  s = { "<cmd>:SessionSave<cr>", "Session Save" },
  r = { "<cmd>:SessionRestore<cr>", "Session Restore" },
  d = { "<cmd>:SessionDelete<CR>", "Session Delete" },
}

-- LSP
lvim.builtin.which_key.mappings["lF"] = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" }


lvim.builtin.which_key.mappings["d"] = {
  name = "Diagnostics",
  f = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  l = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next()<CR>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    "Prev Diagnostic",
  },
}


lvim.builtin.which_key.mappings["t"] = {
  name = "Tests/Tabs",
  -- Tests
  s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
  r = { "<cmd>lua require('neotest').run.run()<cr>", "Run Test" },
  d = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Run Test in DAP" },
  R = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
  D = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },

  -- Tabs
  t = {
    "<cmd>lua require('telescope').extensions['telescope-tabs'].list_tabs(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Tabs'})<cr>",
    "Find Tab",
  },
  n = { "<cmd>tabnew %<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
  o = { "<cmd>tabonly<cr>", "Only Tab" },

}

lvim.builtin.which_key.mappings["y"] = {
  name = "Debug",
  b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
  O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
  l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
  u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
  x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
}


lvim.builtin.which_key.mappings["u"] = {
  name = "UI",
  v = { "<cmd>lua vim.diagnostic.config({virtual_text=not vim.diagnostic.config().virtual_text})<CR>",
    "Toggle Virtual Text" },
  d = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
  n = {
    '<cmd>lua require("user.functions").toggle_option("number")<cr><cmd>lua require("user.functions").toggle_option("relativenumber")<cr>',
    "Toggle Numbers" },
  r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Toggle Relative Numbers" },
}
