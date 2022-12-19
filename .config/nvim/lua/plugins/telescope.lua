local keymap = vim.keymap.set
local builtin = require("telescope.builtin")

-- Keymaps
keymap("n", "<leader>e", builtin.find_files, {})
keymap("n", "<leader>b", builtin.buffers, {})
keymap("n", "<leader>g", builtin.live_grep, {})
keymap("n", "<leader>m", builtin.marks, {})
keymap("n", "<leader>c", builtin.commands, {})
-- Frecency
keymap("n", "<leader>a", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>", { noremap = true, silent = true })

require('telescope').load_extension('gh')
