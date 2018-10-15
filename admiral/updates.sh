UPDATES=`apt list --upgradeable 2>/dev/null | wc -l`
echo `expr $UPDATES - 1` updates

