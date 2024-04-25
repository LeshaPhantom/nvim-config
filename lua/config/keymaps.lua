vim.g.mapleader = " "

-- NeoTree
vim.keymap.set("n", "<C-n>", ":Neotree left focus<CR>", { noremap = true, silent = true })

-- Global mappings lspconfig
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- Конфликт с NeoTree
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { noremap = true, silent = true })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, noremap = true, silent = true }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({
				bufnr = bufnr,
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		end, opts)
	end,
})

-- Запуст файла
local function run_curr_python_file()
	local file_name = vim.api.nvim_buf_get_name(0)

	local py_cmd = vim.api.nvim_replace_termcodes('ipython3.12 "' .. file_name .. '"<cr>', true, false, true)

	local percent_of_win = 0.5
	local curr_win_height = vim.api.nvim_win_get_height(0) -- Current window height
	local term_height = math.floor(curr_win_height * percent_of_win) -- Terminal height
	vim.cmd(":w")
	vim.cmd(":below " .. term_height .. "split | term") -- Launch terminal (horizontal split)

	vim.api.nvim_feedkeys(py_cmd, "t", false)
end

vim.keymap.set({ "n" }, "<C-r>", "", {
	desc = "Run .py file via Neovim built-in terminal",
	callback = run_curr_python_file,
})

-- Настрока горячих клавиш для работы (akinsho/bufferline.nvim)
vim.keymap.set("n", "<C-t>", "<CMD>BufferLinePick<CR>")
vim.keymap.set("n", "<leader>g", "<CMD>BufferLinePickClose<CR>")
vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "]b", "<CMD>BufferLineMoveNext<CR>")
vim.keymap.set("n", "[b", "<CMD>BufferLineMovePrev<CR>")
vim.keymap.set("n", "gs", "<CMD>BufferLineSortByDirectory<CR>")

-- Тесты

vim.keymap.set("n", "tr", ':lua require("neotest").run.run()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "tf", ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "td", ':lua require("neotest").run.run({strategy = "dap"})<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "ts", ':lua require("neotest").run.stop()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "to", ':lua require("neotest").summary.toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "tt", ':lua require("neotest").output.open()<CR>', { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"tT",
	':lua require("neotest").output.open({ enter = true })<CR>',
	{ noremap = true, silent = true }
)
vim.keymap.set("n", "tw", ':lua require("neotest").watch.toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set(
	"n",
	"t]",
	':lua require("neotest").jump.prev({ status = "failed" })<CR>',
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"t[",
	':lua require("neotest").jump.next({ status = "failed" })<CR>',
	{ noremap = true, silent = true }
)

-- Дебагер

vim.keymap.set("n", "<leader>dr", ':lua require("dapui").toggle()<CR>')
vim.keymap.set("n", "<leader>b", ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set("n", "<f5>", ':lua require"dap".continue()<cr>')
-- Убрать выделения после поиска
vim.keymap.set("n", "<esc>", ":noh<cr>")
