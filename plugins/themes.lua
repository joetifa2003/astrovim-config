return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function() require("kanagawa").setup() end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
