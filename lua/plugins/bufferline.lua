require("bufferline").setup {
    options = {
        mode = 'buffers',
        -- diagnostics = 'coc',
        offsets = {
            {
                filetype = "neo-tree",
                text = "Файловый менеджер",
                highlight = "Directory",
                separator = true,
            }
        },
    },
}
