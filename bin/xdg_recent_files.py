#!/usr/bin/env python

import os
from xml.etree import ElementTree as ET
from xdg.RecentFiles import RecentFiles

XDG_PATH = "/home/paulf/.recently-used"
XBEL_PATH = "/home/paulf/.local/share/recently-used.xbel"

if __name__ == "__main__":
    if os.path.exists(XDG_PATH):
        rf = RecentFiles()
        rf.parse(XDG_PATH)
        for fn in rf.getFiles():
            print fn.URI

    if os.path.exists(XBEL_PATH):
        xbel_tree = ET.parse(XBEL_PATH)
        xbel = xbel_tree.getroot()
        for child in xbel:
            print child.attrib["href"]
