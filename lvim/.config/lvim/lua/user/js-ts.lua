vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4

local formatters = require "lvim.lsp.null-ls.formatters"
local diagnostics = require "lvim.lsp.null-ls.linters"

formatters.setup({
  {
    command = "prettier",
    extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" }
  },
})

-- diagnostics.setup({
--   { command = "eslint" }
-- }
-- )

-- Filetype Mappings
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  C = {
    name = "Typescriptreact",
    i = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" },
    o = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" },
    u = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" },
    r = { "<cmd>TypescriptRenameFile<Cr>", "RenameFile" },
    f = { "<cmd>TypescriptFixAll<Cr>", "FixAll" },
    g = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" },
  },
}

which_key.register(mappings, opts)

