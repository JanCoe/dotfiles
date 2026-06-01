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
        "yamlls"
      },
      automatic_installation = true,
    })
  end,
}
