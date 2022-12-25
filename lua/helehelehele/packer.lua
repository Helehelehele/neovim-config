vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use({
        'projekt0n/github-nvim-theme',
        config = function()
        end
    })

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use('theprimeagen/harpoon')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")

    use("RRethy/vim-illuminate")

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use 'kyazdani42/nvim-web-devicons'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'p00f/nvim-ts-rainbow'

    use 'tpope/vim-commentary'

    use { 'stevearc/dressing.nvim' }

    use 'JoosepAlviste/nvim-ts-context-commentstring'

    use { 'alvarosevilla95/luatab.nvim', requires = 'kyazdani42/nvim-web-devicons' }

    -- use { 'justinhj/battery.nvim',
    --     config = function()
    --         require('battery').setup()
    --     end
    -- }

    use 'folke/tokyonight.nvim'

    use {
       'narutoxy/dim.lua',
        config = function()
            require('dim').setup()
        end
    }
end)
