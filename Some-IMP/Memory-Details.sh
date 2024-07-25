#!/bin/sh

# This script displays the top memory-consuming processes in a human-readable format.
# It accepts one argument: the number of top processes to display.

# List processes with their memory usage, PID, user, and command line,
# then sort them by memory usage in descending order and pick the top ones as specified by the script's argument.
ps -eo rss,pid,user,command | sort -rn | head -$1 | awk '
  BEGIN {
    # Define human-readable memory size units.
    hr[1024**2]="GB"; hr[1024]="MB";
  }
  {
    # Convert the memory usage to a human-readable format.
    for (x=1024**3; x>=1024; x/=1024) {
      if ($1>=x) {
        printf ("%-6.2f %s ", $1/x, hr[x]); 
        break;
      }
    }
  }
  {
    # Print the process ID and user.
    printf ("%-6s %-10s ", $2, $3);
  }
  {
    # Print the command line, handling commands with spaces.
    for (x=4; x<=NF; x++) {
      printf ("%s ", $x);
    }
    print ("\n"); # Ensure each process info is on a new line.
  }
'
 # Check if vmw_balloon module is loaded
 if lsmod | egrep -q "vmw_balloon|vmware_balloon"; then
      echo -e "vmw_balloon module is enabled and consuming: \033[1;31m\033[1m$(vmware-toolbox-cmd stat balloon)\033[0m"
  fi
