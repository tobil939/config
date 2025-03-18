return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: für Datei-Icons
  config = function()
    require("nvim-tree").setup({
      view = { side = "left", width = 30 },
    })
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>") -- Öffnen/Schließen mit Ctrl+n
  end,
}
