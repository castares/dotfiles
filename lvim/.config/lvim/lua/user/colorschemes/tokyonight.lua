require("tokyonight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	style = "moon", -- `storm` `moon` `night` and `day`
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value `:help attr-list`
		comments = "italic",
		keywords = "NONE",
		functions = "NONE",
		variables = "NONE",
		types = "italic",
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	sidebars = { "qf", "help", "terminal", "trouble", "packer", "nvimtree" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
	day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
	hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
	dim_inactive = true, -- dims inactive windows
	lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
})
