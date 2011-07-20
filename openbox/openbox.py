#!/usr/bin/python

""" 
Openbox Compilation Script
==========================
This script compiles an OpenBox configuration file by concatenating all the XML
files found in the `sections` directory.  This allows each section to be 
maintained in its own file, which makes everything more manageable and easier
to script.

Run this script in the directory containing the OpenBox configuration file, 
usually `~/.config/openbox/`.  
"""

import glob
import xmlhelper

tag = 'openbox_config'
xmlns = 'http://openbox.org/3.4/rc'
output = 'rc.xml'

def main():
    document = xmlhelper.make_document()
    openbox = xmlhelper.make_root(document, tag, xmlns=xmlns)

    for path in glob.glob('sections/*.xml'):
        section = xmlhelper.read_file(path)
        openbox.appendChild(section)

    with open(output, 'w') as file:
        xmlhelper.write_file(document, file)

if __name__ == '__main__':
    main()
