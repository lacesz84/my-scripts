#!/bin/sh

cat vcc-servers | parallel --no-notice -j 35 "if ssh -q {} "grep -w $1 /etc/icallbox/customers.ini" > /dev/null; then echo "VCC server found: {}"; fi"