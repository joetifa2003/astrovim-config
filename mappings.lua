return {
  n = {
    ["<leader>ts"] = {
      function() require("neotest").summary.toggle() end,
      desc = "Toggle neotest summary",
    },
    ["<leader>fj"] = {
      function() vim.cmd "Farr" end,
    },
  },
}
