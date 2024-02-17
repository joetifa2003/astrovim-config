return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      no_italic = true,
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        aerial = true,
        gitsigns = true,
        markdown = true,
        -- neotree = true,
        notify = true,
      },
      color_overrides = {
        mocha = {
          base = "#1a1826",
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
