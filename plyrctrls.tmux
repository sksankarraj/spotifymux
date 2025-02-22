#!/usr/bin/env bash

# Get the current tmux source path (for plugin development)
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to display the greeter message
greeter_show() {
    tmux split-window -h "echo 'Hello, $(whoami)! The time is $(date "+%H:%M:%S").' && sleep 5"
}

# Bind a key to trigger the greeter (e.g., Ctrl-g)
tmux bind-key -n C-b run-shell "$CURRENT_DIR/plyrctrls.tmux show"

# Handle plugin commands (optional, for flexibility)
case "$1" in
    "show")
        greeter_show
        ;;
    *)
        # Default behavior when plugin is loaded (optional)
        ;;
esac
