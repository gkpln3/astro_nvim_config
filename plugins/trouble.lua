return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  lazy = false,
  config = function()
    local actions = require "telescope.actions"
    local trouble = require "trouble.providers.telescope"

    local telescope = require "telescope"

    telescope.setup {
      defaults = {
        mappings = {
          i = { ["<c-q>"] = trouble.open_with_trouble },
          n = { ["<c-q>"] = trouble.open_with_trouble },
        },
      },
    }
  end,
}
