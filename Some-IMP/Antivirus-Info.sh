#!/bin/bash
# A simple shell script to to check Symantec Antivirus Details
# command line. Tested on RHEL 6.x, RHEL 5.x
# ----------------------------------------------------------------------
# Written by Shekhar Raut
# ----------------------------------------------------------------------

#!/bin/bash
txtund=$(tput sgr 0 1)          # Underline
txtred=$(tput setaf 1)          #  red
txtblu=$(tput setaf 4)          #  blue
txtwht=$(tput setaf 7)          #  white
txtmg=$(tput setaf 5)           # Magneta
txtcy=$(tput setaf 3)		# yellow
bgmgt=$(tput setab 5)
bgred=$(tput setab 1)
bold=`tput bold`
normal=`tput sgr0`

MENU="
1   See Antivirus Details here
2   Email Antivirus Details
3   quit
"
 
while true; do
  
  echo "$MENU"
  echo -n "Please make your choice: "
  read INPUT # Read user input and assign it to variable INPUT
 
  case $INPUT in
    1)
		echo -en " $txtred Symantec Antivirus Details on $bold `hostname` $normal as Follows "
		echo "            "
		echo -e " \n Symantec Antivirus Details : $bgmgt$bold$txtcy Product $normal : "
		echo -e " \n \t\t\t\t\t\t $txtcy `/opt/Symantec/symantec_antivirus/sav info -p` $normal "
		echo -e " \n Symantec Antivirus Details : $bgmgt$bold$txtcy Engine $normal : "
		echo -e " \n \t\t\t\t\t\t $txtcy `/opt/Symantec/symantec_antivirus/sav info -e` $normal "
		echo -e " \n Symantec Antivirus Details : $bgmgt$bold$txtcy Definition $normal : "
		echo -e " \n \t\t\t\t\t\t $txtcy `/opt/Symantec/symantec_antivirus/sav info -d` $normal "
		echo -e " \n Symantec Antivirus Details : $bgmgt$bold$txtcy UPDATE $normal : "
		echo -e " \n \t\t\t\t\t\t $txtcy `/opt/Symantec/symantec_antivirus/sav liveupdate -v | awk '/Frequency/ {print}'` $normal "
		echo -e " \n Symantec Antivirus Details : $bgmgt$bold$txtcy Scheduled Scan $normal : \n"
		echo -e "$txtcy`/opt/Symantec/symantec_antivirus/sav scheduledscan -l` $normal"
		echo "                  "
;;

    2)
		echo "

<h4><font face="Verdana" size="3" color="#FF0000">Symantec Antivirus Details </font> <font face="Verdana" size="2"> on </font><font face="Verdana" size="3" color="#FE2E2E"> `hostname` </font><font face="Verdana" size="2"> as Follows : </font><h4>

<p><font face="Verdana" size="2" color="#848484"> Symantec Antivirus Details </font>: <font face="Verdana" size="2" color="#0000CC">Product </font> : </p>

<p><style="text-indent: 20em"><B><font face="Verdana" size="3" color="#DF013A">`/opt/Symantec/symantec_antivirus/sav info -p` </B></font></p>

<p><font face="Verdana" size="2" color="#848484"> Symantec Antivirus Details </font>: <font face="Verdana" size="2" color="#0000CC">Engine </font> : </p>

<p><style="text-indent: 20em"> <B> <font face="Verdana" size="3" color="#DF013A">`/opt/Symantec/symantec_antivirus/sav info -e`  </B></font></p>

<p><font face="Verdana" size="2" color="#848484"> Symantec Antivirus Details </font>: <font face="Verdana" size="2" color="#0000CC">Definition </font> : </p>

<p><style="text-indent: 20em"> <B> <font face="Verdana" size="3" color="#DF013A">`/opt/Symantec/symantec_antivirus/sav info -d`  </B></font></p>

<p><font face="Verdana" size="2" color="#848484"> Symantec Antivirus Details </font>: <font face="Verdana" size="2" color="#0000CC">UPDATE  </font> : </p>

<p><style="text-indent: 20em"> <B> <font face="Verdana" size="3" color="#DF013A">`/opt/Symantec/symantec_antivirus/sav liveupdate -v | awk '/Frequency/ {print}'` </B></font></p>

<p><font face="Verdana" size="2" color="#848484"> Symantec Antivirus Details </font>: <font face="Verdana" size="2" color="#0000CC">Scheduled Scan  </font> : </p>
<p></p>
<p><style="text-indent: 20em"> <B> <font face="Verdana" size="3" color="#DF013A">`/opt/Symantec/symantec_antivirus/sav scheduledscan -l` </B></font></p> " > /tmp/antivirus.html

echo "Please enter your mail Id : "
read email

uuencode /tmp/antivirus.html /tmp/antivirus.html | mailx -s 'Antivirus Info on `hostname`' $email
# OR
mailx -s 'Antivirus Info on `hostname`' $email < /tmp/antivirus.html

;;
   3|q|Q) # If user presses 3, q or Q we terminate
    exit 0
    ;;
    *) # All other user input results in an usage message
    clear
    echo Please choose alternatves 1, 2 or 3
    sleep 2
    ;;
esac
done

