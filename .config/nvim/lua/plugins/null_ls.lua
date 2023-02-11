local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.cfn_lint,
    null_ls.builtins.formatting.rubocop,
  },
})

-- Keymaps
local opts = { noremap = true, silent = true }
local function keymap_n(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, opts)
end

keymap_n('<Leader>f', "<cmd>lua vim.lsp.buf.format { async = false }<CR>")
