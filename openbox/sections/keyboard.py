#!/usr/bin/env python

# OpenBox Keybindings
# ===================
# This script helps set up keybindings for the OpenBox window manager.  Using
# this script is not strictly necessary, but it does hide some of the details
# that come up in the raw XML. 
#
# The general idea behind this set of keybindings is that the most useful 
# commands will have the form ``A-?`` while less useful commands will have the 
# form ``A-C-?``.  This leaves enough room for somewhere around 50 commands.

from keyhelper import *

# Screen and Geometry Data
screen_width = 1680
screen_height = 1050

#x = division_width = 728
#y = division_height = 390

x = division_width = 648
y = division_height = 390

onyx = { "top" : 22, "bottom" : 2, "sides" : 2 }
clearlooks  = { "top" : 20, "bottom" : 5, "sides" : 2 }

vertical_padding = onyx["top"] + onyx["bottom"]
horizontal_padding = 2 * onyx["sides"]

normal_width = division_width - horizontal_padding
full_width = screen_width - horizontal_padding
expanded_width = full_width - division_width

third_width = (screen_width - 2 * horizontal_padding) // 3
third_position = t = third_width + horizontal_padding

top_height = division_height - vertical_padding
full_height = screen_height - vertical_padding
bottom_height = full_height - division_height

# Key to Action Bindings
switch_focus = {
        'Tab' : Action('NextWindow'),
        'S-Tab' : Action('PreviousWindow'),
        
        'w' : Action('DirectionalFocusNorth'),
        'a' : Action('DirectionalFocusWest'),
        's' : Action('DirectionalFocusSouth'),
        'x' : Action('DirectionalFocusSouth'),
        'd' : Action('DirectionalFocusEast'),

        'q' : Action('DirectionalFocusNorthWest'),
        'e' : Action('DirectionalFocusNorthEast'),
        'z' : Action('DirectionalFocusSouthWest'),
        'c' : Action('DirectionalFocusSouthEast'),

        'Return' : Action('DesktopNext'),
        'S-Return' : Action('DesktopPrevious'),
        'BackSpace' : Action('DesktopLast'),

        '1' : Desktop(1),
        '2' : Desktop(2),
        '3' : Desktop(3),
        '4' : Desktop(4),
        '5' : Desktop(5),
        '6' : Desktop(6),
        '7' : Desktop(7),
        '8' : Desktop(8),
        '9' : Desktop(9) }

move_windows = {
        'w' : MoveResizeTo(0, 0, full_width, top_height),
        'a' : MoveResizeTo(0, 0, normal_width, full_height),
        's' : MoveResizeTo(0, y, full_width, bottom_height),
        'd' : MoveResizeTo(x, 0, normal_width, full_height),
        'f' : MoveResizeTo(x, 0, expanded_width, full_height),

        'h' : MoveResizeTo(0, 0, normal_width, top_height),
        'j' : MoveResizeTo(0, y, normal_width, bottom_height),
        'k' : MoveResizeTo(x, 0, normal_width, top_height),
        'l' : MoveResizeTo(x, y, normal_width, bottom_height),

        'z' : MoveResizeTo(0 * t, 0, third_width, full_height),
        'x' : MoveResizeTo(1 * t, 0, third_width, full_height),
        'c' : MoveResizeTo(2 * t, 0, third_width, full_height),

        'i' : Action('Iconify'),
        'm' : Action('MaximizeFull'),
        'r' : Action('UnmaximizeFull'),

        'Return' : Action('SendToDesktopNext'),
        'S-Return' : Action('SendToDesktopPrevious'),
        'BackSpace' : Action('SendToDesktopLast'),

        '1' : SendToDesktop(1, False),
        '2' : SendToDesktop(2, False),
        '3' : SendToDesktop(3, False),
        '4' : SendToDesktop(4, False),
        '5' : SendToDesktop(5, False),
        '6' : SendToDesktop(6, False),
        '7' : SendToDesktop(7, False),
        '8' : SendToDesktop(8, False),
        '9' : SendToDesktop(9, False) }

run_commands = {
        't' : Execute('sakura'),
        'b' : Execute('firefox'),

        'v' : Execute('gvim'),
        'k' : Execute('keepassx'),
        'r' : Execute('rythymbox'),
        'e' : Execute('thunderbird'),

        'equal' : Action('AddDesktopCurrent'),
        'minus' : Action('RemoveDesktopCurrent'),
        'bracketright' : Action('AddDesktopLast'),
        'bracketleft' : Action('RemoveDesktopLast'),

        'd' : Action('Close'),

        'Escape' : Action('SessionLogout'),
        'BackSpace' : Action('Reconfigure') }

# XML Generation
keyboard = Keyboard()

for key, binding in switch_focus.items():
    binding.make(keyboard, 'A-'+key)
for key, binding in move_windows.items():
    binding.make(keyboard, 'A-C-'+key)
for key, binding in run_commands.items():
    binding.make(keyboard, 'A-S-'+key)

keyboard.write('keyboard.xml')
