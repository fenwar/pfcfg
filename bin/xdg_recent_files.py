#!/usr/bin/env python

from xml.etree import ElementTree as ET
from xdg.RecentFiles import RecentFiles

if __name__ == "__main__":
    rf = RecentFiles()
    rf.parse("/home/paulf/.recently-used")
    for fn in rf.getFiles():
        print fn.URI

    xbel_tree = ET.parse("/home/paulf/.local/share/recently-used.xbel")
    xbel = xbel_tree.getroot()
    for child in xbel:
        print child.attrib["href"]
