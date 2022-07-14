return {
	handlers = {
		["textDocument/publishDiagnostics"] = function(...) end,
	},
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
