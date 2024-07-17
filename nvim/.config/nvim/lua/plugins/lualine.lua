return {
  "nvim-lualine/lualine.nvim",
  opts = {
    sections = {
      lualine_y = {
        { "filetype", icon_only = false, separator = " ", padding = { left = 1, right = 1 } },
      },
      lualine_z = {
        { "location", padding = { left = 0, right = 1 } },
      },
    },
  },
}
