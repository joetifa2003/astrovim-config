return {
  n = {
    ["<leader>ts"] = {
      function() require("neotest").summary.toggle() end,
      desc = "Toggle neotest summary",
    },
    ["<leader>gg"] = {
      function() vim.cmd "LazyGit" end,
      desc = "Open lazygit",
    },
  },
}
