require('gitsigns').setup({
  sign_priority = 1
})

vim.o.signcolumn = "yes:1"      -- Always show sign column
vim.o.statuscolumn = "%l %s"    -- Line number, then sign

