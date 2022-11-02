#!/bin/bash
#
# A simple shell script to check if Remote Server from the list is reachable through Ports. 
# Or if no ports are provided then it will check 22 or 3389 Port.
#
# ----------------------------------------------------------------------------
#
# Create `00ServerList` file which having Server list
# Create `11PortList` file having Port list
# OR
# Add single ip/hostname with script
# This Script also capture the output in a file as well. 

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
PortList=${2:-11PortList}
OutputFile=${3:-multiple_port_scan.log}

both_files () {
        for server in $(more $ServerList)
        do
                for port in $(more $PortList)
                do
                        echo $server | tee -a $OutputFile
                        nc -zvw3 $server $port 2>&1 | tee -a $OutputFile
                        echo "" | tee -a $OutputFile
                done
        done
}

host_file () {
        for port in $(more $PortList)
        do
                echo $ServerList | tee -a $OutputFile
                nc -zvw3  $ServerList 22 2>&1 | tee -a $OutputFile
                nc -zvw3  $ServerList 3389 2>&1 | tee -a $OutputFile
                echo "" | tee -a $OutputFile
        done
}

port_file () {
        for port in $(more $PortList)
        do
                echo $ServerList | tee -a $OutputFile
                nc -zvw3 $ServerList  $port 2>&1 | tee -a $OutputFile
                echo "" | tee -a $OutputFile
        done
}

if [ -f "$ServerList" ] && [ -f "$PortList"]; then
        both_files
elif [ -f "$ServerList" ] && [ ! -f "$PortList"]; then
        host_file
elif [ ! -f "$ServerList" ] && [ -f "$PortList" ]; then
        port_file
else
        echo $ServerList | tee -a $OutputFile
        nc -zvw3  $ServerList 22 2>&1 | tee -a $OutputFile
        nc -zvw3  $ServerList 3389 2>&1 | tee -a $OutputFile
        echo -en '\n'| tee -a $OutputFile
fi

echo -en "\n ↓ ↓ ↓ ↓ ↓ \n ➜ $txtbld$bgred Note:$txtrst$txtblu You can also find results in:$txtmgn $OutputFile $txtrst \n"
