if vim.fn.has('macunix') == 1 then
    require('silicon').setup({
        font = 'FiraCode Nerd Font=16',
        theme = 'tokyonight_storm',
        backgrorund = '#1d1f29',
        shadow = {
            blur_radius = 46.0,
            offset_x = 2,
            offset_y = 4,
            color = '#555'
        },
        pad_horiz = 48,
        pad_vert = 24,
        line_pad = 4,
    })
end
