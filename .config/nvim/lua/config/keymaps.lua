vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- navigation
map({ 'n', 'v' }, 'H', '^', { noremap = false, silent = true, desc = "Jump to first character in line" })
map({ 'n', 'v' }, 'L', '$', { noremap = false, silent = true, desc = "Jump to end of line" })

-- file commands
map('n', '<leader>w', ':write<CR>', { noremap = false, silent = true, desc = "Write file" })
map('n', '<leader>q', ':quit<CR>', { desc = "Quit file" })

-- buffers
map('n', '<leader><Tab>', ':bnext<CR>', { desc = "Next buffer" })
map('n', '<M-Tab>', ':bnext<CR>', { desc = "Next buffer" })

-- lsp
map('n', '<F18>', vim.lsp.buf.rename, { desc = "Rename symbol" }) -- to map to Shift+F6 in JetBrains
map('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
map('n', '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "Code actions" })
-- grr native binding to get list of all uses

-- telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
map('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
map('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
map('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })
