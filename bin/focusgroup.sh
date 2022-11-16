#!/bin/sh

# xdotool search expressions for the windows in our group:

WINDOW_LIST="$(xdotool search --name '\[JIRA\].*') \
            $(xdotool search --name '\[vms.*') \
            $(xdotool search --name '.*QEMU.*')"

echo $WINDOW_LIST

# assemble the commands we want xdotool to run when a window is focussed
for WINDOW in $WINDOW_LIST; do
    COMMAND_LIST="$COMMAND_LIST windowraise $WINDOW"
done
echo $COMMAND_LIST

for WINDOW in $WINDOW_LIST; do
    # Note that we focus on the window itself last
    xdotool behave $WINDOW focus ${COMMAND_LIST} &
done
