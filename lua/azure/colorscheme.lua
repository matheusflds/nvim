local M = {
  -- "LunarVim/darkplus.nvim",
  -- "loctvl842/monokai-pro.nvim",
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  vim.cmd.colorscheme "tokyonight-night"
  -- vim.cmd.colorscheme "tokyonight-day"
end

return M
