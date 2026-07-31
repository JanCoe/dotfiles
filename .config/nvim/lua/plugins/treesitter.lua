return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  opts = {
    ensure_installed = {
      "bash", "c", "html", "json", "lua", "markdown", "markdown_inline",
      "python", "query", "regex", "rust", "vim", "vimdoc", "yaml",
    },
    sync_install = true,
    auto_install = true,
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
  },
}
