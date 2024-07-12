local actions = require("telescope.actions")

return {

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- stylua: ignore
      {
        "<leader><space>",
        LazyVim.pick("auto", { root = false }),
        desc = "Test Find Files (cwd)",
      },
      -- add a keymap to browse plugin files
      -- {
      --   "<leader>fp",
      --   function()
      --     require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      --   end,
      --   desc = "Find Plugin File",
      -- },
      {
        "<leader>ft",
        function()
          require("telescope.builtin").find_files({ search_dirs = { "target/compiled" } })
        end,
        desc = "dbt target/compiled",
      },
      {
        "<leader>fT",
        function()
          require("telescope.builtin").find_files({ search_dirs = { "target/run" } })
        end,
        desc = "dbt target/compiled",
      },
      { "<leader>fF", false },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          ".git/",
          "node_modules",
        },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
          },
        },
      },
      pickers = {
        lsp_implementations = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_references = {
          theme = "ivy",
          initial_mode = "normal",
        },

        lsp_definitions = {
          theme = "ivy",
          initial_mode = "normal",
        },

        lsp_declarations = {
          theme = "ivy",
          initial_mode = "normal",
        },
        buffers = {
          theme = "dropdown",
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
      },
      extensions = {
        file_browser = {
          hidden = true,
          hijack_netrw = true,
          respect_gitignore = false,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {
        "<leader>fe",
        "<cmd>Telescope file_browser files=false prompt_path=true<cr>",
        desc = "Folder Explorer",
      },
      {
        "<leader>fE",
        "<cmd>Telescope file_browser path=%:p:h cwd_to_path=true<cr>",
        desc = "File Explorer",
      },
    },
  },
}
