#!/bin/bash
# Internal Field Separator in Action 2

line="SHELL Script begins to fun."

set $line

echo $1
echo $2
echo $3
echo $4


line="SHELL:Script:begins:to:fun." 

IFS=:

set $line

echo $1
echo $2
echo $3
echo $4
