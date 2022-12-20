require("zen-mode").setup {
    backdrop = 1,
    options = {
        number = true,
        relativenumber = true,
    },
}

vim.keymap.set("n", "<leader>Z", ":ZenMode<CR>", { noremap = true, silent = true })

