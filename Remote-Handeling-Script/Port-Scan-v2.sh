#!/bin/bash

## Color Code:
txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
txtblk=$(tput setaf 0)          # Black
txtred=$(tput setaf 1)          # Red
txtgrn=$(tput setaf 2)          # Green
txtylw=$(tput setaf 3)          # Yellow
txtblu=$(tput setaf 4)          # Blue
txtmgn=$(tput setaf 5)          # Magenta
txtcyn=$(tput setaf 6)          # Cyan
txtwht=$(tput setaf 7)          # White
txtrst=$(tput sgr0)             # Reset
bgmgt=$(tput setab 5)
bgred=$(tput setab 1)

### Default Values

ServerList=${1:-00ServerList}
OutputFile=${2:-port_scan.log}

linux_output_file="linux.txt"
win_output_file="win.txt"

file_find () {
    for server in $(cat $ServerList); do
        echo "Checking server: $server"
        if nc -zvw3 $server 22 2>&1 | grep -q "Connected"; then
            echo "$server" >> "$linux_output_file"
            echo -e "$txtgrn[$server] ➜ SSH Port (22) is open$txtrst"
        fi
        if nc -zvw3 $server 3389 2>&1 | grep -q "Connected"; then
            echo "$server" >> "$win_output_file"
            echo -e "$txtblu[$server] ➜ RDP Port (3389) is open$txtrst"
        fi
        echo -e "\n"
    done
}

if [ -f "$ServerList" ]; then
    file_find
else
    echo -e "$txtred Error: ServerList file '$ServerList' not found. $txtrst"
    exit 1
fi

echo -e "\n ↓ ↓ ↓ ↓ ↓ \n ➜ $txtbld$bgred Note:$txtrst$txtblu You can also find results in:$txtmgn $OutputFile $txtrst \n"
