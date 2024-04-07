require'nvim-treesitter.configs'.setup {
  refactor = {
	   highlight_definitions = {
		   enable = true,
		   clear_on_cursor_move = true,
	   },
	   smart_rename = {
		   enable = true,
		   keymaps = {
			   smart_rename = "grr",
		   },
	   },
   },
   }

