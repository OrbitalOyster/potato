require('gitsigns').setup({
  sign_priority = 100
})

vim.o.signcolumn = "auto:2"      -- Always show sign column
vim.o.statuscolumn = "%l %s "    -- Line number, then sign

