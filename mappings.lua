return {
  n = {
    ["<leader>ts"] = {
      function() require("neotest").summary.toggle() end,
      desc = "Toggle neotest summary",
    },
  },
}
