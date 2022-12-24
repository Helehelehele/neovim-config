vim.opt.nu = true
vim.opt.relativenumber = true

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

if vim.fn.has("win32") == 1 then
    vim.opt.shell = "C:/Progra~1/Git/bin/bash.exe"
    vim.opt.shellcmdflag = "--login -i -c"
    vim.opt.shellxquote = ""
end

