vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "projekt0n/github-nvim-theme",
        config = function() end,
    })

    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("nvim-treesitter/playground")

    use("theprimeagen/harpoon")
    use("tpope/vim-fugitive")

    use("APZelos/blamer.nvim")

    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    -- null-ls
    use({
        "jay-babu/mason-null-ls.nvim",
        requires = {
            "jose-elias-alvarez/null-ls.nvim",
            "williamboman/mason.nvim",
        },
    })

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")

    use("RRethy/vim-illuminate")

    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })

    use("kyazdani42/nvim-web-devicons")

    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use("p00f/nvim-ts-rainbow")

    use("tpope/vim-commentary")

    use({ "stevearc/dressing.nvim" })

    use("JoosepAlviste/nvim-ts-context-commentstring")

    use({
        "alvarosevilla95/luatab.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    })

    -- use { 'justinhj/battery.nvim',
    --     config = function()
    --         require('battery').setup()
    --     end
    -- }

    use("folke/tokyonight.nvim")

    use({
        "narutoxy/dim.lua",
        config = function()
            require("dim").setup({})
        end,
    })

    use({
        "folke/twilight.nvim",
    })

    -- Only load on Mac
    if vim.fn.has("macunix") == 1 then
        use({ "krivahtoo/silicon.nvim", run = "./install.sh build" })
    end

    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })

    use({
        "utilyre/barbecue.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    })

    use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    use({
        "nvim-tree/nvim-tree.lua",
    })

    use("fedepujol/move.nvim")

    use("lewis6991/impatient.nvim")

    use("lukas-reineke/indent-blankline.nvim")

    use({
        "m4xshen/smartcolumn.nvim",
        config = function()
            require("smartcolumn").setup({
                custom_colorcolumn = {
                    python = 120,
                    python3 = 120,
                },
            })
        end,
    })

    use("anuvyklack/pretty-fold.nvim")

    use({
        "anuvyklack/fold-preview.nvim",
        requires = "anuvyklack/keymap-amend.nvim",
    })

    use("mg979/vim-visual-multi")

    use({ "kartikp10/noctis.nvim", requires = { "rktjmp/lush.nvim" } })

    use({
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup()
        end
    })

    use 'f-person/auto-dark-mode.nvim'
end)
