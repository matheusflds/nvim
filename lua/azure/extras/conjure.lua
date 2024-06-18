local M = {
  "Olical/conjure",
}

function M.config()
  vim.g["conjure#mapping#enable_defaults"] = false
  vim.g["conjure#mapping#doc_word"] = "gk"
  vim.g["conjure#client#clojure#nrepl#connection#port_files"] = "<leader>cF"
end

return M
