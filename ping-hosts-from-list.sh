#!/bin/bash
#
# A simple shell script to Ping Systems from the list
#
# Tested on : Ubuntu 14.04 (Trusty)
#
# ----------------------------------------------------------------------------

for host in $( cat <Location-to-List> )
do
	ping -c 1 $host >/dev/null 2>&1 && echo "$host up and running" || echo "$host down"
done
