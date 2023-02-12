local autocmd = vim.api.nvim_create_autocmd

-- FileTypes
local function register_filetype(pattern, filetype)
  autocmd({ "BufRead", "BufNewFile" }, {
      pattern = pattern,
      command = "set filetype=" .. filetype
  })
end

register_filetype("*.nim", "nim")
register_filetype("*.{md,mdwn,mkd,mkdn}", "markdown")
register_filetype("*.tsx", "typescript")
register_filetype("*.kt", "kotlin")
register_filetype("*.slim", "slim")
register_filetype("*.{jb,json.jbulder}", "ruby")

-- sw, sts, ts, et
local function register_indent(filetype, command)
  autocmd("FileType", {
      pattern = filetype,
      command = command
  })
end

register_indent("c",          "setlocal sw=2 sts=2 ts=2 et")
register_indent("cpp",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("sh",         "setlocal sw=2 sts=2 ts=2 et")
register_indent("go",         "setlocal sw=4 sts=4 ts=4")
register_indent("php",        "setlocal sw=4 sts=4 ts=4 et")
register_indent("ruby",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("slim",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("python",     "setlocal sw=4 sts=4 ts=4 et")
register_indent("nim",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("java",       "setlocal sw=4 sts=4 ts=4 et")
register_indent("scala",      "setlocal sw=4 sts=4 ts=4 et")
register_indent("kotlin",     "setlocal sw=4 sts=4 ts=4 et")
register_indent("html",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("css",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("scss",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("sass",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("javascript", "setlocal sw=2 sts=2 ts=2 et")
register_indent("typescript", "setlocal sw=2 sts=2 ts=2 et")
register_indent("vue",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("json",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("rust",       "setlocal sw=4 sts=4 ts=4 et")
register_indent("yaml",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("toml",       "setlocal sw=2 sts=2 ts=2 et")
register_indent("xml",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("markdown",   "setlocal sw=2 sts=2 ts=2 et")
register_indent("sql",        "setlocal sw=4 sts=4 ts=4 et")
register_indent("vim",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("lua",        "setlocal sw=2 sts=2 ts=2 et")
register_indent("nginx",      "setlocal sw=4 sts=4 ts=4 et")
register_indent("nerdtree",   "setlocal signcolumn=no")
