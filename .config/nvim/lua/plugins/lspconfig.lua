return {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
    "mason-lspconfig.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          { path = "$(3rd)/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  event = { "BufReadPre", "BufNewFile" },
}
