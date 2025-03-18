-- ~/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

-- LuaSnip Keymaps
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if require("luasnip").expand_or_jumpable() then
    require("luasnip").expand_or_jump()
  end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if require("luasnip").jumpable(-1) then
    require("luasnip").jump(-1)
  end
end, { silent = true })
