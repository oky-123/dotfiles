local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.cfn_lint,
    -- null_ls.builtins.formatting.rubocop,
  },
})