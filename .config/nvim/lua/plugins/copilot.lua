return {
  -- GitHub Copilot plugin (for authentication and suggestions)
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = false },
      -- other settings to your liking
    })
  end,
}
