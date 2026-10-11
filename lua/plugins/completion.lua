return {
  -- Core Completion Engine
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",     -- LSP completion source
      "hrsh7th/cmp-buffer",       -- Buffer text completion source
      "hrsh7th/cmp-path",         -- File system paths completion source
      "L3MON4D3/LuaSnip",         -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
      "rafamadriz/friendly-snippets", -- Predefined VS Code-like snippets
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For LuaSnip users
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),   -- Adds clean borders
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),     -- Manually trigger completion menu
          ["<C-e>"] = cmp.mapping.abort(),            -- Close completion menu
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept selected item
          
          -- Tab Navigation
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Source priority
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- 1. Language Servers
          { name = "luasnip" },  -- 2. Snippets
        }, {
          { name = "buffer" },   -- 3. Words from current buffer
          { name = "path" },     -- 4. File system paths
        }),
      })
    end,
  },
}

