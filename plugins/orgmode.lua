local meetingNotesTarget = "~/orgfiles/meeting-notes/%<%Y-%m-%d %A>.org"

return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    event = { "VeryLazy" },
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_startup_folded = "showeverything",
        org_capture_templates = {
          t = {
            description = "Task",
            template = "* TODO %?\n  %u",
          },
          m = "Meeting",
          mt = {
            description = "task",
            template = "\n* TODO %^{header} :task:\n  CREATED: %T\n\t%a\n\n\t%?\n",
            target = meetingNotesTarget,
          },
          mp = {
            description = "progress",
            template = "\n* TODO %^{header} :progress:\n  CREATED: %T\n\t%a\n\n\t%?\n",
            target = meetingNotesTarget,
          },
        },
      }
    end,
  },
  { "akinsho/org-bullets.nvim", config = function() require("org-bullets").setup {} end, lazy = false },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "orgmode", priority = 800 },
        { name = "codeium", priority = 750 },
        { name = "luasnip", priority = 700 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
    },
  },
}
