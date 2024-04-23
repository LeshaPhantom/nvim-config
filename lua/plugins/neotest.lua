require("neotest").setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
			runner = "pytest",
			pytest_discover_instances = true,
		}),
		require("neotest-plenary"),
		require("neotest-vim-test")({
			ignore_file_types = { "python", "lua" },
		}),
	},
})
