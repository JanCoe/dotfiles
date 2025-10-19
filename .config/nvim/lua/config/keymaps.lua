vim.g.mapleader = " "

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

map({ 'n', 'v' }, 'H', '^', { noremap = false, silent = true, desc = "Jump to first character in line" })
map({ 'n', 'v' }, 'L', '$', { noremap = false, silent = true, desc = "Jump to end of line" })
map('n', '<leader>w', ':write<CR>', { noremap = false, silent = true, desc = "Write file" })
map('n', '<leader>q', ':quit<CR>', { desc = "Quit file" })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
map('n', '<leader><Tab>', ':bnext<CR>', { desc = "Next buffer" })
map('n', '<M-Tab>', ':bnext<CR>', { desc = "Next buffer" })
