require("neodev").setup({
	library = { plugins = true, types = true },
	lspconfig = true,
	setup_jsonls = true,
	pathStrict = true,
	override = function(root_dir, library)
		if root_dir:find("/etc/nixos", 1, true) == 1 then
			library.enabled = true
			library.plugins = true
		end
	end,
})
