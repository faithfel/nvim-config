require("lazy").setup({
  spec = {
    -- 1. First: LazyVim core plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    
    -- 2. Second: Any LazyVim extras
    { import = "lazyvim.plugins.extras.lang.typescript" }, -- example extra
    { import = "lazyvim.plugins.extras.lang.json" },       -- example extra
    
    -- 3. Last: Your own custom plugins
    { import = "plugins" },
  },
  -- ... other options
})

