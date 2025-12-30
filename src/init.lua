require("config.lazy")

vim.o.number = true             -- Line numbers
vim.o.relativenumber = true     -- Relative line numbers
vim.o.tabstop = 2               -- Number of spaces a tab represents
vim.o.shiftwidth = 2            -- Number of spaces for each indentation
vim.o.expandtab = true          -- Convert tabs to spaces
vim.o.smartindent = true        -- Automatically indent new lines
vim.o.wrap = false              -- No line wrapping
vim.o.termguicolors = true      -- Enable 24-bit RGB colors
vim.o.undofile = true           -- Enable persistent undo
vim.opt.showmode = false        -- Don't show mode

vim.g.mapleader = ' '           -- Space as leader key

vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
