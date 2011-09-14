echo "Skipping openbox configuration."

python $ROOT/compile.py

rm ~/.config/openbox/rc.xml
ln -s $ROOT/openbox/rc.xml ~/.config/openbox/rc.xml

openbox --reconfigure

exit $?
