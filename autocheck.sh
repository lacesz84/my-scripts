#!/bin/bash -i

if [ -z $1 ]; then
   echo "Usage: autocheck directory command";
   echo "Example:";
   echo " autocheck . phpunit";
   exit 0;
fi

echo -ne "\033c"
${@:2}

while true; do
   change=$(inotifywait --exclude=".git" -rq -e close_write,moved_to,create $1)
   echo -ne "\033c"
   ${@:2}
done

