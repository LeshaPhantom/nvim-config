local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
	-- Neo-tree — это плагин для просмотра файловой системы и других древовидных структур
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
	{"nvim-treesitter/nvim-treesitter"}, -- Подсветка синтексиса
	{"neovim/nvim-lspconfig"}, -- Настройка для движками. Например, "Pyright"
	{"morhetz/gruvbox"}, -- Тема оформления. 
	--autocompltedt
	{'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'}, {'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'},
	{"akinsho/bufferline.nvim"}, -- Возможность видеть вкладки
	{"nvim-lualine/lualine.nvim"}, -- Строка состояния снизу
	{"nvim-telescope/telescope.nvim"}, -- Поиск файлов и текста в файлах
	{'numToStr/Comment.nvim', -- Возможность закомитить быстро
	opts = {},
	lazy = false,
	},
	{'pocco81/auto-save.nvim'}, -- Автосохранение при выходе в Normal
	{ -- Прогонка тестов
		"nvim-neotest/neotest",
  		dependencies = {
    			"nvim-lua/plenary.nvim",
    			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
			"folke/neodev.nvim",
			"mfussenegger/nvim-dap"
  				}
	},	
	{ -- Дебагер
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",			
			"mfussenegger/nvim-dap-python"
				}

	},
	{ -- Автозакрыте скобок(и установка)
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},
})
