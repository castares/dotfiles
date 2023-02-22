require("nvim-tundra").setup({
	transparent_background = true,
	editor = {
		search = {},
		substitute = {},
	},
	syntax = {
		booleans = {},
		comments = { italic = true },
		conditionals = {},
		constants = {},
		functions = { bold = true },
		keywords = {},
		loops = {},
		numbers = {},
		operators = {},
		punctuation = {},
		strings = {},
		types = { italic = true },
	},
	diagnostics = {
		errors = {},
		warnings = {},
		information = {},
		hints = {},
	},
	plugins = {
		lsp = true,
		treesitter = true,
		cmp = true,
		context = true,
		dbui = true,
		gitsigns = true,
		telescope = true,
	},
	overwrite = {
		colors = {},
		highlights = {},
	},
})
