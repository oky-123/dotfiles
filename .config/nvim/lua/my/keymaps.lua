local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function keymap_i(lhs, rhs)
  keymap("i", lhs, rhs, opts)
end

local function keymap_n(lhs, rhs)
  keymap("n", lhs, rhs, opts)
end

local function keymap_v(lhs, rhs)
  keymap("v", lhs, rhs, opts)
end

local function keymap_t(lhs, rhs)
  keymap("t", lhs, rhs, opts)
end

-- Basic keymappings
keymap_i("jj", "<Esc>")
keymap_i("kk", "<Esc>")
keymap_n("L", "$")
keymap_n("H", "^")
keymap_v("L", "$h")
keymap_v("H", "^")

-- Terminal mode
keymap_t("<Esc>", "<C-\\><C-n>")

-- Utils
keymap_n("<Leader>.", ":<C-u>source ~/.config/nvim/init.lua<CR>")

-- Buffers
keymap_n("]b", ":<C-u>bnext<CR>")
keymap_n("[b", ":<C-u>bprev<CR>")
