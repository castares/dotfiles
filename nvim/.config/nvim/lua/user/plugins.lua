local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Basics
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("lewis6991/impatient.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Text Objects and Motions
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("moll/vim-bbye")
	use("tpope/vim-repeat")
	use("tpope/vim-eunuch") --Extra Commands
	use("tpope/vim-surround") --Extra Motions
	use("szw/vim-maximizer") -- Maximize Splits
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- Navigation & TMUX
	use("christoomey/vim-tmux-navigator")

	-- IDE Tools
	use("akinsho/toggleterm.nvim")

	-- Display & Helpers
	use("kyazdani42/nvim-web-devicons")
	use("goolord/alpha-nvim")
	use("kyazdani42/nvim-tree.lua")
	use("folke/which-key.nvim")
	use("nvim-lualine/lualine.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	use("norcalli/nvim-colorizer.lua")
	use({
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		module = "persistence",
		config = function()
			require("persistence").setup({
				dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
				options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
			})
		end,
	})

	-- Colorschemes
	use("EdenEast/nightfox.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("ellisonleao/gruvbox.nvim")
	use("folke/tokyonight.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- completion for nvim-lsp
	use("hrsh7th/cmp-nvim-lua") --- completion for the vim global table

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"JoseConseco/telescope_sessions_picker.nvim",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")
	use("ahmedkhalf/project.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- DAP
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("mfussenegger/nvim-dap-python")

	-- Filetype Plugins
	use("andres-lowrie/vim-sqlx")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
