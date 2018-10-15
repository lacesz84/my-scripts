 #!/bin/sh

i3-msg 'exec terminator --role vcc-console -x ~/src/client-app/application/start.py -b'
i3-msg 'workspace "6: 6 - VCC Console"'
i3-msg 'move workspace to output HDMI2'

while true; do
	if i3-msg -t get_tree | grep "Vcc live desk" > /dev/null
		then
			echo "VCC started"
			i3-msg '[class="Vcc live desk"] move to workspace "4: 4 - Client"'
			i3-msg 'workspace "4: 4 - Client"'
			i3-msg 'move workspace to output DP1'
                        i3-msg '[class="Vcc live desk"] floating enable'
			i3-msg '[class="Vcc live desk"] resize set 800 600'
			i3-msg '[class="Vcc live desk"] move position 400 300'
                        i3-msg 'workspace "4: 4 - Client"'

			exit 1
	fi
	sleep 0.5
done
