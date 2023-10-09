local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	},
	{
		"nvim-treesitter/nvim-treesitter"
	},
	{
		"neovim/nvim-lspconfig"
	},
	{
		"morhetz/gruvbox"
	},
	{
		"windwp/nvim-autopairs"
	},
	--autocompltedt
	{'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'},
	{
		"akinsho/bufferline.nvim"
	},
	{
		"nvim-lualine/lualine.nvim"
	},
	{
		"nvim-telescope/telescope.nvim"
	},
})
