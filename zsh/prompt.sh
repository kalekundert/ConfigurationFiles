# Set your preferred host and the name of the administrative user.  Both of
# these values will affect the prompt color and style.
host="cysteine"
admin="root"

# Colors:
normal=$'%{\e[0m%}'

black=$'%{\e[1;30m%}'
white=$'%{\e[1;37m%}'

red=$'%{\e[1;31m%}'
green=$'%{\e[1;32m%}'
blue=$'%{\e[1;34m%}'

yellow=$'%{\e[1;33m%}'
purple=$'%{\e[1;35m%}'
cyan=$'%{\e[1;36m%}'

# Prompts:
local='[%c] '
remote='[%c] %n@%m: '
continued=' ... '

# Choose a color for the prompt.  Normal users are yellow, the super-user
# is red, and remote users are blue.
color=$yellow

[[ `/bin/hostname` = $host ]] || color=$blue
[[ `/usr/bin/whoami` = $admin ]] && color=$red 

# Choose a prompt string.  For local users, the prompt will just be the current
# directory.  For remote users, the user and host names will also included.
[[ `/bin/hostname` = $host ]] && prompt=$local || prompt=$remote

# These two variable are where bash looks for the prompt string.
PS1=$color$prompt$normal
PS2=$color$continued$normal

# Add an extra control sequence to have the prompt string echoed in the
# terminal's title bar.
if [[ $TERM != "linux" ]] ; then
    PS1=$'%{\e]0;%~\007%}'${PS1}
fi
