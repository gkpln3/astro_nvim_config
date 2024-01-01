return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.completion = {
      completeopt = "menu,menuone,noinsert",
    }
    opts.mapping["<Tab>"] = nil
    opts.mapping["<S-Tab>"] = nil
    opts.mapping["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }
    opts.confirm_opts = {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    }
  end,
}
