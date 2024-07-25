#!/bin/bash
#
# A simple shell script to check if Remote Server from the list is reachable through Port 22 or 3389
#
# ----------------------------------------------------------------------------
#
# First create `00ServerList` file which having Server list
# OR
# Add single ip/hostname with script
# This Script will also capture the output in one file

## Color Code:

txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
txtblk=$(tput setaf 0)          # Black
txtred=$(tput setaf 1)          # Red
txtgrn=$(tput setaf 2)          # Green
txtylw=$(tput setaf 3)          # Yellow
txtblu=$(tput setaf 4)          # Blue
txtmgn=$(tput setaf 5)          # Magneta
txtcyn=$(tput setaf 6)          # Cyan
txtwht=$(tput setaf 7)          # White
txtrst=$(tput sgr0)             # Reset
bgmgt=$(tput setab 5)
bgred=$(tput setab 1)

### Default Values

ServerList=${1:-00ServerList}
OutputFile=${2:-port_scan.log}

file_find () {
        for server in $(more $ServerList)
                do
                        echo $server| tee -a $OutputFile
                        nc -zvw3  $server 22 2>&1 | tee -a $OutputFile
                        nc -zvw3  $server 3389 2>&1 | tee -a $OutputFile
                        echo -en '\n'| tee -a $OutputFile
                done
}

if [ -f "$ServerList" ]; then
        file_find
else
        echo $ServerList | tee -a $OutputFile
        nc -zvw3  $ServerList 22 2>&1 | tee -a $OutputFile
        nc -zvw3  $ServerList 3389 2>&1 | tee -a $OutputFile
        echo -en '\n'| tee -a $OutputFile
fi

echo -en "\n ↓ ↓ ↓ ↓ ↓ \n ➜ $txtbld$bgred Note:$txtrst$txtblu You can also find results in:$txtmgn $OutputFile $txtrst \n"
