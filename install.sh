#!/bin/bash

echo "Installing..."

# Base files
cp nvim ~/.config -r

# Plugins
cp plugins ~/.config/nvim/lua -r

echo "Done"

