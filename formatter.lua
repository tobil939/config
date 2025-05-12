-- ~/nvim/lua/plugins/formatter.lua
return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          tex = { function() return { exe = "latexindent", args = { "-y", '{"indent": "    "}' }, stdin = true } end },
          lua = { function() return { exe = "stylua", args = { "--indent-type", "Spaces", "--indent-width", "2", "-" }, stdin = true } end },
          c = { function() return { exe = "clang-format", args = { "-style=google" }, stdin = true } end },
          go = { function() return { exe = "gofmt", args = {}, stdin = true } end },
          -- haskell = { function() return { exe = "ormolu", args = { "--mode", "inplace" }, stdin = false } end },
          python = { function() return { exe = "black", args = { "-q", "-" }, stdin = true } end },
          -- r = { function() return { exe = "R", args = { "--slave", "-e", "'styler::style_file(commandArgs(TRUE))'", "--args" }, stdin = false } end },
          zig = { function() return { exe = "zig", args = { "fmt", "--stdin" }, stdin = true } end },
          asm = { function() return { exe = "asmfmt", args = {}, stdin = true } end },
        },
      })
    end,
  },
}
