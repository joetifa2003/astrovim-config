local meetingNotesTarget = "~/orgfiles/meeting-notes/%<%Y-%m-%d %A>.org"

return {
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter", lazy = false },
    },
    lazy = false,
    config = function()
      -- Load treesitter grammar for org
      require("orgmode").setup_ts_grammar()

      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_capture_templates = {
          t = {
            description = "Task",
            template = "* TODO %?\n  %u",
          },
          m = "Meeting",
          mt = {
            description = "task",
            template = "* TODO %? :task:\n  [[file:%F]]",
            target = meetingNotesTarget,
          },
          mp = {
            description = "progress",
            template = "* TODO %? :progress:\n  [[file: %F]]",
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
        { name = "orgmode" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        additional_vim_regex_highlighting = { "org" },
      },
      ensure_installed = { "org" },
    },
  },
}