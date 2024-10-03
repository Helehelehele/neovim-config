return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                sort_by = "case_sensitive",
                view = {
                    adaptive_size = true,
                    side = "right",
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
                update_focused_file = {
                    enable = true,
                },
                tab = {
                    sync = {
                        open = true,
                        close = true,
                    }
                },
            }

            vim.api.nvim_set_keymap(
                "n",
                "<leader>o",
                ":NvimTreeToggle<CR>",
                { noremap = true, silent = true }
            )
        end,
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")

            local function opts(desc)
                return {
                    desc = "nvim-tree: " .. desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
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
        },
        init = function()
            vim.api.nvim_create_autocmd({
                    "WinScrolled",
                    "BufWinEnter",
                    "CursorHold",
                    "InsertLeave",

                    -- include these if you have set `show_modified` to `true`
                    "BufWritePost",
                    "TextChanged",
                    "TextChangedI",
                },
                {
                    group = vim.api.nvim_create_augroup("barbecue#create_autocmd", {}),
                    callback = function()
                        require("barbecue.ui").update()
                    end,
                }
            )
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
        config = function()
            vim.opt.list = true
            vim.opt.listchars:append("eol:↴")
            require("ibl").setup()
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,       -- add a border to hover docs and signature help
            },
            view = "mini",
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'tokyonight',
                    section_separators = { '', '' },
                    component_separators = { '', '' },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch' },
                    lualine_c = { 'filename', 'diagnostics' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        end
    },
    {
        'alvarosevilla95/luatab.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        init = function()
            require('luatab').setup {}
        end,
    }
}
