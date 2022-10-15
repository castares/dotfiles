local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	--[[ ["e"] = { "<cmd>Telescope file_browser<cr>", "File Manager" }, ]]
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>",
		"Find files",
	},
	["F"] = {
		"<cmd>lua require('telescope.builtin').live_grep({hidden=true})<cr>",
		"Find files",
	},
	["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	["S"] = { "<cmd>lua require('session-lens').search_session()<cr>", "Sessions" },
	["m"] = { "<cmd>MaximizerToggle<cr>", "Maximmize Split" },

	e = {
		name = "File Browser",
		e = { "<cmd>Telescope file_browser files=false<cr>", "Folder Browser" },
		f = { "<cmd>Telescope file_browser path=%:p:h cwd_to_path=true<cr>", "File Browser" },
	},
	p = {
		name = "Packer/Projects",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
		r = { "<cmd>ProjectRoot<cr>", "Project Root" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		b = { "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<CR>", "Current Line Blame" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		d = { "<cmd>lua require 'gitsigns'.diffthis()<CR>", "Diffthis" },
		D = { "<cmd>Gitsigns toggle_deleted<CR>", "Toggle Deleted" },
	},

	h = {
		name = "Git Hunk Operations",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Previous Hunk" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
	},

	d = {
		name = "Diagnostics",
		f = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
		w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
		l = { "<cmd>lua vim.diagnostic.open_float({ border = 'rounded' })<CR>", "Line Diagnostics" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
	},

	r = {
		name = "Debugger",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Run Last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
		t = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
	},
	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
		h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		n = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		r = { "<cmd>Trouble lsp_references<CR>", "References" },
	},
	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		g = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", "Grep String" },
		f = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "File Search" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		w = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		t = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=20 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
