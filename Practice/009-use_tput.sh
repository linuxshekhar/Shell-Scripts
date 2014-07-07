#!/bin/bash
#Script for tput in action

tput clear

echo "Total numbers of columns on screen \c"
tput lines

echo "Total numbers of columns on screen \c"
tput cols

tput cup 15 20

tput bold
echo "Now we are writing in bold.... \033[0m bold ended."


