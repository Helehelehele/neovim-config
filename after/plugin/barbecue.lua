-- triggers CursorHold event faster
vim.opt.updatetime = 200

require("barbecue").setup({
    create_autocmd = false, -- prevent barbecue from updating itself automatically
    symbols = {
        ---modification indicator
        ---@type string
        modified = "●",

        ---truncation indicator
        ---@type string
        ellipsis = "…",

        ---entry separator
        ---@type string
        separator = "",
    },
})

vim.api.nvim_create_autocmd({
    "WinScrolled",
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",

    -- include these if you have set `show_modified` to `true`
    "BufWritePost",
    "TextChanged",
    "TextChangedI",
}, {
    group = vim.api.nvim_create_augroup("barbecue#create_autocmd", {}),
    callback = function()
        require("barbecue.ui").update()
    end,
})
