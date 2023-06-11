local components = require("lvim.core.lualine.components")

local session_icon = {
    function()
        return "" .. lvim.icons.ui.Project .. ""
    end,
    padding = { left = 1, right = 1 },
    color = {},
    cond = nil
}

local trouble = {
	filetypes = { "Trouble" },
	sections = {
		lualine_a = { "filetype" },
	},
	inactive_sections = {},
	winbar = {},
	inactive_winbar = {},
}

lvim.builtin.lualine.sections.lualine_a = { components.mode , "mode" }
lvim.builtin.lualine.sections.lualine_y = {session_icon, require('auto-session.lib').current_session_name  }
lvim.builtin.lualine.sections.lualine_z = { components.location }
