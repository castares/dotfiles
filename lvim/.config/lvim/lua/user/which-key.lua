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

lvim.builtin.which_key.mappings["S"] = {
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


lvim.builtin.which_key.mappings["ss"] = {
    function()
        require('auto-session.session-lens').search_session()
    end,
    "Select Session",
}

lvim.builtin.which_key.mappings["se"] = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Swicth Env" }

lvim.builtin.which_key.mappings["P"] = {
    function()
        require('telescope').extensions.projects.projects()
    end,
    "Select Project",
}

lvim.builtin.which_key.mappings["m"] = { "<cmd>MaximizerToggle<cr>", "Maximmize Split" }

lvim.builtin.which_key.mappings["x"] = {
    name = "Save and Quit",
    a = { "<cmd>xa<CR>", "Save All and Quit" },
    x = { "<cmd>x<CR>", "Save Buffer and Quit" }
}

lvim.builtin.which_key.mappings["q"] = {
    name = "Quit",
    a = { "<cmd>qa<CR>", "Quit All" },
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

lvim.builtin.which_key.mappings["gg"] = { "<cmd>:G<cr>", "Fugitive" }
lvim.builtin.which_key.mappings["gs"] = { "<cmd>Telescope git_status<CR>", "Git Status" }
lvim.builtin.which_key.mappings["go"] = nil
lvim.builtin.which_key.mappings["gb"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Line Blame" }
lvim.builtin.which_key.mappings["gB"] = { "<cmd>:Git blame<cr>", "Git Blame" }
lvim.builtin.which_key.mappings["gc"] = nil

lvim.builtin.which_key.mappings["sc"] = { "<cmd>Telescope git_commits<cr>", "Checkout Commit" }
lvim.builtin.which_key.mappings["sk"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" }
lvim.builtin.which_key.mappings["sd"] = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" }
lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" }
lvim.builtin.which_key.mappings["sg"] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Grep String" }

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