#!/bin/bash

echo "Installing..."

# Base files
mkdir ~/.config/nvim/lua/config -p
cp src/init.lua ~/.config/nvim 
mkdir ~/.config/nvim/lua/plugins

# Lazy plugin manager
cp src/lazy.lua ~/.config/nvim/lua/config

# Plugins
cp plugins ~/.config/nvim/lua -r

# echo "return {}" > ~/.config/nvim/lua/plugins/plugins.lua

# Catppuccin theme
# cp src/catppuccin/catppuccin.lua ~/.config/nvim/lua/plugins
# cat src/catppuccin/init.lua >> ~/.config/nvim/init.lua

# NvimTree
# cp src/neo-tree/neo-tree.lua ~/.config/nvim/lua/plugins
# cat src/neo-tree/init.lua >> ~/.config/nvim/init.lua

# Notify
# cp src/notify/notify.lua ~/.config/nvim/lua/plugins

# Buffer tools
# cp src/buffers/bufferline.lua ~/.config/nvim/lua/plugins
# cp src/buffers/bufdelete.lua ~/.config/nvim/lua/plugins
# cat src/buffers/init.lua >> ~/.config/nvim/init.lua

# Lualine
# cp src/lualine/lualine.lua ~/.config/nvim/lua/plugins
# cat src/lualine/init.lua >> ~/.config/nvim/init.lua

# Noice
# cp src/noice/noice.lua ~/.config/nvim/lua/plugins

# gitsigns
# cp src/gitsigns/gitsigns.lua ~/.config/nvim/lua/plugins
# cat src/gitsigns/init.lua >> ~/.config/nvim/init.lua

# Tiny inline diagnostics
# cp src/tid/tid.lua ~/.config/nvim/lua/plugins

# Indents
# cp src/mini.indentscope/mini.indentscope.lua ~/.config/nvim/lua/plugins
# cat src/mini.indentscope/init.lua >> ~/.config/nvim/init.lua

# LSP config
# cp src/lsp-config/lsp-config.lua ~/.config/nvim/lua/plugins
# echo "vim.lsp.enable(\"ts_ls\")" >> ~/.config/nvim/init.lua # TypeScript

echo "Done"
