return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })
  end,
}
