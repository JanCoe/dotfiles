-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.relativenumber = true
vim.wo.number = true

vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

vim.o.clipboard = "unnamedplus"

vim.o.wrap = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.ttyfast = true

vim.o.showmatch = true
vim.o.matchtime = 2

vim.o.termguicolors = true

vim.o.scrolloff = 5
vim.o.colorcolumn = "108"

vim.api.nvim_set_keymap('', 'H', '^', { noremap = true, silent = true } )
vim.api.nvim_set_keymap('', 'L', '$', { noremap = true, silent = true } )

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Nord colorscheme 
    {
      "shaunsingh/nord.nvim",
      lazy = false,
      priority = 1000,
    },
    -- lsp config server 
    {
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
    },
  },

  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "nord" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Select colorscheme
vim.cmd([[colorscheme nord]])
