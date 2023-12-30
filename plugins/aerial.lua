return {
  "stevearc/aerial.nvim",
  opts = {},
  -- Optional dependencies
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup {
      -- Your configuration settings
      open_automatic = true, -- This setting will make Aerial open automatically
    }
  end,
}
