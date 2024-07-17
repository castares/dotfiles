-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Function to set custom commentstring for dbt filetype

-- Create an autocmd to set the commentstring for dbt files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbt",
  callback = function()
    if vim.bo.filetype == "dbt" then
      vim.bo.commentstring = "-- %s"
    end
  end,
})
