return {
  {
    "junegunn/fzf",
    build = "./install --bin", -- build the binary
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" }, -- make sure fzf is installed
  },
}
