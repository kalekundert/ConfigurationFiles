from xmlhelper import *

class Keyboard(object):
    def __init__(self, prefix='A-', chain_quit_key=None):
        document = make_document()
        keyboard = make_root(document, "keyboard")

        if chain_quit_key:
            chain_quit = make_text(
                    document, keyboard, "chainQuitKey", chain_quit_key)

        self.bindings = {}
        self.prefix = prefix

        self.document = document
        self.element = keyboard

    def bind(self, **bindings):
        self.bindings.update(bindings)

    def write(self, path):
        for key, action in self.bindings.items():
            action.make(self.document, self.element, self.prefix + key)

        with open(path, 'w') as file:
            self.document.writexml(
                    file, indent="  ", addindent="  ", newl="\n")

class Keybind(object):
    def __init__(self, parent, key, **arguments):
        document = parent.document
        element = parent.element

        keybind = make_element(
                document, element, "keybind", key=key, **arguments)

        self.document = document
        self.element = keybind

class Chroot(Keybind):
    def __init__(self, parent, key):
        Keybind.__init__(self, parent, key, chroot="true")

class Group(Keybind):
    def __init__(self, parent, key):
        Keybind.__init__(self, parent, key)

class Action(object):
    def __init__(self, action=None, **arguments):
        self.actions = [action] if action else []
        self.arguments = [arguments] if action else []

    def make(self, document, element, key):
        assert self.actions
        assert self.arguments

        keybind = make_element(document, element, "keybind", key=key)
        actions = zip(self.actions, self.arguments)

        for action, arguments in actions:
            action = make_element(document, keybind, "action", name=action)

            for argument, value in arguments.items():
                make_text(document, action, argument, str(value))

        self.document = document
        self.element = keybind

    def __add__(self, other):
        self.actions += other.actions
        self.arguments += other.arguments
        return self

class Execute(Action):
    def __init__(self, command, top=None, left=None, width=None, height=None):
        arguments = (top, left, width, height)
        empty = (None, None, None, None)

        if not arguments == empty:
            geometry = ' --geometry %dx%d+%d+%d' % (width, height, top, left)
            command = command + geometry

        Action.__init__(self, "Execute", command=command)

class Desktop(Action):
    def __init__(self, desktop):
        Action.__init__(self, "Desktop", desktop=desktop)

class SendToDesktop(Action):
    def __init__(self, desktop, follow):
        Action.__init__(self, "SendToDesktop", desktop=desktop, follow=follow)

class MoveResizeTo(Action):
    def __init__(self, x, y, width, height):
        Action.__init__(self)

        self += Action("UnmaximizeFull")
        self += Action("MoveResizeTo", x=x, y=y, width=width, height=height)

