vim.wo.relativenumber = true
vim.wo.number = true

vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.softtabstop = 4

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

-- The following code installs nord colortheme but there is a bug when not on latest Neovim
--local ensure_packer = function()
--    local fn = vim.fn
--    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--    if fn.empty(fn.glob(install_path)) > 0 then
--        fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
--        vim.cmd([[packadd packer.nvim]])
--    end
--end
--ensure_packer()

--require('packer').startup(function(use)
--    use {
--        'shaunsingh/nord.nvim',
--        config = function()
--            vim.cmd('colorscheme nord')
--        end
--    }
--end)

