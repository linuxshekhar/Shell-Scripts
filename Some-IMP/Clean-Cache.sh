#!/bin/bash
# A simple shell script to Free Cache Memory
# command line. Tested on RHEL 6.x, RHEL 5.x, and Ubuntu Linux
# ----------------------------------------------------------------------
# Written by Shekhar Raut
# ----------------------------------------------------------------------

sync && /sbin/sysctl -w vm.drop_caches=3 && /sbin/sysctl -w vm.drop_caches=0

