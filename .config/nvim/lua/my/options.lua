local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 16,
  showmode = false,
  showtabline = 0,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  shell = "zsh",
  backupskip = { "/tmp/*", "/private/tmp/*" },
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes:5",
  wrap = true,
  winblend = 0,
  wildoptions = "pum",
  pumblend = 5,
  background = "dark",
  scrolloff = 999,
  sidescrolloff = 8,
  splitbelow = true,
  splitright = true,
  hidden = true,
  laststatus = 0,
  list = true,
  listchars = { tab = '>-', trail = '*', nbsp = '+', eol = '↴' }
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
