return {
  -- Vim tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    -- lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Go forward/backward with square brackets
  {
    "nvim-mini/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  -- copilot
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<C-l>",
          accept_word = "<M-l>",
          accept_line = "<M-S-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  -- diffview
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>gg", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gG", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
      { "<leader>gF", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
    },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true, -- Enhanced highlighting for diffs
        use_icons = true, -- Use filetype icons (requires `nvim-web-devicons`)
        file_panel = {
          win_config = {
            position = "left", -- Can be "left", "right", "top", "bottom"
            width = 35,
          },
        },
        keymaps = {
          view = {
            ["<leader>e"] = "<cmd>DiffviewToggleFiles<CR>", -- Toggle the file panel
          },
          file_panel = {
            ["q"] = "<cmd>DiffviewClose<CR>", -- Quickly close diffview
          },
          file_history_panel = {
            ["<leader>h"] = "<cmd>DiffviewFileHistory<CR>", -- Toggle file history
          },
        },
        hooks = {
          diff_buf_read = function(bufnr)
            -- Customize diff buffer appearance
            vim.bo[bufnr].syntax = "diff"
            vim.wo[bufnr].wrap = false
          end,
        },
      })
    end,
  },
}
