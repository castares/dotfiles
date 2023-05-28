-- Install your plugins here
lvim.builtin.lir.active = false
lvim.builtin.bufferline.active = false

lvim.builtin.which_key.setup.plugins = {
    marks = true,         -- shows a list of your marks on ' and `
    registers = true,     -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
        enabled = true,
        suggestions = 20,
    },     -- use which-key for spelling hints
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
        operators = true,      -- adds help for operators like d, y, ...
        motions = true,        -- adds help for motions
        text_objects = true,   -- help for text objects triggered after entering an operator
        windows = false,        -- default bindings on <c-w>
        nav = true,            -- misc bindings to work with windows
        z = true,              -- bindings for folds, spelling and others prefixed with z
        g = true,              -- bindings for prefixed with g
    },
}

lvim.plugins = {

    -- Text Objects and Motions
    { "tpope/vim-repeat" },
    { "tpope/vim-eunuch" },   --Extra Commands
    { "tpope/vim-surround" }, --Extra Motions
    { "szw/vim-maximizer" },  -- Maximize Splits
    { "nvim-treesitter/nvim-treesitter-textobjects" },

    -- Navigation & Kitty
    {
        "knubie/vim-kitty-navigator",
        build = "cp ./*.py ~/.config/kitty/"
    },

    -- Display & Helpers
    {
        "folke/trouble.nvim",
    },
    { "norcalli/nvim-colorizer.lua" },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/projects", "~/code", "~/Downloads", "~/Documents", "/" },
                auto_session_create_enabled = true,
           })
        end,
    },

    -- Colorschemes
    { "EdenEast/nightfox.nvim" },
    { "catppuccin/nvim",            name = "catppuccin" },
    { "ellisonleao/gruvbox.nvim" },
    { "folke/tokyonight.nvim" },

    -- cmp plugins
    -- { "hrsh7th/cmp-nvim-lua" }, --- completion for the vim global table

    -- Telescope
    {
        "nvim-telescope/telescope-media-files.nvim",
        config = function()
            require("telescope").load_extension("media_files")
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
            require("telescope").load_extension("file_browser")
        end
    },

    -- Treesitter
    { "p00f/nvim-ts-rainbow" },

    -- Git
    { "tpope/vim-fugitive" },
    { "tpope/vim-rhubarb" },

    -- DAP
    { "mfussenegger/nvim-dap-python" },

    -- Filetype Plugins
    { "andres-lowrie/vim-sqlx" },
    { "fladson/vim-kitty" },


}
