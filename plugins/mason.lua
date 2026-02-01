local lsps = "json-lsp typescript-language-server vue-language-server eslint-lsp"

return {
  "mason-org/mason.nvim",
  build = ":MasonInstall " .. lsps,
  opts = {}
}

