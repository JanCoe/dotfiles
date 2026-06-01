return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- lazy loaded on file open
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
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
}
