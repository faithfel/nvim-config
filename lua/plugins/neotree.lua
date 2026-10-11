return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- Recommended for file icons
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window
  },
  config = function()
    -- Basic setup with default configurations
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true, -- ensures hidden files like .env are visible if needed
        },
        follow_current_file = {
          enabled = true, -- Focuses the tree on the currently open file
        },
      },
    })
  end,
}

