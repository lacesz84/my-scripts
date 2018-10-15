#!/bin/sh
i3-msg 'workspace "4: 4 - Other"'
i3-msg 'move workspace to output DP1'
i3-msg 'exec terminator -r vcc-console -x /home/laci/src/client-app/application/start.py'
i3-msg '[class="Virtual call center"] resize set 800 600'
i3-msg '[class="Virtual call center"] move position 400 300'
i3-msg 'workspace "7: 7 - VCC Console"'
sleep 1
#i3-msg 'workspace "7: 7 - VCC Console"'
i3-msg 'move workspace to output HDMI2'
#i3-msg 'workspace "4: 4 - Other"'

