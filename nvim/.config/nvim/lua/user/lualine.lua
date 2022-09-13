local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local trouble = {
	filetypes = { "Trouble" },
	sections = {
		lualine_a = { "filetype" },
	},
	inactive_sections = {},
	winbar = {},
	inactive_winbar = {},
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			winbar = {
				"alpha",
			},
		},
		always_divide_middle = false,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { {
			"filename",
			path = 1,
		} },
		lualine_x = {},
		lualine_y = { "filetype" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {
		lualine_a = {},
		lualine_b = { {
			"filename",
			path = 1,
		} },
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { {
			"filename",
			path = 1,
		} },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	extensions = { "toggleterm", trouble },
})
