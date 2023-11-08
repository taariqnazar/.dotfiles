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
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("justinmk/vim-sneak")
	use("mhinz/vim-startify")
	use("jiangmiao/auto-pairs")
	use("nvim-lua/plenary.nvim")
	use("nvim-lualine/lualine.nvim")
	use("romgrk/barbar.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("nvim-tree/nvim-tree.lua")

	-- snippets
	use({ "L3MON4D3/LuaSnip" })

	-- CMP & LSP
	use("williamboman/nvim-lsp-installer")
	use({
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"saadparwaiz1/cmp_luasnip",
		"jose-elias-alvarez/null-ls.nvim",
		"MunifTanjim/prettier.nvim",
	})

	-- Appearance
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("onsails/lspkind-nvim")
	use({
		"morhetz/gruvbox",
		config = function()
			vim.cmd.colorscheme("gruvbox")
		end,
	})
	use("ryanoasis/vim-devicons")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-treesitter/nvim-treesitter")
	--

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
	-- Git
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")

	-- Latex
	use("lervag/vimtex")

	use("christoomey/vim-tmux-navigator")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
