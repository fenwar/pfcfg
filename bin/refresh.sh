#!/bin/bash
# Refresh the browser window with supplied title.

WINDOW_TITLE=$1
KEYPRESS="Control_L+F5"

echo "Sending ${KEYPRESS} to browser window named ${WINDOW_TITLE}"

# Find the window to be refreshed
TARGET_WINDOW=$(xdotool search --onlyvisible --name "${WINDOW_TITLE}")

# Store the previously active window so we can switch back to it:
PREVIOUS_WINDOW=$(xdotool getactivewindow)

# Focus the browser window and refresh it:
xdotool windowactivate --sync $TARGET_WINDOW key --window $TARGET_WINDOW $KEYPRESS

# Switch back to the previously active window:
xdotool windowactivate $PREVIOUS_WINDOW
