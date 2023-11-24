-- Install your plugins here
lvim.builtin.lir.active = false
lvim.builtin.bufferline.active = false
lvim.builtin.project.manual_mode = true

-- Apply sql commentstring to dbt filetype
local ft = require("Comment.ft")
ft({ 'dbt' }, ft.get('sql'))

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
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },

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
    branch = "legacy"
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
  {
    "cappyzawa/trim.nvim",
    opts = {}
  },

  -- Colorschemes
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim",         name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  { "rmehri01/onenord.nvim" },

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
    "NeogitOrg/neogit",
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
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "PedramNavid/dbtpal",
    init = function()
      require("dbtpal").setup({
        -- Path to the dbt executable
        path_to_dbt = "dbt",
        path_to_dbt_project = "",

        -- NOTE: You may need to change this if your course has a custom profiles.yml in the project directory.
        path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),

        extended_path_search = true,
        protect_compiled_files = true,
      })

      vim.keymap.set("n", "<leader>drf", require('dbtpal').run)
      vim.keymap.set("n", "<leader>drp", require('dbtpal').run_all)
      vim.keymap.set("n", "<leader>dtf", require('dbtpal').test)
      vim.keymap.set("n", "<leader>dm", require("dbtpal.telescope").dbt_picker)

      require("telescope").load_extension("dbtpal")
    end
  },

}
