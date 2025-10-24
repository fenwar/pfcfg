#!/usr/bin/env python3

"""
Allow saved remmina connections to be selected and opened by rofi.
"""

import os
import subprocess
import sys


REMMINA_EXE = "/usr/bin/remmina"
REMMINA_DIR = os.path.expanduser("~/.local/share/remmina")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        # A remmina file was selected, open it:
        remmina_file = os.path.join(REMMINA_DIR, sys.argv[1])
        subprocess.Popen(
            [REMMINA_EXE, "-c", remmina_file],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.STDOUT)
    else:
        for remmina_file in os.listdir(REMMINA_DIR):
            print(remmina_file)
