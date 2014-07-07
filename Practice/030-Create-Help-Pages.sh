#!/bin/bash

# vim commandlist
#cat
#date
#vim
#touch
#cal

# Fetch and Create Help pages for Commands from a file 
for cmd in `cat commandlist`
	do
		man $cmd >> helpfile.txt
	done
