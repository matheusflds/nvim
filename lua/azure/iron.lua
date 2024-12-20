local M = {
  "Vigemus/iron.nvim",
}

function M.config()
  local iron = require "iron.core"

  iron.setup {
    config = {
      -- Whether a repl should be discarded or not
      scratch_repl = true,
      -- Your repl definitions come here
      repl_definition = {
        sh = {
          -- Can be a table or a function that
          -- returns a table (see below)
          command = {"fish"}
        },
        python = {
          command = { "poetry", "run", "ipython", "--no-autoindent" },  -- or { "python3" }
          format = require("iron.fts.common").bracketed_paste_python
        }
      },
      -- How the repl window will be displayed
      -- See below for more information
      repl_open_cmd = require('iron.view').right(100),
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
      send_motion = "<space>sc",
      visual_send = "<space>sc",
      send_file = "<space>sf",
      send_line = "<space>sl",
      send_paragraph = "<space>sp",
      send_until_cursor = "<space>su",
      send_mark = "<space>sm",
      mark_motion = "<space>mc",
      mark_visual = "<space>mc",
      remove_mark = "<space>md",
      cr = "<space>s<cr>",
      interrupt = "<space>s<space>",
      exit = "<space>sq",
      clear = "<space>cL",
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {
      italic = true
    },
    ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
  }

  -- iron also has a list of commands, see :h iron-commands for all available commands
  vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
  vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
  vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
  vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

  local wk = require "which-key"
  wk.add {
    { "<leader>rs", "<cmd>IronRepl<cr>", desc = "Open Iron Repl" },
    { "<leader>rr", "<cmd>IronRestart<cr>", desc = "Restart Iron Repl" },
    { "<leader>rf", "<cmd>IronFocus<cr>", desc = "Focus Iron Repl" },
    { "<leader>rh", "<cmd>IronHide<cr>", desc = "Hide Iron Repl" },
  }
end

return M
