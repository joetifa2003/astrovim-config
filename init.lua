local notify = vim.notify

---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
  if msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
    return
  end

  notify(msg, ...)
end

-- convert this to lua: autocmd BufNewFile,BufRead *.ini setfiletype dosini
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { "*.templ" },
  command = ":set ft=html",
})

return {
  colorscheme = "tokyonight-night",
  lsp = {
    servers = {
      "gopls",
    },
    formatting = {
      format_on_save = {
        enabled = true, -- enable format on save
        ignore_filetypes = { -- disable format on save for specified filetypes
          "html",
        },
      },
    },
    config = {
      tailwindcss = {
        filetypes = { "html", "typescriptreact", "javascriptreact", "templ" },
      },
      gopls = {
        settings = {
          gopls = {
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = true,
            },
          },
        },
      },
    },
  },
}
