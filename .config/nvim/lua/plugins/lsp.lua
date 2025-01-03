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
    -- activate lua lsp 
    require("lspconfig").lua_ls.setup {
      filetypes = { "lua" }
    }
    -- require("lspconfig").pyright.setup { }
    -- activate ruff for python 
    --require("lspconfig").ruff.setup({
    --  init_options = {
    --    settings = {
    --      linelength = 108,
    --    }
    --  },
    --  filetypes = { "python" } -- not sure if this is right
    --})
  end,
  event = { "BufReadPre", "BufNewFile" }, -- load on buffer open
}
