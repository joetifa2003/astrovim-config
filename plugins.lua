local FileNameComponent = {
  provider = function() return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.") end,
  hl = function()
    local utils = require "heirline.utils"
    return { fg = utils.get_highlight("Directory").fg }
  end,
}

local CodeiumStatus = {
  provider = function() return " CODEIUM:" .. vim.fn["codeium#GetStatusString"]() end,
  hl = function()
    local utils = require "heirline.utils"
    return { fg = utils.get_highlight("DiagnosticError").fg }
  end,
}

return {
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"

      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        FileNameComponent,
        status.component.file_info {
          filetype = false,
          filename = false,
          file_modified = false,
          file_read_only = false,
          file_icon = { padding = { left = 1, right = 0 } },
        },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        CodeiumStatus,
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }

      -- return the final configuration table
      return opts
    end,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    config = function()
      require("monokai-pro").setup {
        filter = "ristretto",
        styles = {
          comment = { italic = true },
          keyword = { italic = false }, -- any other keyword
          type = { italic = false }, -- (preferred) int, long, char, etc
          storageclass = { italic = false }, -- static, register, volatile, etc
          structure = { italic = false }, -- struct, union, enum, etc
          parameter = { italic = false }, -- parameter pass in function
          annotation = { italic = false },
          tag_attribute = { italic = false }, -- attribute of tag in reactjs
        },
      }
    end,
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    config = function()
      vim.g.codeium_no_map_tab = 1
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
      vim.keymap.set("i", "<C-j>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
      vim.keymap.set("i", "<C-k>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup {
        input = {
          enabled = false,
        },
      }
    end,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "leoluz/nvim-dap-go",
    lazy = false,
    config = function() require("dap-go").setup() end,
  },
  {
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
  },
}
