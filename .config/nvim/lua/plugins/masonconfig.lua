return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = { "mason-org/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "clangd",
        "lua_ls",
        "mutt_ls",
        "pyright",
        "ruff",
        "rust_analyzer",
        "yamlls"
      },
      automatic_installation = true,
    })
  end,
}
