local M = {
  "folke/trouble.nvim",
  branch = "main", -- IMPORTANT!
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  opts = {},
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics" },
    ["<leader>xX"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics" },
    ["<leader>cs"] = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols" },
    ["<leader>cl"] = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP Definitions" },
    ["<leader>xL"] = { "<cmd>Trouble loclist toggle<cr>", "Location List" },
    ["<leader>xQ"] = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List" },
  }

  require("trouble").setup {}
end

return M
