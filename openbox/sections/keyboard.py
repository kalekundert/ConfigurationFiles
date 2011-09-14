#!/usr/bin/env python

# OpenBox Keybindings
# ===================
# This script helps set up keybindings for the OpenBox window manager.  Using
# this script is not strictly necessary, but it does hide some of the details
# that come up in the raw XML. 

from bindings import *
from geometry import *

sakura = 'sakura --rows=%d --columns=%d'
python = sakura + ' --title=ipython --execute="ipython -nobanner"'

# Key to Action Bindings
bindings = {
        'Tab' : Action('NextWindow'),
        'S-Tab' : Action('PreviousWindow'),
        
        'Return' : Action('DesktopNext'),
        'S-Return' : Action('DesktopPrevious'),

        'q' : Execute(sakura % (21, 80)),
        'w' : Execute(python % (37, 80)),
        'e' : Execute('firefox'),
        'r' : Execute('rythymbox'),

        'a' : Desktop(1), 'S-a' : SendToDesktop(1, False),
        's' : Desktop(2), 'S-s' : SendToDesktop(2, False),
        'd' : Desktop(3), 'S-d' : SendToDesktop(3, False),
        'f' : Desktop(4), 'S-f' : SendToDesktop(4, False),
        'z' : Desktop(5), 'S-z' : SendToDesktop(5, False),
        'x' : Desktop(6), 'S-x' : SendToDesktop(6, False),
        'c' : Desktop(7), 'S-c' : SendToDesktop(7, False),
        'v' : Desktop(8), 'S-v' : SendToDesktop(8, False),

        'u' : MoveResizeTo(0, 0, normal_width, full_height),
        'i' : MoveResizeTo(x, 0, normal_width, full_height),
        'o' : MoveResizeTo(x, 0, expanded_width, full_height),
        'p' : MoveResizeTo(z, 0, contracted_width, full_height),

        'h' : MoveResizeTo(0, 0, normal_width, top_height),
        'j' : MoveResizeTo(0, y, normal_width, bottom_height),
        'k' : MoveResizeTo(x, 0, normal_width, top_height),
        'l' : MoveResizeTo(x, y, normal_width, bottom_height),

        'n' : Action('Iconify'),
        'm' : Action('MaximizeFull'),

        'BackSpace' : Action('Close'),
        'S-Escape' : Action('Reconfigure') }

# XML Generation
keyboard = Keyboard()

keyboard.bind(**bindings)
keyboard.write('keyboard.xml')

