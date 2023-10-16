return {
  { "andweeb/presence.nvim", lazy = false },
  { "sudoerwx/vim-ray-so-beautiful", lazy = false },
  { "wakatime/vim-wakatime", lazy = false },
  -- { "joerdav/templ.vim", lazy = false },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function()
      require("nvim-dap-virtual-text").setup {
        virt_text_pos = "eol",
      }
    end,
  },
}
