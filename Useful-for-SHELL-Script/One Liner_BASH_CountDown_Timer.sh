# One Liner BASH CountDown Timer:

1.
for i in `seq 60 -1 1` ; do echo -ne "\r$i " ; sleep 1 ; done
2.
seconds=300; date1=$((`date +%s` + $seconds)); while [ "$date1" -ge `date +%s` ]; do echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; done


countdown=60 now=$(date +%s) watch -tpn1 echo '$((now-$(date +%s)+countdown))'
