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

-- Window navigations
-- keymap_i("", "<Esc><C-w>j")
-- keymap_n("", "<C-w>j")
-- keymap_v("", "<C-w>j")
-- keymap_t("", "<C-\\><C-n><C-w>j")
-- keymap_i("¬", "<Esc><C-w>l")
-- keymap_n("¬", "<C-w>l")
-- keymap_v("¬", "<C-w>l")
-- keymap_t("¬", "<C-\\><C-n><C-w>l")
-- keymap_i("˚", "<Esc><C-w>k")
-- keymap_n("˚", "<C-w>k")
-- keymap_v("˚", "<C-w>k")
-- keymap_t("˚", "<C-\\><C-n><C-w>k")
-- keymap_i("˙", "<Esc><C-w>h")
-- keymap_n("˙", "<C-w>h")
-- keymap_v("˙", "<C-w>h")
-- keymap_t("˙", "<C-\\><C-n><C-w>h")
-- keymap_i("ø", "<Esc><C-w>o")
-- keymap_n("ø", "<C-w>o")
-- keymap_v("ø", "<C-w>o")
-- keymap_t("ø", "<C-\\><C-n><C-w>o")
