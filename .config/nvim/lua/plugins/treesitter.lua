return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash", "c", "html", "json","lua", "markdown", "markdown_inline",
        "python", "query", "regex", "rust", "vim", "vimdoc", "yaml",
      },
      ignore_install = {},
      sync_install = true,
      auto_install = true,
      modules = {},
      highlight = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
      },
    })
  end,
  }
