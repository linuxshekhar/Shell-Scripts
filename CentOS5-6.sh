#!/bin/bash
#
# A simple shell to install and configure Wordpress Initial phase, to start webserver
# Script is tested on CentOS 5x, CentOS 6x
#
# ----------------------------------------------------------------------------
#
#                               Written by Shekhar Raut
#
# ----------------------------------------------------------------------------
#
#                                                        Dt. July 26, 2012
#
# ----------------------------------------------------------------------------
#
#                                                Last updated: July 27, 2012
#
# ----------------------------------------------------------------------------
#		Question Covered In this script : 1, 2, 3, 4, 5, 6, 7, 8, 9

txtund=$(tput sgr 0 1)          # Underline
txtbld=$(tput bold)             # Bold
txtred=$(tput setaf 1)          #  red
txtblu=$(tput setaf 4)          #  blue
txtwht=$(tput setaf 7)          #  white
txtmg=$(tput setaf 5)           # Magneta
txtcy=$(tput setaf 3)		# yellow
txtrst=$(tput sgr0)             # Reset
bgmgt=$(tput setab 5)
bgred=$(tput setab 1)
ip=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
APACHE_HOME=/var/www/html

clear
echo -e " We are using $txtbld$bgmgt$txtcy `cat /etc/issue | awk '{print $1,$2,$3,$4,$5}'|sed -n 1p` $txtrst \n your IP_Address is $txtbld$bgmgt$txtcy $ip $txtrst" > /tmp/menu

MENU=" `cat /tmp/menu`
We are going to install Wordpress.
For efficiency, WE have devide the script into some part. Please find the details make your choise.

1   Download Wordpress
2   Install LAMP Server
3   Install Wordpress with Domain name & other details
4   quit"

  clear
  echo "$MENU"
  echo -n "Please make your choice: "
  read INPUT # Read user input and assign it to variable INPUT

case $INPUT in
    1) ## If User Press 1 Then Script Starts from here

echo -e " $txtbld$bgmgt$txtcy Wordpress $txtrst is going to download. Please wait"

wget http://wordpress.org/latest.zip

if [ "$?" = "0" ]; then
        echo " Your Wordpress Source has been downloaded successfully. "
else
        echo -e " $bgred Wordpress is not downloaded properly.$txtrst  \n $txtmg Please download it and put it in `pwd` $txtrst " 1>&2
        exit 1
fi

echo "Now $txtblu$txtbld Please Run script again. And Select Next option $txtrst"
	;;


   2) ## If User Press 2 Then Script Starts from here

echo -e "$txtmg$txtbld LAMP-Server $txtrst is going to install. \n Please Wait ............. "

############ Question no. 1

if [ `grep -o '[0-9]' /etc/issue | sed -n 1p` = 6 ]; then

