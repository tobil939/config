-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- Mason
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ensure_installed = {
          "latexindent",
          "stylua",
          "clang-format",
          "ormolu",
          "black",
          "asmfmt",
        },
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "L3MON4D3/LuaSnip" },
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- Manuelles Öffnen des Fensters
          ["<C-k>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Nach oben navigieren
            else
              fallback()
            end
          end, { "i" }),
          ["<C-j>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Nach unten navigieren
            else
              fallback()
            end
          end, { "i" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Nach unten navigieren
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump() -- LuaSnip-Snippet erweitern
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Nach oben navigieren
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1) -- LuaSnip zurück springen
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Enter>"] = cmp.mapping(function(fallback)
            if require("luasnip").expandable() then
              require("luasnip").expand() -- LuaSnip-Snippet erweitern
            elseif cmp.visible() then
              cmp.confirm({ select = true }) -- Vorschlag bestätigen
            else
              fallback() -- Normales Enter-Verhalten
            end
          end, { "i" }),
        }),
        snippet = {
          expand = function(args)
            require("luasnip").expand(args.body) -- LuaSnip für Snippet-Erweiterung
          end,
        },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Für nvim-cmp

      -- lsp_attach definiert LSP-spezifische Keymaps
      local lsp_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        
        -- Neue Keymaps für Diagnosen
  vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
  vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
  vim.keymap.set("n", "de", "<cmd>lua vim.diagnostic.open_float()<cr>", opts) -- Fehlerdetails anzeigen
      end

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "asm_lsp",
          "ast_grep",
          "hls",
          "texlab",
          "matlab_ls",
          "r_language_server",
          "zls",
        },
        handlers = {
          function(server_name) -- Default-Handler für alle Server
            lspconfig[server_name].setup({
              capabilities = capabilities,
              on_attach = lsp_attach,
            })
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              on_attach = lsp_attach,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } }, -- Erkennt 'vim' als global
                },
              },
            })
          end,
          ["texlab"] = function()
            lspconfig.texlab.setup({
              capabilities = capabilities,
              on_attach = lsp_attach,
            })
          end,
        },
      })
    end,
  },
}
