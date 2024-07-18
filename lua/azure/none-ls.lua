local M = {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  }
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics =  null_ls.builtins.diagnostics

  local poetry_mypy = vim.fn.system("poetry run which mypy"):gsub("%s+", "")

  null_ls.setup {
    debug = false,
    sources = {
      formatting.stylua,
      formatting.prettier,
      diagnostics.mypy.with({
        command = poetry_mypy,
        extra_args = { "--ignore-missing-imports", "--show-column-numbers" },
      }),
      -- diagnostics.mypy,
      -- formatting.ruff,
      -- formatting.cljfmt,
      formatting.clang_format,
      formatting.isort,
      -- diagnostics.ruff,
      -- formatting.joker,
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.flake8,
      -- diagnostics.flake8,
      null_ls.builtins.completion.spell,
    },
  }
end

-- TODO: Auto format on save

return M
