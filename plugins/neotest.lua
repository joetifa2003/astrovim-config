return {
  "nvim-neotest/neotest",
  lazy = false,
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-go",
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-go",
  },
}
