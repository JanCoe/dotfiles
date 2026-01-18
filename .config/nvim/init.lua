vim.g.mapleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")

vim.lsp.enable({
  "bashls",
  "clangd",
  "lua_ls",
  "mutt_ls",
  "pyright",
  "ruff",
  "rust_analyzer",
  "tinymist",
  "yamlls"
})
