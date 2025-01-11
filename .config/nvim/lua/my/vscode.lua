local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- nnoremap gH <Cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>
local function keymap_n(lhs, rhs)
  keymap("n", lhs, rhs, opts)
end
keymap_n("gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
keymap_n("]g", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
keymap_n("[g", "<Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>")
keymap_n("]G", "<Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>")
keymap_n("[G", "<Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>")
keymap_n("gA", "<Cmd>call VSCodeNotify('workbench.panel.markers.view.focus')<CR>")
