#!/usr/bin/env zsh

# Make sure the ~/.ssh directory exists.
mkdir -p ~/.ssh

# Try to link each configuration file into the ~/.ssh directory.  If any of
# these links cannot be created, give up and report failure.
for FILE in *; do
    ln -s $ROOT/$FILE ~/.ssh
    [ $? -ne 0 ] && exit 1
done

# Return a success code if nothing failed.
exit 0
