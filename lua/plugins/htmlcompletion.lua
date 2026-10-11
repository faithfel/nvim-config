return {
  -- LSP Configuration & Server Management
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Automatically install language servers for HTML, CSS, and JS
        ensure_installed = { "html", "cssls", "ts_ls" }, 
      })

	vim.lsp.config('ts_ls', {
	  settings = { ... }
	})

	vim.lsp.enable('ts_ls')


  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html", "css", "javascript", "typescript", "tsx" },
        highlight = { enable = true },
      })
    end,
  },

  -- Auto-formatting (Prettier)
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          html = { "prettier" },
          css = { "prettier" },
        },
        format_on_save = { timeout_ms = 500, lsp_fallback = true },
      })
    end,
  },
}

