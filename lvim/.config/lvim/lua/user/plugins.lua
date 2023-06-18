-- Install your plugins here
lvim.builtin.lir.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.project.manual_mode = true

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

lvim.plugins = {

  -- Text Objects and Motions
  { "tpope/vim-repeat" },
  { "tpope/vim-surround" }, --Extra Motions


  -- Navigation & Kitty
  {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/"
  },

  -- UI & Helpers
  { "folke/trouble.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "stevearc/dressing.nvim" },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  {
    'declancm/maximize.nvim',
    config = function() require('maximize').setup() end
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_enabled = false,
        auto_session_create_enabled = true,
        auto_session_suppress_dirs = { "~/", "~/projects", "~/code", "~/Downloads", "~/Documents", "/" },
      })
    end,
  },

  -- Colorschemes
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim",         name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },

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
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "HiPhish/nvim-ts-rainbow2" },

  -- Git
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  {
    "TimUntersberger/neogit",
    opts = {
      integrations = { diffview = true }
    }
  },
  { "sindrets/diffview.nvim" },

  -- DAP
  { "theHamsta/nvim-dap-virtual-text" },
  { "mfussenegger/nvim-dap-python" },
  { "mxsdev/nvim-dap-vscode-js" },

  -- Neotest
  { "nvim-neotest/neotest" },
  { "nvim-neotest/neotest-python" },

  -- Filetype Plugins
  { "andres-lowrie/vim-sqlx" },
  { "fladson/vim-kitty" },
  {
    "AckslD/swenv.nvim",
    opts = {
      post_set_venv = function()
        vim.cmd.LspRestart()
      end
    }
  },
  { "simrat39/rust-tools.nvim" },
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  { "jose-elias-alvarez/typescript.nvim" }
  -- {
  --   "PedramNavid/dbtpal",
  --   config = function()
  --     local dbt = require("dbtpal")

  --     dbt.setup({
  --       -- Path to the dbt executable
  --       path_to_dbt = "dbt",
  --       -- Path to the dbt project, if blank, will auto-detect
  --       -- using currently open buffer for all sql,yml, and md files
  --       path_to_dbt_project = ".",
  --       -- Path to dbt profiles directory
  --       path_to_dbt_profiles_dir = vim.fn.expand "~/.dbt",
  --       -- Search for ref/source files in macros and models folders
  --       extended_path_search = true,
  --       -- Prevent modifying sql files in target/(compiled|run) folders
  --       protect_compiled_files = true
  --     })
  --     require('telescope').load_extension('dbtpal')
  --   end
  -- }

}
