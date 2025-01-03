local keymap = vim.keymap.set
local builtin = require("telescope.builtin")

require('telescope').load_extension('gh')
require("telescope").load_extension("frecency")

-- Keymaps
-- keymap("n", "<leader>e", builtin.find_files, {})
keymap("n", "<leader>e",
  "<Cmd>lua require'telescope.builtin'.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } })<CR>", {})
keymap("n", "<leader>b", builtin.buffers, {})
keymap("n", "<leader>g", builtin.live_grep, {})
keymap("n", "<leader>m", builtin.marks, {})
keymap("n", "<leader>c", builtin.commands, {})
keymap("n", "<leader>K", builtin.grep_string)
keymap("n", "<leader>a", "<Cmd>lua require('telescope').extensions.frecency.frecency({ workspace = 'CWD' })<CR>",
  { noremap = true, silent = true })
keymap("n", "<leader>B", "<Cmd>Telescope git_branches<CR>", { noremap = true, silent = true })
