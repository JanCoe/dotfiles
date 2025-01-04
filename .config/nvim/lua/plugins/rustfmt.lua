-- Function to format Rust files on save
local function setup()
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.rs", -- Only for Rust files
    callback = function()
      vim.cmd("!cargo fmt")
    end,
  })
end

return {
  setup = setup
}
