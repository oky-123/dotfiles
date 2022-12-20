-- LSP Server management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }

  -- Lua
  if server == "sumneko_lua" then
    opt.settings = {
      Lua = { diagnostics = { globals = { "vim" } } }
    }
  end

  require('lspconfig')[server].setup(opt)
end })

-- Required
require('mason-lspconfig').setup({
  ensure_installed = {
    "sumneko_lua",
    "ruby_ls",
    "rust_analyzer",
    "dockerls",
    "volar",
    "tsserver",
    "html",
    "cssls",
    "jsonls",
    "yamlls",
    "bashls",
  }
})

-- UI
require("fidget").setup {}

-- Trouble(Lsp UI for Telescope)
require("trouble").setup {}

-- Keymappings
local opts = { noremap = true, silent = true }
local function keymap_n(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, opts)
end
local function keymap_x(lhs, rhs)
  vim.api.nvim_set_keymap("x", lhs, rhs, opts)
end

keymap_n('gK',         "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap_n("]g",         "<cmd>Lspsaga diagnostic_jump_next<cr>")
keymap_n("[g",         "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap_n('K',          "<cmd>Lspsaga hover_doc<CR>")
keymap_n('gr',         "<cmd>lua vim.lsp.buf.references()<CR>")
keymap_n('gd',         "<cmd>lua vim.lsp.buf.definition()<CR>")
keymap_n('gD',         "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap_n('gi',         "<cmd>lua vim.lsp.buf.implementation()<CR>")
keymap_n('gt',         "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap_n('<Leader>r',  "<cmd>lua vim.lsp.buf.rename()<CR>")
keymap_n('<Leader>ca', "<cmd>Lspsaga code_action<CR>")
keymap_x('<Leader>ca', ":<C-u>Lspsaga range_code_action<CR>")
keymap_n('gG', "<cmd>TroubleToggle<CR>")
