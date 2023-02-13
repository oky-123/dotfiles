local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.cfn_lint,
        require('null-ls').builtins.diagnostics.rubocop.with({
            prefer_local = "bundle_bin",
            condition = function(utils)
              return utils.root_has_file({ ".rubocop.yml" })
            end
        }),
        require('null-ls').builtins.completion.spell,
    },
})