if [ "`rpm -qi mysql | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld Mysql $txtrst $txtcy is not install. Installing Mysql $txtrst "
        yum -y  install mysql
else
	echo -e " $txtcy $txtbld Mysql $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi mysql-server | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld Mysql-Server $txtrst $txtcy is not install. Installing Mysql-Server $txtrst "
        yum -y  install mysql-server
else
	echo -e " $txtcy $txtbld Mysql-Server $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi httpd | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld Apache $txtrst $txtcy is not install. Installing Apache $txtrst "
        yum -y  install httpd
else
	echo -e " $txtcy $txtbld Apache $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP $txtrst $txtcy is not install. Installing PHP $txtrst "
        yum -y  install php
else
	echo -e " $txtcy $txtbld PHP $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-common | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-Common $txtrst $txtcy is not install. Installing PHP-Common $txtrst "
        yum -y  install php-common
else
	echo -e " $txtcy $txtbld PHP-Common $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-mysql | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-MySql $txtrst $txtcy is not install. Installing PHP-MySql $txtrst "
        yum -y  install php-mysql
else
	echo -e " $txtcy $txtbld PHP-MySql $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-gd | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-GD $txtrst $txtcy is not install. Installing PHP-GD $txtrst "
        yum -y  install php-gd
else
	echo -e " $txtcy $txtbld PHP-GD $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-imap | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-IMAP $txtrst $txtcy is not install. Installing PHP-IMAP $txtrst "
        yum -y  install php-imap
else
	echo -e " $txtcy $txtbld PHP-IMAP $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-ldap | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-Ldap $txtrst $txtcy is not install. Installing PHP-Ldap $txtrst "
        yum -y  install php-ldap
else
	echo -e " $txtcy $txtbld PHP-Ldap $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-odbc | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-ODBC $txtrst $txtcy is not install. Installing PHP-ODBC $txtrst "
        yum -y  install php-odbc
else
	echo -e " $txtcy $txtbld PHP-ODBC $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-pear | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-Pear $txtrst $txtcy is not install. Installing PHP-Pear $txtrst "
        yum -y  install php-pear
else
	echo -e " $txtcy $txtbld PHP-pear $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-xml | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-XML $txtrst $txtcy is not install. Installing PHP-XML $txtrst "
        yum -y  install php-xml
else
	echo -e " $txtcy $txtbld PHP-XML $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php-xmlrpc | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-XMLRpc $txtrst $txtcy is not install. Installing PHP-XMLRpc $txtrst "
        yum -y  install php-xmlrpc
else
	echo -e " $txtcy $txtbld PHP-XMLRpc $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

elif [ `grep -o '[0-9]' /etc/issue | sed -n 1p` = 5 ]; then

if [ "`rpm -qi php | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP $txtrst $txtcy (Old Version) is not install.$txtrst "
else
	echo -e " $txtcy $txtbld PHP $txtrst $txtcy (Old Version) is installed. Removing Old version of PHP Package $txtrst "
        yum -y  remove php php-common php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc
fi

if [ "`rpm -qi mysql | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld Mysql $txtrst $txtcy is not install. Installing Mysql $txtrst "
        yum -y  install mysql
else
	echo -e " $txtcy $txtbld Mysql $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi mysql-server | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld Mysql-Server $txtrst $txtcy is not install. Installing Mysql-Server $txtrst "
        yum -y  install mysql-server
else
	echo -e " $txtcy $txtbld Mysql-Server $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi httpd | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld Apache $txtrst $txtcy is not install. Installing Apache $txtrst "
        yum -y  install httpd
else
	echo -e " $txtcy $txtbld Apache $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53 | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP $txtrst $txtcy is not install. Installing PHP $txtrst "
        yum -y  install php53
else
	echo -e " $txtcy $txtbld PHP $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-common | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-Common $txtrst $txtcy is not install. Installing PHP-Common $txtrst "
        yum -y  install php53-common
else
	echo -e " $txtcy $txtbld PHP-Common $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-mysql | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-MySql $txtrst $txtcy is not install. Installing PHP-MySql $txtrst "
        yum -y  install php53-mysql
else
	echo -e " $txtcy $txtbld PHP-MySql $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-gd | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-GD $txtrst $txtcy is not install. Installing PHP-GD $txtrst "
        yum -y  install php53-gd
else
	echo -e " $txtcy $txtbld PHP-GD $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-imap | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-IMAP $txtrst $txtcy is not install. Installing PHP-IMAP $txtrst "
        yum -y  install php53-imap
else
	echo -e " $txtcy $txtbld PHP-IMAP $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-ldap | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-Ldap $txtrst $txtcy is not install. Installing PHP-Ldap $txtrst "
        yum -y  install php53-ldap
else
	echo -e " $txtcy $txtbld PHP-Ldap $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-odbc | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-ODBC $txtrst $txtcy is not install. Installing PHP-ODBC $txtrst "
        yum -y  install php53-odbc
else
	echo -e " $txtcy $txtbld PHP-ODBC $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-pear | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-Pear $txtrst $txtcy is not install. Installing PHP-Pear $txtrst "
        yum -y  install php53-pear
else
	echo -e " $txtcy $txtbld PHP-pear $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-xml | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-XML $txtrst $txtcy is not install. Installing PHP-XML $txtrst "
        yum -y  install php53-xml
else
	echo -e " $txtcy $txtbld PHP-XML $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

if [ "`rpm -qi php53-xmlrpc | awk '{print $4,$5}'| sed -n 1p`" = "not installed" ]; then
        echo -e " $txtcy $txtbld PHP-XMLRpc $txtrst $txtcy is not install. Installing PHP-XMLRpc $txtrst "
        yum -y  install php53-xmlrpc
else
	echo -e " $txtcy $txtbld PHP-XMLRpc $txtrst $txtcy is installed. Checking another Package $txtrst "
fi

else
	clear
        echo -e "$bgred$txtcy $txtbld This Version is Not Supported $txtrst"
fi


chkconfig --levels 235 mysqld on
chkconfig --levels 235 httpd on

/etc/init.d/mysqld start
mysql_secure_installation

/etc/init.d/httpd start

echo -e "<?php" > $APACHE_HOME/info.php
echo -e "phpinfo();" >> $APACHE_HOME/info.php
echo -e "?>" >> $APACHE_HOME/info.php

/etc/init.d/httpd restart

clear
echo "$txtblu$txtbld Please Run script again. And Select Next option $txtrst"
   ;;

   3) ## If User Press 3 Then Script Starts from here

############ Question no. 2

echo -e " $txtbld $bgmgt $txtcy Please enter your domain name : $txtrst \n \t eg. google, yahoo $txtred not $txtrst google.com, yahoo.org "
read domain # We get Domain variable

echo -e " $txtbld $bgmgt $txtcy Please enter your domain name extension : $txtrst \n \t eg. com, org, in, co.in $txtred not $txtrst google.com, yahoo.org"
read domainext # We get Domain Ext variable

echo -e " $txtbld $bgmgt $txtcy Please enter your Database Name : $txtrst"
read dbname # We get DbName

echo -e " $txtbld $bgmgt $txtcy Please enter your Database UserName : $txtrst"
read dbuser # We get DB-Username

echo -e " $txtbld $bgmgt $txtcy Please enter password for Database UserName: $txtrst"
read dbpasswd # We get Password

############ Question no. 3

echo -en "$ip \t \t $domain.$domainext \n"  >> /etc/hosts

mkdir $APACHE_HOME/$domainext

mkdir $APACHE_HOME/$domainext/$domain

############ Question no. 4
grep -F "Include conf.d/$domainext/*.conf" /etc/httpd/conf/httpd.conf

if [ "$?" = "0" ]; then
	echo "Directory is already added to httpd.conf"
else
	echo "Include conf.d/$domainext/*.conf" >> /etc/httpd/conf/httpd.conf
fi
mkdir /etc/httpd/conf.d/$domainext
sed -i "/#NameVirtualHost/ s/#NameVirtualHost/NameVirtualHost/" /etc/httpd/conf/httpd.conf
echo "<VirtualHost *:80>" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t DocumentRoot $APACHE_HOME/$domainext/$domain" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t ServerName $domain.$domainext" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t ServerAlias $domain.$domainext, *.$domain.$domainext" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "<Directory "$APACHE_HOME/$domainext/$domain">" >> /etc/httpd/conf.d/$domainext/$domain.conf 
echo -e "\t \t Order allow,deny" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t Allow from all \n" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t AllowOverride FileInfo AuthConfig Limit" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t Options MultiViews Indexes SymLinksIfOwnerMatch IncludesNoExec" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t <Limit GET POST OPTIONS>" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t Order allow,deny" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t Allow from all" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t </Limit>" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t <LimitExcept GET POST OPTIONS>" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t Order deny,allow" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t \t Deny from all" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t </LimitExcept> \n" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo -e "\t </Directory>" >> /etc/httpd/conf.d/$domainext/$domain.conf
echo "</VirtualHost>" >> /etc/httpd/conf.d/$domainext/$domain.conf

############ Question no. 5

if ls -l |grep zip ; then
        ls -l |grep zip | awk  '/wordpress|latest/ {print $9}' |while read wp
do
unzip -o $wp
if [ "$?" = "0" ]; then
	cp -r wordpress/*  $APACHE_HOME/$domainext/$domain
else
        echo -e " $bgred Wordpress is not downloaded properly.$txtrst  \n $txtmg Please Run Script Again OR download it and put it in `pwd` $txtrst "
	rm -rf $wp
        exit 1
fi
done
else
        echo "Please copy the Wordpress Source in `pwd`  Aborting." 1>&2
        exit 1
fi

############ Question no. 6

echo "CREATE DATABASE $dbname; GRANT ALL PRIVILEGES ON $dbname.* TO '$dbuser'@'localhost' IDENTIFIED BY '$dbpasswd';FLUSH PRIVILEGES;" > /tmp/wordpress
echo "Please enter your Mysql root user password :"

mysql -u root -p < /tmp/wordpress


########### Question no. 7
cp $APACHE_HOME/$domainext/$domain/wp-config-sample.php $APACHE_HOME/$domainext/$domain/wp-config.php

sed -i "/DB_NAME/ s/database_name_here/$dbname/" $APACHE_HOME/$domainext/$domain/wp-config.php
sed -i "/DB_USER/ s/username_here/$dbuser/" $APACHE_HOME/$domainext/$domain/wp-config.php
sed -i "/DB_PASSWORD/ s/password_here/$dbpasswd/" $APACHE_HOME/$domainext/$domain/wp-config.php


######### Question no.8

chown -R apache:apache $APACHE_HOME/$domainext/$domain

/etc/init.d/httpd restart

######### Question no.9
clear
echo -e " $txtbld You Wordpress setup has been configured successfully. \n Please go through URL $txtmg http://$domain.$domainext $txtrst "

;;
4|q|Q) # If user presses 4, q or Q we terminate
    exit 0
    ;;
    *) # All other user input results in an usage message
    clear
 echo Please choose alternatves 1, 2, 3, 4
#    sleep 2
    ;;
  esac

