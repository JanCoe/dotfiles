vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.scrolloff = 999
vim.opt.colorcolumn = "108"
vim.opt.wrap = false

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.showmatch = true
vim.opt.matchtime = 2

vim.opt.virtualedit = "block"
vim.opt.clipboard = "unnamedplus"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.termguicolors = true
vim.opt.ttyfast = true

-- Set up diagnostics
vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

