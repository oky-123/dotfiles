-- Keymappings
-- local opts = { noremap = true, silent = true }
local opts = {}
vim.api.nvim_set_keymap("n", 's', "<cmd>HopWord<CR>", opts)
vim.api.nvim_set_keymap("v", 's', "<cmd>HopWord<CR>", opts)
