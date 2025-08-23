local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  dependencies = { "config.keymaps" },
  spec = {
    require("plugins.nord"),
    require("plugins.treesitter"),
    require("plugins.mason"),
    require("plugins.masonconfig"),
    require("plugins.fzf"),
    --  require("plugins.lazydev"),
    require("plugins.zoxide"),
    require("plugins.rufffmt"),
    require("plugins.rustfmt").setup(),
    --  require("plugins.minipick"),
  },
  install = { colorscheme = { "nord" } },
  checker = { enabled = true },
})
