#!/bin/bash
# A simple shell script to Rename Old Logs
# command line. Tested on RHEL 6.x, RHEL 5.x, and Ubuntu Linux
# ----------------------------------------------------------------------
# Written by Shekhar Raut
# ----------------------------------------------------------------------

logfsrc=<path to log files>

mDate=$(date +%d%m%Y)
cd $logfsrc
find . -daystart -mtime 1 | while read mFName
 do
  mPref=${mFName%.log}
  mv ${mFName} ${mPref}${mDate}.log
done

