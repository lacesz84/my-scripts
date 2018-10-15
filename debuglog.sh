#!/bin/sh

customer=$1

if [ $# -ne 1 ]; then
    echo "Usage: debuglog.sh <customer>"
    exit 1
else
    host=$customer.asp.virtual-call-center.eu
    ssh $host tail -f /tmp/debugLog-$customer 2>/dev/null
fi