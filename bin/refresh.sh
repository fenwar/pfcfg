#!/bin/bash
# Refresh the browser window with supplied title.

# Find the window to be refreshed
TARGET_WINDOW=$(xdotool search --name "$1")

# Store the previously active window so we can switch back to it:
PREVIOUS_WINDOW=$(xdotool getactivewindow)

# Focus the browser window and refresh it:
xdotool windowactivate $TARGET_WINDOW key --window $TARGET_WINDOW F5

# Switch back to the previously active window:
xdotool windowactivate $PREVIOUS_WINDOW
