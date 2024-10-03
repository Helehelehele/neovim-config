return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
            styles = {
                comments = { italic = true },
                sidebars = "transparent",
                floats = "transparent",
            },
            on_highlights = function(hl, c)
                hl.CursorLineNr = { fg = c.orange, bold = true }
            end,
        },
    },
    {
        "f-person/auto-dark-mode.nvim",
        lazy = false,
        init = function()
            require("auto-dark-mode").setup({
                update_interval = 1000,
                set_dark_mode = function()
                    vim.api.nvim_set_option_value(
                        'background',
                        'dark',
                        { scope = 'global' }
                    )
                    vim.cmd [[colorscheme tokyonight-storm]]

                    -- vim.cmd('hi NormalFloat guibg=none')
                    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
                    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
                    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
                    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

                    if package.loaded['lualine'] then
                        require('lualine').setup {
                            options = {
                                theme = 'tokyonight',
                            }
                        }
                    end

                    if package.loaded['twilight'] then
                        require('twilight').setup {
                            dimming = {
                                term_bg = "#000000",
                            }
                        }
                    end
                end,
                set_light_mode = function()
                    vim.api.nvim_set_option_value(
                        'background',
                        'light',
                        { scope = 'global' }
                    )
                    vim.cmd [[colorscheme tokyonight-day]]

                    -- vim.cmd('hi NormalFloat guibg=none')
                    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
                    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
                    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
                    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

                    if package.loaded['lualine'] then
                        require('lualine').setup {
                            options = {
                                theme = 'tokyonight-day',
                            }
                        }
                    end

                    if package.loaded['twilight'] then
                        require('twilight').setup {
                            dimming = {
                                term_bg = "#FFFFFF",
                            }
                        }
                    end
                end,
            })
        end,
        dependencies = {
            "folke/tokyonight.nvim",
        },
    },
    {
        "folke/twilight.nvim",
    }
}
