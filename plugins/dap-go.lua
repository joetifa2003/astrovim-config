return {
  "leoluz/nvim-dap-go",
  lazy = false,
  config = function()
    require("dap-go").setup {
      delve = {
        build_flags = "-tags=integration",
      },
    }
  end,
}
