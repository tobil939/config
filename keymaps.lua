-- ~/nvim/lua/config/keymaps.lua
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  local luasnip = require("luasnip")
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n", true)
  end
end, { silent = true })

vim.keymap.set("i", "<Enter>", function()
  if require("luasnip").expandable() then
    require("luasnip").expand()
  end
end, { silent = true })

vim.keymap.set("i", "<CR>", "<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "[{", "{", { noremap = true, silent = true })
vim.keymap.set("n", "]}", "}", { noremap = true, silent = true })

-- Beispiel: AerialOpen mit <CR> + "a"
vim.api.nvim_set_keymap('n', '<C-m>', ':AerialOpen<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>") -- Öffnen/Schließen mit Ctrl+n
vim.api.nvim_set_keymap('n', '<C-j>', ':lua require("aerial").next()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':lua require("aerial").prev()<CR>', { noremap = true, silent = true })



vim.keymap.set("n", "<C-t>", function()
  vim.cmd("tabnew")
  if pcall(vim.cmd, "AerialToggle") then
    print("Aerial geöffnet")
  end
  if pcall(vim.cmd, "NvimTreeToggle") then
    print("NvimTree geöffnet")
  end
end, { noremap = true, silent = true })

-- In deiner keymaps.lua
vim.keymap.set("n", "<C-/>", function()
  local dir = vim.fn.expand("%:p:h")
  vim.cmd("ToggleTerm dir=" .. vim.fn.shellescape(dir))
end, { noremap = true, silent = true })

-- In ~/.config/nvim/init.lua
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

