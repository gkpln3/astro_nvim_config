return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup {
      colors = {
        onedark = { bg = "#22242a" }, -- yellow
      },
    }
  end,
}
