vim.opt.termguicolors = true

function SetColor(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
end

SetColor()
