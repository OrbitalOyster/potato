vim.lsp.enable('eslint')

-- Vue + TS LSP from https://github.com/vuejs/language-tools/wiki/Neovim
local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local tsserver_filetypes = { 'typescript', 'javascript', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}

vim.lsp.config('ts_ls', ts_ls_config)
vim.lsp.enable({'ts_ls', 'vue_ls'})

