require("neogit").setup {
  integrations = {
    diffview = true,
  },
}

-- Keymappings
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>n", "<cmd>Neogit<CR>", opts)
