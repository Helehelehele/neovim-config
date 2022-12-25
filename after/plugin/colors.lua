
-- require('github-theme').setup({
--   theme_style = "dark_default",
--   transparent = true
-- })

-- vim.cmd('colorscheme github_dark_default')

local tokyonight = require('tokyonight')

tokyonight.setup({
    style = "moon",
    -- transparent = "true",
    sidebars = {
        "qf",
        "vista_kind",
    },
    on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.orange, bold = true }
    end,
})

tokyonight.load()

vim.cmd('colorscheme tokyonight')


vim.cmd('hi NormalFloat guibg=none')

