vim.o.number = true             -- Line numbers
vim.o.relativenumber = true     -- Relative line numbers
vim.o.cursorline = true         -- Highlight line number
vim.o.tabstop = 2               -- Number of spaces a tab represents
vim.o.shiftwidth = 2            -- Number of spaces for each indentation
vim.o.expandtab = true          -- Convert tabs to spaces
vim.o.smartindent = true        -- Automatically indent new lines
vim.o.wrap = false              -- No line wrapping
vim.o.termguicolors = true      -- Enable 24-bit RGB colors
vim.o.undofile = true           -- Enable persistent undo
vim.o.showmode = false          -- Don't show mode

vim.g.mapleader = ' '           -- Space as leader key

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set('n', '<leader>o', '<cmd>Neotree toggle<cr>')
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>')      -- Next buffer
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>')    -- Previous buffer
vim.keymap.set('n', '<leader>c', '<Cmd>Bdelete<CR>')              -- Close buffer

vim.o.laststatus = 3  -- Set lualine width to 100%

vim.diagnostic.config({  -- Funky diagnostic icons
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
  },
})

require("config.lazy") -- Load plugins

vim.cmd("colorscheme catppuccin-frappe") -- Set color theme

vim.lsp.enable("ts_ls")  -- Enable LSP
