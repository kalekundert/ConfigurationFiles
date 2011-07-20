#!/usr/bin/env zsh

# Usage: ./install.sh
#
# This script loops through all the configuration directories found here and
# allows each to install itself.  In each directory, there should be a script
# called `install.sh'.  This script will be executed, and if it returns a
# non-zero value then an error will be displayed.
#
# See the `report.sh' script for more details on how the output is produced and
# what the installation scripts are responsible for outputting.

INSTALL="install.sh"
REPORT="./report.sh"

# Give the installation scripts an absolute path to this directory.
export ROOT=`pwd`

for PROGRAM in *; do

    # Only descend into directories.  Don't bother trying to find install
    # scripts contained in regular files.
    if [[ -d $PROGRAM ]]; then

        # Deduce the name of the installation script and make sure it is
        # executable.
        COMMAND=$PROGRAM/$INSTALL
        chmod u+x $COMMAND

        # Execute the command using the report command,  which takes care of
        # producing attractive output.
        $REPORT $COMMAND
    fi

done
