local util = require("lspconfig.util")

local root_files = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	"pyrightconfig.json",
	"environment.yml",
	"environment.yaml",
}
return {
	handlers = {
		["textDocument/publishDiagnostics"] = function(...) end,
	},
	root_dir = util.root_pattern(unpack(root_files)) or util.find_git_ancestor(),
	settings = {
		python = {
			pyright = {
				disableLanguageServices = false,
			},
			-- pythonPath = "python",
			venvPath = vim.fn.expand("~/.conda/envs/"),
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				diagnosticSeverityOverrides = {},
				extraPaths = { "src", "python", "src/python" },
				logLevel = "Warning",
				stubPath = "",
				typeCheckingMode = "off",
				typeshedPaths = {},
				useLibraryCodeForTypes = true,
			},
		},
	},
}
