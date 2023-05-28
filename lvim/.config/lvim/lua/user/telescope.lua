require('telescope').load_extension('projects')

lvim.builtin.telescope.theme = nil
lvim.builtin.telescope.defaults.prompt_prefix = "   "
lvim.builtin.telescope.defaults.selection_caret = " "
lvim.builtin.telescope.defaults.layout_config = {
    horizontal = {
        preview_width = 0.55,
    },
    -- width = 0.95,
    -- height = 0.95,
    preview_cutoff = 120,
}

local actions = require("telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
    i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

    },
    n = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
    }
}

lvim.builtin.telescope.pickers.lsp_references = {
    theme = "ivy",
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.lsp_definitions = {
    theme = "ivy",
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.lsp_declarations = {
    theme = "ivy",
    initial_mode = "normal",
}

lvim.builtin.telescope.pickers.buffers = {
    theme = "dropdown",
    initial_mode = "normal",
    previewer = false,
    mappings = {
        i = {
            ["<C-d>"] = actions.delete_buffer,
        },
        n = {
            ["dd"] = actions.delete_buffer,
        },
    },
}

lvim.builtin.telescope.pickers.lsp_implementations = {
    theme = "ivy",
    initial_mode = "normal",
}

lvim.builtin.telescope.extensions.file_browser = {
    hidden = true,
    hijack_netrw = true,
    respect_gitignore = false,
}

lvim.builtin.telescope.extensions.projects = {
}



lvim.builtin.telescope.defaults.file_ignore_patterns = {
    ".git/",
    -- "target/",
    "docs/",
    "vendor/*",
    -- "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    -- "%.jpg",
    -- "%.jpeg",
    -- "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
    "%.burp",
    "%.mp4",
    "%.mkv",
    "%.rar",
    "%.zip",
    "%.7z",
    "%.tar",
    "%.bz2",
    "%.epub",
    "%.flac",
    "%.tar.gz",
}
