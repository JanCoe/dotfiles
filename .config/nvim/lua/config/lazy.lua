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

local hostname = vim.fn.hostname()
if hostname == "thinkserver" then
  MODE = "server"
else
  MODE = "dev"
end

local core_plugins = {
  require("plugins.nord"),
  require("plugins.fzf"),
  require("plugins.telescope"),
  require("plugins.zoxide"),
}

local dev_plugins = {
  require("plugins.treesitter"),
  require("plugins.mason"),
  require("plugins.masonconfig"),
  require("plugins.rufffmt"),
  require("plugins.rustfmt").setup(),
  require("plugins.comment"),
}

require("lazy").setup({
  dependencies = { "config.keymaps" },
  spec = vim.list_extend(core_plugins, MODE == "dev" and dev_plugins or {}),
  install = { colorscheme = { "nord" } },
  checker = { enabled = true },
})
