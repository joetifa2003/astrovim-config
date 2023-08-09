local FileNameComponent = {
  provider = function() return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.") end,
  hl = function()
    local utils = require "heirline.utils"
    return { fg = utils.get_highlight("Directory").fg }
  end,
}

return {
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
      status.component.nav(),
      status.component.mode { surround = { separator = "right" } },
    }

    -- return the final configuration table
    return opts
  end,
}
