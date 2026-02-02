return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      defaults = {
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        path_display = { "smart" },
        file_ignore_patters = {
          "%.venv/",
          "venv/",
          "target/",
          "__pycache__/",
          "%.git/",
        },
      },
    })
    telescope.load_extension('fzf')
  end
}
