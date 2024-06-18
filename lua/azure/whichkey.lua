local M = {
  "folke/which-key.nvim",
}

function M.config()
  local mappings = {
    q = { "<cmd>confirm q<CR>", "Quit" },
    h = { "<cmd>nohlsearch<CR>", "NOHL" },
    b = { name = "Buffers" },
    c = { name = "Code" },
    d = {
      name = "Debugger",
      b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
      r = { "<cmd>DapContinue<CR>", "Start/Resume" },
    },
    f = { name = "Find" },
    p = { name = "Project" },
    g = { name = "Git" },
    t = {
      name = "Tab",

      n = { "<cmd>$tabnew<cr>", "New Empty Tab" },
      N = { "<cmd>tabnew %<cr>", "New Tab" },
      o = { "<cmd>tabonly<cr>", "Only" },
      h = { "<cmd>tabprevious<cr>", "Switch to Left Tab" },
      l = { "<cmd>tabnext<cr>", "Switch to Right tab" },
      c = { "<cmd>$tabclose<cr>", "Close Tab" },
    },
    o = {
      name = "Open",

      T = { "<cmd>tabnew | terminal<CR>", "Open Term" },
      t = { name = "Toggle Term" },
    },
    w = {
      name = "Window",

      v = { "<cmd>vsplit<CR>", "Vertical Split" },
      s = { "<cmd>split<CR>", "Horizontal Split" },
      e = { "<C-w>=", "Balance Windows" },
      z = { "<cmd>ZenMode<CR>", "Zen Mode" },

      h = { "<C-w>h", "Focus on left windows" },
      j = { "<C-w>j", "Focus on bottom window" },
      k = { "<C-w>k", "Focus on top window" },
      l = { "<C-w>l", "Focus on right window" },

      H = { "<C-w>H", "Position window at left" },
      J = { "<C-w>J", "Position window at bottom" },
      K = { "<C-w>K", "Position window at top" },
      L = { "<C-w>L", "Position window at right" },

      q = { ":close<CR>", "Close current window" },
      c = { ":close<CR>", "Close current window" },

      o = { ":MaximizerToggle<CR>", "Maximeze current window" },
    },
    T = { name = "Treesitter" },
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
    window = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = false,
    show_keys = false,
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  }

  local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.register(mappings, opts)
end

return M
