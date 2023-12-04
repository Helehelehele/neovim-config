-- require('github-theme').setup({
--   theme_style = "dark_default",
--   transparent = true
-- })

-- vim.cmd('colorscheme github_dark_default')

local auto_dark_mode = require('auto-dark-mode')

auto_dark_mode.setup({
    update_interval = 1000,
    set_dark_mode = function()
        local tokyonight = require('tokyonight')

        tokyonight.setup({
            style = "storm",
            transparent = "true",
            sidebars = {
                "qf",
                "vista_kind",
            },
            on_highlights = function(hl, c)
                hl.CursorLineNr = { fg = c.orange, bold = true }
            end,
        })

        tokyonight.load()

        vim.api.nvim_set_option('background', 'dark')
        vim.cmd('colorscheme tokyonight')

        vim.cmd('hi NormalFloat guibg=none')
    end,
    set_light_mode = function()
        local tokyonight = require('tokyonight')

        tokyonight.setup({
            style = "day",
            transparent = "true",
            sidebars = {
                "qf",
                "vista_kind",
            },
            on_highlights = function(hl, c)
                hl.CursorLineNr = { fg = c.orange, bold = true }
            end,
        })

        tokyonight.load()

        vim.api.nvim_set_option('background', 'light')
        vim.cmd('colorscheme tokyonight')

        vim.cmd('hi NormalFloat guibg=none')
    end,
})
