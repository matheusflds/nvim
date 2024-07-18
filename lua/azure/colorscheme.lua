local M = {
  "folke/tokyonight.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("tokyonight").setup {
    style = "night",

    ---@class (exact) ColorScheme
    ---@field public bg string

    ---@param colors ColorScheme
    -- on_colors = function (colors)
      -- colors.bg = "#0B0B0F"
    -- end,
  }
  vim.cmd.colorscheme "tokyonight"
end

return M
