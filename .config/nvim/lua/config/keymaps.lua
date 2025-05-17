-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VSCode Neovim
if vim.g.vscode then
  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap.set

  -- Sidebar and Terminal visibility
  keymap(
    { "n", "v" },
    "<leader>t",
    "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>",
    opts
  )
  keymap(
    { "n", "v" },
    "<leader>e",
    "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>",
    opts
  )

  -- or you can also do this instead
  local vscode = require("vscode")

  keymap({ "n", "v" }, "<leader>t", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, opts)

  -- this command will toggle the terminal and sends lazygit string then execute it
  keymap("n", "<leader>gg", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
    vscode.action("workbench.action.terminal.sendSequence", { args = { text = "lazygit\n" } })
  end, opts)

  keymap({ "n", "x" }, "<leader><Space>", function()
    vscode.action("whichkey.show")
  end, opts)

  -- harpoon keymaps
  keymap({ "n", "v" }, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>", opts)
  keymap({ "n", "v" }, "<leader>ho", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>", opts)
  keymap({ "n", "v" }, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>", opts)
  keymap({ "n", "v" }, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>", opts)

  -- project manager keymaps
  keymap({ "n", "v" }, "<leader>ap", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>", opts)
  keymap({ "n", "v" }, "<leader>sp", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>", opts)
  keymap(
    { "n", "v" },
    "<leader>lp",
    "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>",
    opts
  )

  vim.keymap.set("i", "<C-k>", function()
    vim.lsp.buf.signature_help()
  end, { buffer = true })

  vim.keymap.set("n", "<leader>ba", function()
    vim.fn["VSCodeNotify"]("workbench.action.toggleActivityBarVisibility")
  end, { desc = "Toggle Activity Bar" })
  -- insert more configuration
end

-- disable discripline
-- local discipline = require("haneure.discipline")
-- discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "<vb_d>")

-- Select all
keymap.set("n", "C-a", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
--keymap.set("n", "sh", "<C-w>h", opts)
--keymap.set("n", "sk", "<C-w>k", opts)
--keymap.set("n", "sj", "<C-w>j", opts)
--keymap.set("n", "sl", "<C-w>l", opts)

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--  vim.diagnostic.goto_next()
-- end, opts)

-- Diagnostics
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

keymap.set("n", "<leader>r", function()
  require("haneure.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("haneure.lsp").toggleInlayHints()
end)

vim.api.nvim_create_user_command("ToggleAutoformat", function()
  require("haneure.lsp").toggleAutoformat()
end, {})
