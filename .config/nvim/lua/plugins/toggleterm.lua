require("toggleterm").setup {}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- Keymaps
keymap("n", "<Leader>1", ":ToggleTerm 1 direction=float<CR>", opts)
keymap("n", "<Leader>2", ":ToggleTerm 2 direction=float<CR>", opts)
keymap("n", "<Leader>3", ":ToggleTerm 3 direction=float<CR>", opts)
keymap("n", "<Leader>4", ":ToggleTerm 4 direction=float<CR>", opts)
keymap("n", "<Leader>5", ":ToggleTerm 5 direction=float<CR>", opts)
