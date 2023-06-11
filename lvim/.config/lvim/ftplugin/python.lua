vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.textwidth=88
vim.opt.expandtab = true
vim.opt.fileformat='unix'


-- Advanced pyright configuration
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "jsonls" })

local pyright_opts = {
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        diagnosticMode = "workspace", -- openFilesOnly, workspace
      },
    },
  },
}

require("lvim.lsp.manager").setup("pyright", pyright_opts)

-- null-ls configuration
local formatters = require "lvim.lsp.null-ls.formatters"
local linterns = require "lvim.lsp.null-ls.linters"
formatters.setup { { name = "black" } }
linterns.setup { { name = "ruff" } }


