return {
  "Shatur/neovim-ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require("ayu").setup({
      mirage = false, -- Set to true for mirage variant, false for dark/light
      terminal = true, -- Set terminal colors
      overrides = {}, -- Custom highlight overrides
    })
    vim.cmd.colorscheme("ayu-dark") -- Choose 'ayu-dark', 'ayu-light', or 'ayu-mirage'
  end,
}

