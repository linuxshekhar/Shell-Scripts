# One Liner BASH CountDown Timer:

countdown=60 now=$(date +%s) watch -tpn1 echo '$((now-$(date +%s)+countdown))'
