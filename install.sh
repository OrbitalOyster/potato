#!/bin/bash

echo "Installing..."

# Base files
mkdir ~/.config/nvim/lua/config -p
cp init.lua ~/.config/nvim 

# Lazy plugin manager
cp src/lazy.lua ~/.config/nvim/lua/config

# Plugins
cp plugins ~/.config/nvim/lua -r

echo "Done"
