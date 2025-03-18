-- ~/nvim/lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "c", "go", "haskell", "latex", "python", "r", "zig", "asm" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
