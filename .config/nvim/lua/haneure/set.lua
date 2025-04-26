vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

vim.opt.nu = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.smartindent = true -- Insert indents automatically

vim.opt.wrap = false -- Disable line wrapping

vim.opt.swapfile = false -- Disable swap file
vim.opt.backup = false -- Disable backup file
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- Set undo directory
vim.opt.undofile = true -- Enable persistent undo

vim.opt.hlsearch = false -- Highlight all matches on previous search pattern
vim.opt.incsearch = true -- Show where the pattern matches as you type

vim.opt.termguicolors = true -- Enable 24-bit RGB colors

vim.opt.scrolloff = 8 -- Lines of context to keep above and below the cursor
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.isfname:append("@-@") -- Include "@" in file names

vim.opt.updatetime = 50 -- Faster completion (4000ms default)

vim.opt.colorcolumn = "80" -- Highlight column 80

vim.g.mapleader = " " -- Set leader key to space
