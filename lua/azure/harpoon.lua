local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  -- local opts = { noremap = true, silent = true }

  local harpoon = require("harpoon")

  -- REQUIRED
  harpoon:setup()
  -- REQUIRED

  local wk = require "which-key"
  -- keymap("n", "<leader>ba", function() harpoon:list():add() end)
  -- keymap("n", "<leader>bm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  wk.add {
    { "<leader>ba", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Harpoon Add" },
    { "<leader>bl", "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>", desc = "Harpoon List" },
    { "<leader>bn", "<cmd>lua require('harpoon'):list():next()<cr>", desc = "Harpoon Next" },
    { "<leader>bp", "<cmd>lua require('harpoon'):list():prev()<cr>", desc = "Harpoon Prev" },
  }

  -- keymap("n", "<C-h>", function() harpoon:list():select(1) end)
  -- keymap("n", "<C-t>", function() harpoon:list():select(2) end)
  -- keymap("n", "<C-n>", function() harpoon:list():select(3) end)
  -- keymap("n", "<C-s>", function() harpoon:list():select(4) end)

  -- Toggle previous & next buffers stored within Harpoon list
  keymap("n", "<leader>bp", function() harpoon:list():prev() end)
  keymap("n", "<leader>bn", function() harpoon:list():next() end)

  -- keymap("n", "<s-m>", "<cmd>lua require('azure.harpoon').mark_file()<cr>", opts)
  -- keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
