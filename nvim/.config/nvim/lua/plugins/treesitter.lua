return {
  "nvim-treesitter/nvim-treesitter",
  opts = {

    textobjects = {
      select = {
        enable = true,

        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["if"] = { query = "@function.inner", desc = "inner function" },
          ["af"] = { query = "@function.outer", desc = "outer function" },
          ["ic"] = { query = "@class.inner", desc = "inner class" },
          ["ac"] = { query = "@class.outer", desc = "outer class" },
          ["at"] = { query = "@call.outer", desc = "call outer" },
          ["it"] = { query = "@call.inner", desc = "call inner" },
          ["aa"] = { query = "@parameter.outer", desc = "parameter outer" },
          ["ia"] = { query = "@parameter.inner", desc = "parameter inner" },
          ["al"] = { query = "@loop.outer", desc = "loop outer" },
          ["il"] = { query = "@loop.inner", desc = "loop inner" },
          ["ai"] = { query = "@conditional.outer", desc = "conditional outer" },
          ["ii"] = { query = "@conditional.inner", desc = "conditional inner" },
          ["a/"] = { query = "@comment.outer", desc = "comment outer" },
          ["i/"] = { query = "@comment.inner", desc = "comment inner" },
          ["ab"] = { query = "@block.outer", desc = "block outer" },
          ["ib"] = { query = "@block.inner", desc = "block inner" },
          ["as"] = { query = "@statement.outer", desc = "statement outer" },
          ["is"] = { query = "@scopename.inner", desc = "scopename inner" },
          ["aA"] = { query = "@attribute.outer", desc = "attribute outer" },
          ["iA"] = { query = "@attribute.inner", desc = "attribute inner" },
          ["aF"] = { query = "@frame.outer", desc = "frame outer" },
          ["iF"] = { query = "@frame.inner", desc = "frame inner" },
        },
        -- You can choose the select mode (default is charwise 'v')
        selection_modes = {
          ["@parameter.outer"] = "v", -- charwise
          ["@function.outer"] = "V", -- linewise
          ["@class.outer"] = "<c-v>", -- blockwise
        },
        -- If you set this to `true` (default is `false`) then any textobject is
        -- extended to include preceding xor succeeding whitespace. Succeeding
        -- whitespace has priority in order to act similarly to eg the built-in
        -- `ap`.
        include_surrounding_whitespace = false,
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>>"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader><"] = "@parameter.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["gj"] = "@function.outer",
        },
        goto_previous_start = {
          ["gk"] = "@function.outer",
        },
      },
    },
  },
}
