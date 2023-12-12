-- mason-null-ls
require("mason-null-ls").setup({
  ensure_installed = { "prettier", "jq", "sql_formatter", "cfn_lint", "rubocop" }
})

-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.jq,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.diagnostics.cfn_lint,
    null_ls.builtins.diagnostics.rubocop.with({
      prefer_local = "bundle_bin",
      condition = function(utils)
        return utils.root_has_file({ ".rubocop.yml" })
      end
    }),
  },
})
