-- mason-null-ls
require("mason-null-ls").setup({
  ensure_installed = { "prettier", "jq", "sql_formatter", "cfn_lint" }
})

local conditional = function(fn)
  local utils = require("null-ls.utils").make_conditional_utils()
  return fn(utils)
end

-- null-ls
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.sql_formatter,
    null_ls.builtins.diagnostics.cfn_lint,
    -- conditional(function(utils)
    --   return utils.root_has_file("Gemfile")
    --       and null_ls.builtins.formatting.rubocop.with({
    --         command = "bundle",
    --         args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.formatting.rubocop._opts.args),
    --       })
    --       or null_ls.builtins.formatting.rubocop
    -- end),
  },
})
