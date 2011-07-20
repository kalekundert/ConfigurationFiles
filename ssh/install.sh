#!/usr/bin/env zsh

echo "Configuring ssh."
echo $ROOT >&2

# Make sure the ~/.ssh directory exists.
mkdir -p ~/.ssh

# Move into the ssh configuration directory.
cd ssh

# Try to link each configuration file into the ~/.ssh directory.  If any of
# these links cannot be created, give up and report failure.
for FILE in *; do

    rm -f ~/.ssh/$FILE
    ln -s $ROOT/ssh/$FILE ~/.ssh

    # You have to own the ~/.ssh/config file, so a symbolic link won't work.
    # Instead, explicitly copy this file.
    if [ $FILE -ef "config" ]; then
        rm -f ~/.ssh/$FILE
        cp $ROOT/ssh/$FILE ~/.ssh

        echo "rm -f ~/.ssh/$FILE" >&2
        echo "cp $ROOT/ssh/$FILE ~/.ssh" >&2
    fi

    [ $? -ne 0 ] && exit 1

done

# Return a success code if nothing failed.
exit 1
