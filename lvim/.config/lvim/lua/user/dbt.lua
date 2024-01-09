-- null-ls configuration
local formatters = require "lvim.lsp.null-ls.formatters"
local linterns = require "lvim.lsp.null-ls.linters"
formatters.setup { {
  name = "sqlfmt",
  filetypes = { "sql", "dbt", "jinja" },
} }
linterns.setup { {
  name = "sqlfluff",
  filetypes = { "sql", "dbt" },
  extra_args = { "--dialect", "bigquery" }
} }
