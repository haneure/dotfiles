return {
  {
    "johnseth97/codex.nvim",
    -- requires Codex CLI installed (`codex` in PATH)
    config = function()
      require("codex").setup({})
    end,
    keys = {
      { "<leader>ax", "<cmd>CodexToggle<cr>", desc = "Codex Toggle" },
    },
  },
}
