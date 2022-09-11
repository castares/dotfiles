local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	vim.notify("plugin " .. nightfox .. " not found!")
	return
end

nightfox.setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = false, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = true, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "NONE",
			constants = "NONE",
			functions = "bold",
			keywords = "NONE",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "italic",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = true,
			visual = true,
			search = true,
		},
		modules = { -- List of various plugins and additional options
			-- ...
		},
	},
})
