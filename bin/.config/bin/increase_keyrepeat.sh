#!/bin/bash

# Display current settings
current_initial=$(defaults read NSGlobalDomain InitialKeyRepeat 2>/dev/null || echo "not set")
current_key=$(defaults read NSGlobalDomain KeyRepeat 2>/dev/null || echo "not set")
echo "Current InitialKeyRepeat: $current_initial"
echo "Current KeyRepeat: $current_key"

# Set faster key repeat values (lower numbers = faster)
new_initial=10   # Adjust this value (15 is 225 ms delay before repeating starts)
new_key=1        # Adjust this value (2 is 30 ms between repeats)

# Apply new settings
defaults write NSGlobalDomain InitialKeyRepeat -int $new_initial
defaults write NSGlobalDomain KeyRepeat -int $new_key

# Display new settings
echo "New InitialKeyRepeat: $(defaults read NSGlobalDomain InitialKeyRepeat)"
echo "New KeyRepeat: $(defaults read NSGlobalDomain KeyRepeat)"

# Reminder to log out
echo -e "\nNote: Log out and log back in for changes to take effect."
