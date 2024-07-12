return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          "node_modules",
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          --".gitignored",
        },
        always_show_by_pattern = { -- uses glob style patterns
          --".env*",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
    },
  },
  keys = {
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>fe", false },
    { "<leader>fE", false },
  },
}
