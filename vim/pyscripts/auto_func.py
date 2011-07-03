import vim

NUMBER = 0
TAB = "    "

LINES = []
BEGINNING, FUNCTIONS, END = ([], [], [])

INDENT = ""

def prepare():
    global LINES
    global BEGINNING, FUNCTIONS, END
    global LINE, INDENT
    global NUMBER

    # Beginning of the function list
    NUMBER = vim.current.range.start + 1

    # Splitting the first line to determine INDENT
    index = vim.current.line.rfind(TAB) + len(TAB)
    line = vim.current.line[index:].strip()
    INDENT = vim.current.line[0:index]

    LINES = []
    BEGINNING, FUNCTIONS, END = ([], [], [])

    BEGINNING = vim.current.buffer[0:NUMBER - 1]

    while line:
        LINES.append(line)

        # Getting the next line in the buffer
        NUMBER += 1
        line = vim.current.buffer[NUMBER - 1]
        line = line.strip()

    END = vim.current.buffer[NUMBER:]

def make_setter_methods():
    global FUNCTIONS
    for variable in LINES:
        FUNCTIONS.append("%sdef set_%s(self, %s):" % (INDENT, variable, variable))
        FUNCTIONS.append("%s%sself.__%s = %s" % (INDENT, TAB, variable, variable))
    FUNCTIONS.append("")

def make_getter_methods():
    global FUNCTIONS
    for variable in LINES:
        FUNCTIONS.append("%sdef get_%s(self):" % (INDENT, variable))
        FUNCTIONS.append("%s%sreturn self.__%s" % (INDENT, TAB, variable))
    FUNCTIONS.append("")

def make_properties():
    global FUNCTIONS
    for variable in LINES:
        FUNCTIONS.append("%s%s = property(get_%s, set_%s)" % (INDENT, variable, variable, variable))
    FUNCTIONS.append("")

def finalize():
    vim.current.buffer[:] = BEGINNING + FUNCTIONS + END
