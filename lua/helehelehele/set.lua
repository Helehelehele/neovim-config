local vim = vim

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.fileformat = "unix"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.fn.has('win32') == 1 then
    vim.opt.guifont = "FiraCode NF:h16"
end
if vim.fn.has('macunix') == 1 then
    vim.opt.guifont = "FiraCode Nerd Font:h11"
end

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.fillchars = {
    horiz = "━",
    --   horizup = "┻",
    --   horizdown = "┳",
    --   vert = "┃",
    --   vertleft = "┫",
    --   vertright = "┣",
    --   verthoriz = "╋",im.o.fillchars = [[eob: ,
    -- fold = " ",
    foldopen = "",
    -- foldsep = " ",
    foldclose = "",
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.foldlevel = 99

if vim.fn.has("win32") == 1 then
    vim.opt.shell = "bash.exe"
    vim.opt.shellcmdflag = "--login -i -c"
    vim.opt.shellxquote = ""
end
