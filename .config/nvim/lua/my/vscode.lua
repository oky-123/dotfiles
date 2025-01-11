local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- nnoremap gH <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
local function keymap_n(lhs, rhs)
  keymap("n", lhs, rhs, opts)
end
keymap_n("gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
