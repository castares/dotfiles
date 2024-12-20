return {

  -- disabled plugins
  { "akinsho/bufferline.nvim", enabled = false },

  -- Navigation & Kitty
  {
    "knubie/vim-kitty-navigator",
    build = "cp ./*.py ~/.config/kitty/",
  },

  -- UI
  {
    "declancm/maximize.nvim",
    config = function()
      require("maximize").setup()
    end,
  },
  { "cappyzawa/trim.nvim" },

  -- Colorschemes
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "ellisonleao/gruvbox.nvim" },
  { "rmehri01/onenord.nvim" },

  -- Git
  {
    "NeogitOrg/neogit",
    opts = {
      integrations = { diffview = true },
    },
    keys = {
      {
        "<leader>gn",
        function()
          require("neogit").open()
        end,
        desc = "Neogit",
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gd",
        function()
          local lib = require("diffview.lib")
          local view = lib.get_current_view()
          if view then
            -- Current tabpage is a Diffview; close it
            vim.cmd.DiffviewClose()
          else
            -- No open Diffview exists: open a new one
            vim.cmd.DiffviewOpen()
          end
        end,
        desc = "Diffview",
      },
    },
  },

  -- Filetype Plugins
  { "andres-lowrie/vim-sqlx" },
  { "fladson/vim-kitty" },
  {
    "PedramNavid/dbtpal",
    ft = {
      "sql",
      "md",
      "yaml",
    },
    config = function()
      require("dbtpal").setup({
        path_to_dbt = "dbt",
        path_to_dbt_project = "",
        path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
        extended_path_search = true,
        protect_compiled_files = true,
      })
    end,
  },
}
