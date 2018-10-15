CPU=`top -bn 1 | awk 'NR>7{s+=$9} END {print s/4}'`

echo CPU: $CPU%
