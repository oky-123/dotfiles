require('window-picker').setup({
    autoselect_one = true,
    include_current = false,
    filter_rules = {
        -- filter using buffer options
        bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "quickfix" },
        },
    },
    other_win_hl_color = '#e35e4f',
})

vim.keymap.set("n", "<C-w>", function()
  local picked_window_id = require('window-picker').pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { desc = "Pick a window" })
