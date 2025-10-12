return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup({
      sticky = false
    })

    -- Keymaps
    vim.keymap.set("n", "<C-/>", function()
      require("Comment.api").toggle.linewise.current()
    end, { noremap = true, silent = true, desc = "Toggle comment on line" })

    vim.keymap.set("v", "<C-/>", function()
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
      vim.api.nvim_feedkeys(esc, "nx", false)
      require("Comment.api").toggle.linewise(vim.fn.visualmode())
    end, { noremap = true, silent = true, desc = "Toggle comment on selection" })
  end,
}
