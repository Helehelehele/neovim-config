return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
        end,
    },
    {
        "folke/which-key.nvim",
        lazy = true,
        init = function()
            require("which-key").setup({})
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        lazy = true,
        init = function()
            require("gitsigns").setup({
                current_line_blame = true,
            })
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = true,
        opts = {
            -- add any options here
        }
    },
}
