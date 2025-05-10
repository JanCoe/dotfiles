require("config.keymaps")
require("config.options")
require("config.lazy")
require("plugins.rustfmt").setup()

vim.lsp.enable({
  "bashls",
  "clangd",
  "lua_ls",
  "mutt_ls",
  "pyright",
  "ruff",
  "rust_analyzer",
  "yamlls"
})
