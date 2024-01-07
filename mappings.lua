-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>fw"] = {
      function() require("telescope").extensions.live_grep_args.live_grep_args() end,
      desc = "Find words",
    },

    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader>e"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },

    ["[f"] = { "<cmd>AerialPrev<CR>" },
    ["]f"] = { "<cmd>AerialNext<CR>" },
    -- Move lines using Alt-j/k.
    ["<A-Down>"] = { ":m .+1<CR>" },
    ["<A-Up>"] = { ":m .-2<CR>" },
    ["<leader>gf"] = { "<cmd>Git<CR>" },
    -- ["<A-h>"] = {
    --   function() vim.lsp.buf.signature_help() end,
    --   desc = "Signature help",
    -- },
    ["-"] = {
      "<CMD>Oil<CR>",
      desc = "Open parent directory",
    },
    ["<C-c>"] = { '"+y' },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {
    ["<A-Down>"] = { "<Esc>:m .+1<CR>==gi" },
    ["<A-Up>"] = { "<Esc>:m .-2<CR>==gi" },
    ["<Tab>"] = {
      function()
        local copilot = require "copilot.suggestion"
        if copilot.is_visible() then
          copilot.accept()
        else
          -- Input tab
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
        end
      end,
    },
    ["<S-Tab>"] = {
      function()
        -- Remove one indentation level
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-d>", true, true, true), "n")
      end,
    },
    ["<C-c>"] = { '"+y' },
  },
  v = {
    ["<A-Down>"] = { ":m '>+1<CR>gv=gv" },
    ["<A-Up>"] = { ":m '<-2<CR>gv=gv" },
    -- ["<A-h>"] = {
    --   function() vim.lsp.buf.signature_help() end,
    --   desc = "Signature help",
    -- },
    ["<C-c>"] = { '"*y' },
  },
}
