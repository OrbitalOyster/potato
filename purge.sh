#!/bin/bash

echo "Removing config and cache..."
rm ~/.config/nvim -rf
rm ~/.local/share/nvim -rf
rm ~/.local/state/nvim -rf
rm ~/.cache/nvim -rf
echo "Done"

