#!/bin/bash

# Check and install yabai
if ! command -v yabai &> /dev/null; then
    echo "Installing yabai..."
    brew install koekeishiya/formulae/yabai
else
    echo "yabai is already installed."
fi

# Check and install skhd
if ! command -v skhd &> /dev/null; then
    echo "Installing skhd..."
    brew install koekeishiya/formulae/skhd
else
    echo "skhd is already installed."
fi

# Start yabai service if not running
echo "Starting yabai service..."
yabai --start-service

#
# Start skhd service if not running
echo "skhd service is already running."
skhd --start-service
