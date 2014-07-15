#!/bin/bash
#
# Shell Script to install and configure Ldap Client
#
# Tested on : RHEL
#
# ----------------------------------------------------------------------------
# Before run this script:
#			Here we have LDAP server with fqdn: ldap.example.com which will reolve by our local DNS Server
#			Kindly replace path where you wish to store all ldif files
#
#------------------------------------------------------------------------------


FSTORE=/opt/ldap/ldif

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


  clear
  echo -en "$bgred$txtbld Please Enter First Name of User: $txtrst " 
  read a # Read user input and assign it to variable INPUT
  	if [ -n "$a" ]; then
		echo "First name saved."
	else
		echo "$txtred Blank First name inserted $txtrst"
		echo "$txtred First name should not be blank. $txtrst"
		echo "$txtbld$bgred$txtblu Please rerun script again.... $txtrst"
		exit 2
	fi

  echo -en "$bgred$txtbld Please Enter Last Name of User: $txtrst "
  read b # Read user input and assign it to variable INPUT
  	if [ -n "$b" ]; then
		echo "Last name saved."
	else
		echo "$txtred Blank Last name inserted $txtrst"
		echo "$txtred Last name should not be blank. $txtrst"
		echo "$txtbld$bgred$txtblu Please rerun script again.... $txtrst"
		exit 2
	fi

  echo -en "$bgred$txtbld Please Enter Desired UserName of User: $txtrst "
  read c # Read user input and assign it to variable INPUT
  	if [ -n "$c" ]; then
		echo "username name saved."
	else
		echo "$txtred Blank User name inserted $txtrst"
		echo "$txtred User name should not be blank. $txtrst"
		echo "$txtbld$bgred$txtblu Please rerun script again.... $txtrst"
		exit 2
	fi

  echo -en "$bgred$txtbld Please Enter Desired User Id: (eg. 1000 or 1201) $txtrst "
  read d # Read user input and assign it to variable INPUT
        if [ -n "$d" ]; then
                s=$(echo $d | tr -d 0-9)
                        if [ ! -z "$s" ]; then
                                echo "$txtred UID should be numeric. $txtrst"
                                echo "$txtbld$bgred$txtblu Please rerun script again.... $txtrst"
                                exit 2
                        else
                                echo "UID saved."
                        fi
        else
                echo "$txtred UID not inserted $txtrst"
                echo "$txtred UID should not be blank. $txtrst"
                echo "$txtbld$bgred$txtblu Please rerun script again.... $txtrst"
                exit 2
        fi


  echo -en "$bgred$txtbld Please Enter Desired Password: $txtrst "
  read e # Read user input and assign it to variable INPUT
  	if [ -n "$e" ]; then
		echo "Password saved."
	else
		echo "$txtred Blank Password inserted $txtrst"
		echo "$txtred Password should not be blank. $txtrst"
		echo "$txtbld$bgred$txtblu Please rerun script again.... $txtrst"
		exit 2
	fi


echo dn: uid=$c,ou=People,dc=ldap,dc=avnindia,dc=com > $FSTORE/$a$b.ldif
echo cn: $a >> $FSTORE/$a$b.ldif
echo sn: $b >> $FSTORE/$a$b.ldif
echo objectClass: top >> $FSTORE/$a$b.ldif
echo objectClass: Person >> $FSTORE/$a$b.ldif
echo objectClass: inetOrgPerson >> $FSTORE/$a$b.ldif
echo objectClass: organizationalPerson >> $FSTORE/$a$b.ldif
echo objectClass: posixAccount >> $FSTORE/$a$b.ldif
echo objectClass: shadowAccount >> $FSTORE/$a$b.ldif
echo userpassword: $e >> $FSTORE/$a$b.ldif
echo uid: $c >> $FSTORE/$a$b.ldif
echo uidNumber: $d >> $FSTORE/$a$b.ldif
echo gidNumber: $d >> $FSTORE/$a$b.ldif
echo loginShell: /bin/bash >> $FSTORE/$a$b.ldif
echo homeDirectory: /home/$c >> $FSTORE/$a$b.ldif
echo shadowLastChange: 10877 >> $FSTORE/$a$b.ldif
echo shadowMin: 0 >> $FSTORE/$a$b.ldif
echo shadowMax: 999999 >> $FSTORE/$a$b.ldif
echo shadowInactive: -1 >> $FSTORE/$a$b.ldif
echo shadowWarning: 7 >> $FSTORE/$a$b.ldif
echo shadowFlag: 0 >> $FSTORE/$a$b.ldif
echo shadowExpire: -1 >> $FSTORE/$a$b.ldif
echo   >> $FSTORE/$a$b.ldif
echo dn: gidNumber=$d,ou=Group,dc=ldap,dc=avnindia,dc=com >> $FSTORE/$a$b.ldif
echo cn: $c >> $FSTORE/$a$b.ldif
echo gidNumber: $d >> $FSTORE/$a$b.ldif
echo objectClass: top >> $FSTORE/$a$b.ldif
echo objectClass: posixGroup >> $FSTORE/$a$b.ldif

clear
echo -en "$txtred$txtbld $a $b User File $txtblu(ldif)$txtred has been created to $txtylw $FSTORE/ : $txtrst "
echo " "
echo -en "$bgred$txtbld Please Add User $a $b To LDAP Server : $txtrst "
echo " "

