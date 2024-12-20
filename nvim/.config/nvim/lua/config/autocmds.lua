-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Function to set custom commentstring for dbt filetype

-- Create an autocmd to set the commentstring for dbt files
vim.api.nvim_create_autocmd({ "BufReadPre", "BufEnter" }, {
  pattern = "*.sql",
  callback = function()
    vim.bo.filetype = "dbt"
    vim.bo.commentstring = "-- %s"
  end,
})
