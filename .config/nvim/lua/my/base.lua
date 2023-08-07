vim.scriptencoding = 'utf-8'

local autocmd = vim.api.nvim_create_autocmd

-- -- Remove whitespaces
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.fn.getpos(".")
    vim.api.nvim_exec(":%s/\\s\\+$//e", false)
    vim.fn.setpos(".", pos)
  end,
})

-- Restore cursor when open file
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- Auto format
autocmd("BufWritePre", {
  pattern = "*.rb,*.ts",
  callback = function()
    vim.lsp.buf.format { async = false }
  end
})
