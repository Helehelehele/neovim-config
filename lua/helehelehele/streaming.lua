local M = {}

M.active = false

function M.setup()
    vim.api.nvim_create_user_command(
        "StreamToggle",
        function()
            M.toggle()
        end,
        {
            nargs = 0,
        })
end

function M.open()
    local otiginal_window = vim.api.nvim_get_current_win()

    vim.cmd("56vsplit")

    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(false, true)

    M.buf = buf
    M.win = win

    vim.api.nvim_win_set_buf(win, buf)

    vim.cmd("wincmd H")
    vim.api.nvim_win_set_width(win, 56)

    vim.cmd("setlocal buftype=nofile")
    vim.cmd("setlocal bufhidden=delete")
    vim.cmd("setlocal noswapfile")
    vim.cmd("setlocal nobuflisted")
    vim.cmd("setlocal winfixwidth")
    vim.cmd("setlocal nonumber")
    vim.cmd("setlocal norelativenumber")


    M.active = true

    -- When all the other windows are closed, close the streaming window
    vim.api.nvim_create_autocmd("WinClosed", {
        callback = function()
            -- Check ıf the only remaining window is the streaming window
            if M.active and vim.api.nvim_get_current_win() == M.win and #vim.api.nvim_list_wins() == 1 then
                M.close()
            end
        end
    })

    -- Focus on the original window
    vim.api.nvim_set_current_win(otiginal_window)
end

function M.close()
    -- Close buffer
    vim.api.nvim_buf_delete(M.buf, { force = true })
    vim.api.nvim_win_close(M.win, true)

    M.buf = nil
    M.win = nil

    M.active = false
end

function M.toggle()
    if M.active then
        M.close()
    else
        M.open()
    end

    M.active = not M.active
end

M.setup()

return M
