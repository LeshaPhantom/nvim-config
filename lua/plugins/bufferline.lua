require("bufferline").setup({
	options = {
		mode = "buffers",
		offsets = {
			{
				filetype = "neo-tree",
				text = "Файловый менеджер",
				highlight = "Directory",
				separator = true,
			},
		},
	},
})
