#!/bin/bash
# Let's loop to see if it hits diff backend pods (it should)

# Process args
if [ $# -lt 2 ] ; then
    echo "Usage: `basename $0` <svc-ip:port> <iterations>"
    exit 0
fi

for(( i=1; i<=$2; i++)); do
    curl $1
done
