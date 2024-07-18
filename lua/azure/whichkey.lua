local M = {
  "folke/which-key.nvim",
  dependencies = { { "echasnovski/mini.icons", version = false } },
}

function M.config()
  local mappings = {
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "NOHL" },

    { "<leader>b", group = "Buffers" },
    { "<leader>c", group = "Code" },

    { "<leader>d", group = "Debugger" },
    { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
    { "<leader>dr", "<cmd>DapContinue<CR>", desc = "Start/Resume" },

    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>p", group = "Project" },

    { "<leader>t", group = "Tab" },
    { "<leader>tN", "<cmd>tabnew %<cr>", desc = "New Tab" },
    { "<leader>tc", "<cmd>$tabclose<cr>", desc = "Close Tab" },
    { "<leader>th", "<cmd>tabprevious<cr>", desc = "Switch to Left Tab" },
    { "<leader>tl", "<cmd>tabnext<cr>", desc = "Switch to Right tab" },
    { "<leader>tn", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
    { "<leader>to", "<cmd>tabonly<cr>", desc = "Only" },

    { "<leader>o", group = "Open" },
    { "<leader>oT", "<cmd>tabnew | terminal<CR>", desc = "Open Term" },
    { "<leader>ot", group = "Toggle Term" },

    { "<leader>w", group = "Window" },
    { "<leader>wH", "<C-w>H", desc = "Position window at left" },
    { "<leader>wJ", "<C-w>J", desc = "Position window at bottom" },
    { "<leader>wK", "<C-w>K", desc = "Position window at top" },
    { "<leader>wL", "<C-w>L", desc = "Position window at right" },
    { "<leader>wh", "<C-w>h", desc = "Focus on left windows" },
    { "<leader>wj", "<C-w>j", desc = "Focus on bottom window" },
    { "<leader>wk", "<C-w>k", desc = "Focus on top window" },
    { "<leader>wl", "<C-w>l", desc = "Focus on right window" },
    { "<leader>wo", ":MaximizerToggle<CR>", desc = "Maximeze current window" },
    { "<leader>wq", ":close<CR>", desc = "Close current window" },
    { "<leader>ws", "<cmd>split<CR>", desc = "Horizontal Split" },
    { "<leader>wv", "<cmd>vsplit<CR>", desc = "Vertical Split" },
    { "<leader>we", "<C-w>=", desc = "Balance Windows" },
    { "<leader>wz", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
  }

  local which_key = require "which-key"
  which_key.setup {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    win = {
      no_overlap = true,
      border = "rounded",
      title = true,
      title_pos = "center",
      padding = { 2, 2, 2, 2 },
      zindex = 1000,
    },
    filter = function(mapping)
      return true
    end,
    show_help = false,
    show_keys = true,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.add(mappings, opts)
end

return M
