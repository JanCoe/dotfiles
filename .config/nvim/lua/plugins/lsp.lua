return {
  "neovim/nvim-lspconfig",
  lazy = true,
  dependencies = {
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
  config = function()
    require("lspconfig").lua_ls.setup {} -- activate lua lsp
    require("lspconfig").ruff.setup({
      init_options = {
        settings = {
          linelength = 108,
        }
      }
    })
  end,
  event = { "BufReadPre", "BufNewFile" }, -- load on buffer open
}
