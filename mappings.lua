return {
  n = {
    ["<leader>ts"] = {
      function() require("neotest").summary.toggle() end,
      desc = "Toggle neotest summary",
    },
  },
  i = {
    ["<C-g>"] = {
      function() return vim.fn["codeium#Accept"]() end,
      desc = "Accept codeium",
    },
    ["<C-j>"] = {
      function() return vim.fn["codeium#CycleCompletions"](1) end,
      desc = "Cycle codeium completions forward",
    },
    ["<C-k>"] = {
      function() return vim.fn["codeium#CycleCompletions"](-1) end,
      desc = "Cycle codeium completions backward",
    },
  },
}
