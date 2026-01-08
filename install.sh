#!/bin/bash

echo "Installing..."

# Lazy plugin manager
mkdir ~/.config/nvim/lua/config -p
cp src/init.lua ~/.config/nvim 
cp src/lazy.lua ~/.config/nvim/lua/config
mkdir ~/.config/nvim/lua/plugins
echo "return {}" > ~/.config/nvim/lua/plugins/plugins.lua

# Catppuccin theme
cp src/catppuccin/catppuccin.lua ~/.config/nvim/lua/plugins
cat src/catppuccin/init.lua >> ~/.config/nvim/init.lua

# NvimTree
cp src/nvim-tree/nvim-tree.lua ~/.config/nvim/lua/plugins
cat src/nvim-tree/init.lua >> ~/.config/nvim/init.lua

# Snacks
cp src/snaks/snaks.lua ~/.config/nvim/lua/plugins

# Buffer tools
cp src/buffers/bufferline.lua ~/.config/nvim/lua/plugins
cp src/buffers/bufdelete.lua ~/.config/nvim/lua/plugins
cat src/buffers/init.lua >> ~/.config/nvim/init.lua

# Lualine
cp src/lualine/lualine.lua ~/.config/nvim/lua/plugins
cat src/lualine/init.lua >> ~/.config/nvim/init.lua

# Noice
cp src/noice/noice.lua ~/.config/nvim/lua/plugins
cat src/noice/init.lua >> ~/.config/nvim/init.lua

# gitsigns
cp src/gitsigns/gitsigns.lua ~/.config/nvim/lua/plugins

echo "Done"
