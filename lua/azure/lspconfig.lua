local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, { bufnr })
end

function M.config()
  local wk = require "which-key"
  wk.add {
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>", desc = "Format" },
    { "<leader>ci", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>cj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
    { "<leader>ck", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
    { "<leader>cq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
    { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  }

  wk.add {
    { "<leader>la", group = "LSP" },
    { "<leader>laa", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", mode = "v" },
  }

  local lspconfig = require "lspconfig"
  local icons = require "azure.icons"

  local servers = {
    "lua_ls",
    "cssls",
    "html",
    "eslint",
    "ts_ls",
    "pyright",
    -- "pylsp",
    "bashls",
    "jsonls",
    "yamlls",
    "gopls",
    "terraformls",
    "astro",
    "prismals",
    "clojure_lsp",
    "clangd",
    "ruff",
    "qmlls"
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "azure.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    if server == "yamlls" then
      opts.capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
    end

    if server == "qmlls" then
      opts.cmd = {"qmlls", "-E"}
    end

    -- if server == "pyright" then
    --   opts.settings = {
    --     pyright = {
    --       disableOrganizeImports = true, -- Using Ruff
    --     },
    --     python = {
    --       analysis = {
    --         ignore = { "*" }, -- Using Ruff
    --         typeCheckingMode = "off", -- Using mypy
    --       },
    --     },
    --   }
    -- end
    -- if server == "pylsp" then
    --   local poetry_python_path = vim.fn.system("poetry env info --path"):gsub("%s+", "") .. "/bin/python"
    --   -- local util = require "lspconfig/util"
    --
    --   -- opts.root_dir = util.find_git_ancestor or util.path.dirname
    --   opts.cmd = { poetry_python_path, "-m", "pylsp" }
    --   opts.settings = {
    --     pylsp = {
    --       configurationSources = { "pylint" },
    --       plugins = {
    --         -- formatter options
    --         black = { enabled = false },
    --         autopep8 = { enabled = false },
    --         yapf = { enabled = false },
    --         -- linter options
    --         mccabe = { enabled = false },
    --         ruff = { enabled = true },
    --         pylint = { enabled = true, executable = "pylint" },
    --         pyflakes = { enabled = false },
    --         pycodestyle = { enabled = false },
    --         -- type checker
    --         pylsp_mypy = { enabled = true },
    --         -- auto-completion options
    --         -- jedi_completion = { fuzzy = true },
    --         -- rope_completion = { enabled = true },
    --
    --         -- import sorting
    --         pyls_isort = { enabled = true },
    --       },
    --     },
    --   }
    -- end

    lspconfig[server].setup(opts)
  end
end

return M
