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

    # SSH is fairly fussy about permissions and symbolic links.  It's better
    # for ~/.ssh/config and ~/.ssh/authorized_keys to be real files owned by
    # the user running the installation script.
    if [ $FILE -ef "config" ] || [ $FILE -ef "authorized_keys" ]; then
        rm -f ~/.ssh/$FILE
        cp $ROOT/ssh/$FILE ~/.ssh

    # The rest of the files can be symbolic links, since ssh doesn't
    # directly use them.
    else
        rm -f ~/.ssh/$FILE
        ln -s $ROOT/ssh/$FILE ~/.ssh
    fi

    [ $? -ne 0 ] && exit 1

done

# Return a success code if nothing failed.
exit 0
