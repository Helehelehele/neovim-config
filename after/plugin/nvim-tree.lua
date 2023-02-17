require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
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
})

vim.api.nvim_set_keymap("n", "<leader>o", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
            vim.cmd "quit"
        end
    end
})


vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not directory then
            return
        end

        -- change to the directory
        vim.cmd.cd(data.file)

        -- open the tree
        require("nvim-tree.api").tree.open()
    end
})

vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = nil })
