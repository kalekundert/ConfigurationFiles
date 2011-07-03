# Escape Sequences:
#  \W: The abbreviated current directory
#  \w: The full directory path
#  \!: The history number
#  \j: The job number 
#  \u: The user name
#  \h: The host name
#
#  \[: Begins a group of non-printing characters
#  \]: Ends a group of non-printing characters
#
#  More sequences can be found in the bash man page.  (Search for the
#  second occurrence of "prompting".)

# Color Information:
# I don't know why, but color codes have to be enclosed by \[\e[ and m\].
# A complete list of the codes (to my knowledge) is given below.  Each code
# has three parts: the attribute, the foreground color, and the background
# color.  These values are given in that order, separated by a semicolons.
# If only one value is given, it is taken to be the foreground color.
#
# Using a color code affects everything that comes after it, so you just
# have to concatenate the color string to the prompt string to make the 
# prompt colored.  However, this does mean that you have to reset the color
# to $default after the prompt string, otherwise everything the user types
# afterwards will also be colored.
#
# It may be possible to change how ls displays with color by creating a
# color database with dircolors -p > colors.db, modifying that file, then
# exporting the colors with eval $(dircolors -b colors.db).  However, I
# couldn't quite get this to work.
#
# Here are the attribute codes:
#  None         0       Blinking        5
#  Bold         1       Reversed        7
#  Underscored  4       Concealed       8
#
# Here are the codes for a number of different colors.  The foreground
# code is first, the background is second.  Making the color "bold" will
# also make it lighter:
#  Black        30/40   Blue            34/44
#  Red          31/41   Purple          35/45
#  Green        32/42   Cyan            36/46
#  Yellow       33/43   Light Gray      37/47

# Background:
# Making text bold makes it more readable on dark backgrounds, since it
# will be both thicker and lighter.  Setting bg=1 will make all the colors
# bold while setting bg=0 won't do anything.
bg=1

# Colors:
normal='\[\e[0m\]'

white='\[\e[$bg;37m\]'
black='\[\e[$bg;30m\]'

red='\[\e[$bg;31m\]'
green='\[\e[$bg;32m\]'
blue='\[\e[$bg;34m\]'

yellow='\[\e[$bg;33m\]'
purple='\[\e[$bg;35m\]'
cyan='\[\e[$bg;36m\]'

# Simple Prompt:
simple='[\W] '
simple_user=$yellow$simple$normal
simple_root=$red$simple$normal

# SSH Prompt:
ssh='[\W] \u@\h: '
ssh_user=$blue$ssh$normal
ssh_root=$red$ssh$normal

# Second Prompt
second=' ... '
second_user=$yellow$second$normal
second_root=$red$second$normal
second_ssh=$blue$second$normal

# Complex Prompt:
complex_user=${green}"[\!] "${blue}"\u@\h "${red}"\w "${normal}"\n$ "
complex_root=${red}"[\!] \u@\h \w"${red}"\n$ "${normal}

# Prompt:
[[ `/usr/bin/whoami` = "root" ]] && is_root="true"
[[ `/bin/hostname` = "cysteine" ]] && is_local="true"


if [[ $is_root && $is_local ]] ; then
    PS1=$simple_root
    PS2=$second_root
elif [[ !$is_root && $is_local ]] ; then
    PS1=$simple_user
    PS2=$second_user
elif [[ $is_root && !$is_local ]] ; then
    PS1=$ssh_root
    PS2=$second_root
else
    PS1=$ssh_user
    PS2=$second_ssh
fi

# Title Bar:
if [[ $TERM != "linux" ]] ; then
    PS1="\[\e]0;\w\007\]"${PS1}
fi
