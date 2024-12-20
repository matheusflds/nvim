local M = {
  -- "rebelot/kanagawa.nvim",
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
    on_colors = function (colors)
      -- colors.bg = "#11121d"
    end,
  }
  vim.cmd.colorscheme "tokyonight"
  -- vim.cmd.colorscheme "kanagawa-dragon"
  -- require("catppuccin").setup {
  --   color_overrides = {
  --     mocha = {
  --       base = "#0b0b12",
  --       mantle = "#11111a",
  --       crust = "#191926",
  --     },
  --   },
  -- }
  -- vim.cmd.colorscheme "catppuccin-mocha"
end

return M
