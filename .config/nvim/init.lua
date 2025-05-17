-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Auto reload file if it changes outside
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})

-- Disable temrinal notifications (annoying in VSCode)
if vim.g.vscode then
  local original_notify = vim.notify
  vim.notify = function(msg, level, opts)
    if msg:match("yanked") then
      return
    end
    original_notify(msg, level, opts)
  end
end
