return {
  {
    "junegunn/fzf",
    build = vim.fn.has("win32") == 0 and "./install --bin" or nil, -- build the binary on Linux only
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" }, -- make sure fzf is installed
  },
}
