#!/bin/bash

## COLOR CODES:

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

## VARIABLES:

DATE=$(date +%Y%m%d-%T)

## DEFAULT VALUES:

ServerList=${1:-00ServerList}
PortList=${2:-11PortList}
OutputFile=${3:-multiple_port_scan.log}

## HELP PRINT:

help () {
    echo "$txtbld$bgred Usage: $txtrst"
    echo "$txtund This script can be use if You have Server Hostname/IP Address and Port Number:$txtrst"
    echo "  $txtbldtxtylw 1.$txtrst Create a file and add list of Server Hostname/IP Address in file named $txtbld$txtmgn 00ServerList $txtrst"
    echo "  $txtbldtxtylw 2.$txtrst Create a file and add Port numbers in file named $txtbld$txtmgn 11PortList $txtrst"
    echo "  $txtbldtxtylw 3.$txtrst Provide Server details and port number as argument$txtrst"
    echo "  $txtbldtxtylw 4.$txtrst Provide Server details as argument$txtrst"
    echo ""
    echo "$txtbld$bgred Note:$txtrst This script will capture the output in file for future reference"
    echo ""
    echo "$txtbld$txtundFor Example:$txtrst"
    echo "$txtblu my-multiple_port_scan.sh <Server Details> <Port Details> <Output File Name>$txtrst"
    echo ""    
}

log_file_check_rename () {
    if [ -f "$OutputFile" ]; then
      echo "Log file $OutputFile is present so renaming this file"
      mv $OutputFile $OutputFile-$DATE
    fi
}

log_file () {
    if [ -f "$OutputFile" ]; then
      echo -en "\n ↓ ↓ ↓ ↓ ↓ \n ➜ $txtbld$bgred Note:$txtrst$txtblu You can also find results in:$txtmgn $OutputFile $txtrst \n"
    fi
}

both_files () {
    cat -n $ServerList | while read number server
      do
        cat $PortList | while read port
          do
            echo "$number $server on Port $port" | tee -a $OutputFile
            nc -zvw3 $server $port 2>&1 | tee -a $OutputFile
            echo "" | tee -a $OutputFile
          done
      done
}

host_file () {
    cat -n $ServerList | while read number server
      do
        echo "$number $server on Port 22" | tee -a $OutputFile
        nc -zvw3  $server 22 2>&1 | tee -a $OutputFile
        echo "" | tee -a $OutputFile
        echo "$number $server on Port 3389" | tee -a $OutputFile
        nc -zvw3  $server 3389 2>&1 | tee -a $OutputFile
        echo "" | tee -a $OutputFile
      done
}

port_file () {
    cat -n $PortList | while read number port
      do
        echo "$number $ServerList on Port $port" | tee -a $OutputFile
        nc -zvw3 $ServerList  $port 2>&1 | tee -a $OutputFile
        echo "" | tee -a $OutputFile
      done
}

log_file_check_rename

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then 
    help
    exit 0
elif [ -f "$ServerList" ] && [ -f "$PortList" ]; then
    both_files
elif [ -f "$ServerList" ] && [ ! -f "$PortList" ]; then
    host_file
elif [ ! -f "$ServerList" ] && [ -f "$PortList" ]; then
    port_file
elif [ ! -f "$ServerList" ] && [ ! -f "$PortList" ]; then
    if [ -z "$*" ]; then 
      echo -n "$txtbld$bgred Note:$txtrst$txtred Neither Server details are provided nor required files are present in the directory. \n$txtrst"
      help
      exit 1
    fi
else
        echo $ServerList | tee -a $OutputFile
        nc -zvw3  $ServerList 22 2>&1 | tee -a $OutputFile
        nc -zvw3  $ServerList 3389 2>&1 | tee -a $OutputFile
        echo -en '\n'| tee -a $OutputFile
fi

log_file
