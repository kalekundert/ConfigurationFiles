# Bash Startup:
# This file is symlinked to ~/.bashrc, which is read upon startup by 
# interactive shells (the more common type).  Login shells (the other type)
# read ~/.profile instead.  I've left that file unchanged, but it does
# source ~/.bashrc in this setup.  In other words, the commands in this
# file will be used to initialize every bash shell.

ENV_VARS_PATH=/home/kale/.bash/env-vars.sh
ALIASES_PATH=/home/kale/.bash/aliases.sh
PROMPT_PATH=/home/kale/.bash/prompt.sh

test -s $ENV_VARS_PATH && source $ENV_VARS_PATH
test -s $ALIASES_PATH && source $ALIASES_PATH
test -s $PROMPT_PATH && source $PROMPT_PATH 

# Enable vim-like line editing.
set -o vi

# Enable more powerful globbing.
shopt -s extglob

