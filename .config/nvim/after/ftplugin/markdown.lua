--- for text based file allow wrapping
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.list = false

--- have a bigger tabstop setting
vim.opt_local.tabstop = 8

-- remap keys (for this buffer) so that I can navigate in the usual way within the wrapped text
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }
keymap({'n', 'v'}, 'j', 'gj', opts)
keymap({'n', 'v'}, 'k', 'gk', opts)
-- start and end of line 
keymap({'n', 'v'}, 'H', 'g^', opts)
keymap({'n', 'v'}, 'L', 'g$', opts)
