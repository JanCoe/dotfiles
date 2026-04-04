return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end, desc = 'Find files' },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end,  desc = 'Live grep' },
    { '<leader>fb', function() require('telescope.builtin').buffers() end,    desc = 'Find buffers' },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,  desc = 'Find help' },
    { '<leader>fd', function() require('telescope.builtin').diagnostics() end, desc = 'Find diagnostics' },
  },
  config = function()
    local telescope = require('telescope')
    -- local builtin = require('telescope.builtin')

    telescope.setup({
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        path_display = { "smart" },
        file_ignore_patterns = {
          "%.venv/",
          "venv/",
          "__pycache__/",
          "node_modules/",
          "%.git/",
        },
      },
    })
    telescope.load_extension('fzf')
  end
}
