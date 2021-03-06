# Source all of the configuration files.
ENV_VARS_PATH=~/.zsh/env-vars.sh
ALIASES_PATH=~/.zsh/aliases.sh
PROMPT_PATH=~/.zsh/prompt.sh

COMPLETION_PATH=~/.zsh/completion

test -s $ENV_VARS_PATH && source $ENV_VARS_PATH
test -s $ALIASES_PATH && source $ALIASES_PATH
test -s $PROMPT_PATH && source $PROMPT_PATH 

for COMPLETION in $COMPLETION_PATH/*.sh; do
    source $COMPLETION
done

# Configure command-line history.
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000

# Enable vim-like line editing.
bindkey -v

# Enable extended globbing.
setopt extended_glob

# The following lines were added by compinstall
zstyle :compinstall filename '/home/kale/.zshrc'
autoload -Uz compinit && compinit

