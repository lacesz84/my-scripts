#!/bin/bash

if [ -z "$1" ];
	then
		echo 'Server argument is missing!'
		exit
fi

if [ $1 -eq '27' ];
	then
		scpCommand='scp default.zip vcc27:/opt/iCall/xas/server/uploaded_files/script_html/vcc27test/26'
elif [ $1 -eq '36' ];
	then
		scpCommand='scp default.zip vcc36:/opt/iCall/xas/server/uploaded_files/script_html/upcnb/2'
elif [ $1 -eq '30' ];
        then
                scpCommand='scp default.zip vcc30:/opt/iCall/xas/server/uploaded_files/script_html/upcb2b/7'

else
	echo 'Invalid server name!'
	exit;
fi

scriptFound=`ls -l | grep default.js | wc -l`
if [ $scriptFound -eq 0 ];
	then
		echo 'Script not found!'
		exit
fi

count=`cat default.js |grep 'debug = true' | wc -l`
if [ $count -eq 0 ];
 then
	zip -r default.zip *
	$scpCommand
	rm default.zip
else
	echo 'Please disable debug mode!'
fi

