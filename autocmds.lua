-- ~/nvim/lua/config/autocmds.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "*.tex", "*.lua", "*.c", "*.go", "*.hs", "*.py", "*.r", "*.zig", "*.asm" },
  command = "FormatWrite",
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.line2byte("$") == -1 then
      require("alpha").start()
    end
    if vim.fn.argc() > 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
