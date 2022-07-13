return {
	handlers = {
		["textDocument/publishDiagnostics"] = function(...) end,
	},
	settings = {
		python = {
			pyright = {
				disableLanguageServices = false,
			},
			pythonPath = "python",
			venvPath = vim.fn.expand("~/.conda/envs/"),
			analysis = {
				autoImportCompletions = true,
				autoSearchPaths = true,
				diagnosticMode = "workspace",
				diagnosticSeverityOverrides = {},
				extraPaths = { "src", "python" },
				logLevel = "Warning",
				stubPath = "typings",
				typeCheckingMode = "off",
				typeshedPaths = {},
				useLibraryCodeForTypes = true,
			},
		},
	},
}
