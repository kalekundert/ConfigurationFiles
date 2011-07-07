# Set to 0 for light backgrounds and 1 for dark ones.  This is used to choose
# colors that will show up nicely.
bg=1

# Set the name of your preferred host and the name of the administrative user.
# Both of these values will affect the prompt color and style.
host="cysteine"
admin="root"

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

# Prompts:
local='[\W] '
remote='[\W] \u@\h: '
continued=' ... '

# Choose a color for the prompt.  Normal users are yellow, the super-user
# is red, and remote users are blue.
[[ `/usr/bin/whoami` = $admin ]] && color=$red || color=$yellow
[[ `/bin/hostname` = $host ]] && color=$color || color=$blue

# Choose a prompt string.  For local users, the prompt will just be the current
# directory.  For remote users, the user and host names will also included.
[[ `/bin/hostname` = $host ]] && prompt=$local || prompt=$remote

# These two variable are where bash looks for the prompt string.
PS1=$color$prompt$normal
PS2=$color$continued$normal

# Add an extra control sequence to have the prompt string echoed in the
# terminal's title bar.
if [[ $TERM != "linux" ]] ; then
    PS1="\[\e]0;\w\007\]"${PS1}
fi
