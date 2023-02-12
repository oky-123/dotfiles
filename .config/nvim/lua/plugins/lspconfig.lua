-- LSP Server management
local lspconfig = require('lspconfig')
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opts = {}
  opts.capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- Lua
  if server == "sumneko_lua" then
    opts.settings = {
        Lua = { diagnostics = { globals = { "vim" } } }
    }
    -- Vue
  elseif server == "volar" then
    opts.filetypes = {
        'typescript', 'javascript', 'vue', 'json',
    }
    opts.root_dir = require('lspconfig/util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json',
            'vue.config.js', '.git')
  elseif server == "sqlls" then
    opts.root_dir = require('lspconfig/util').root_pattern(".git")
    --
  elseif server == "sql-formatter" then
    opts.filetypes = {
        'sql'
    }
  end

  lspconfig[server].setup(opts)
end })

-- Ruby(without Mason)
lspconfig.solargraph.setup({
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    root_dir = require('lspconfig/util').root_pattern("Gemfile", ".git"),
    settings = {
        solargraph = {
            formatting = true,
            diagnostics = true
        }
    }
})

-- Required packages
require('mason-lspconfig').setup({
    ensure_installed = {
        "sumneko_lua",
        "rust_analyzer",
        "dockerls",
        "volar",
        "tsserver",
        "eslint",
        "html",
        "cssls",
        "jsonls",
        "bashls",
    }
})

-- UI
require("fidget").setup {}

-- Trouble(Lsp UI for Telescope)
require("trouble").setup {
    auto_open = true, -- automatically open the list when you have diagnostics
    auto_close = false, -- automatically close the list when you have no diagnostics
}

-- Keymappings
local opts = { noremap = true, silent = true }
local function keymap_n(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, opts)
end

local function keymap_x(lhs, rhs)
  vim.api.nvim_set_keymap("x", lhs, rhs, opts)
end

keymap_n('gK', "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap_n("]g", "<cmd>Lspsaga diagnostic_jump_next<cr>")
keymap_n("[g", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap_n('K', "<cmd>Lspsaga hover_doc<CR>")
keymap_n('gr', "<cmd>lua vim.lsp.buf.references()<CR>")
keymap_n('gd', "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap_n('gD', "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap_n('gi', "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap_n('gt', "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap_n('<Leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap_n('<Leader>ca', "<cmd>Lspsaga code_action<CR>")
keymap_x('<Leader>ca', ":<C-u>Lspsaga range_code_action<CR>")
keymap_n('gG', "<cmd>TroubleToggle<CR>")
keymap_n('<Leader>f', "<cmd>lua vim.lsp.buf.format { async = false, timeout = 5000 }<CR>")
