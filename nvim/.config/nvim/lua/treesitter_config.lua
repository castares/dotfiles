require('nvim-treesitter.configs').setup({
	ensure_installed ="javascript","html","css",

	highlight = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "gnn",
			scope_incremental = "gnc",
			node_decremental = "gnd",
		},
	},

	indent = {
		enable = true
	},
})

-- vim.api.nvim_exec([[
-- 	set foldmethod=expr
-- 	set foldexpr=nvim_treesitter#foldexpr()
-- ]], false)
