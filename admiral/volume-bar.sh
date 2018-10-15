VOLUME=`amixer get Master | egrep -o "[0-9]+%" | head -n1`
MUTED=`amixer get Master | grep "\[on\]" | wc -l | tr -d "\r\n"`
TV_ON=`amixer get IEC958 | grep "\[on\]" | wc -l | tr -d "\r\n"`

COLOR="#f0f0f0"

if [ $MUTED -eq 0 ]
then
	IS_MUTED=" [off]"
	COLOR="red"
	VOLUME="0%"
fi

OUTPUT="TV"
if [ $TV_ON -eq 0 ]
then
	OUTPUT="PC"
fi

echo "<span color='$COLOR'>$VOLUME$IS_MUTED</span> $OUTPUT"
