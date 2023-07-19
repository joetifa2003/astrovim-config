local notify = vim.notify

---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, ...)
  if msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
    return
  end

  notify(msg, ...)
end

return {
  colorscheme = "monokai-pro",
}
