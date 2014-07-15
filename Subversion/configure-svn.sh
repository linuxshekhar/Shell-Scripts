#!/bin/bash
#
# A simple shell to Create Subversion Repo ( with default primary structure ) and Apache conf for SVN
#
# Tested on : RHEL 5.x, RHEL 6.x
#
# ----------------------------------------------------------------------------
#
# Author: Shekhar Raut
#
# ----------------------------------------------------------------------------
#
#  Before run this script:
#			Please make sure that you have created one user to access svn through http (here we are using webmaster user)
#			We are using SVN Server fqdn: svn.example.com resolved by local DNS
#			create one Directory with projectwise or departmentwise in /opt/svn e.g. DVLP, HR
# ----------------------------------------------------------------------------
#
# Tools: SVN, APACHE (default)
#
# ----------------------------------------------------------------------------

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

SVN_PATH=/opt/svn
SVN_CONF=/etc/httpd/conf.d/subversion.conf
SVN_ACL=/etc/httpd/conf/SVN_acl.list

tput clear
echo "$txtbld$bgred Note: $txtrst$txtred Please don't make any spelling mistakes $txtrst"

echo "$txtblu Please Enter Name for the repository Project Name. $txtrst eg. SVN_Test, Project-1, Project-2"
read a
echo "$txtblu Please enter SVN Repository name with no Spaces and in lower case. $txtrst eg svn_project, svn_project-1, svn_project2 "
read b
echo -e "$txtblu Please Select Domain/Parent from this project: $txtylw \n`ls /opt/svn`  $txtrst"
echo "$txtbld$bgred Note: $txtrst$txtred Please don't make any spelling mistakes $txtrst"
read c


if [ -d $SVN_PATH/$c ];then
        echo "$txtcyn You have choose right Directory. $txtrst"
else
        echo "$txtred Mentioned Directory is not present at location $SVN_PATH $txtrst"
        exit 1
fi

cd $SVN_PATH/$c

if [ ! -d $SVN_PATH/$c/$b ];then
        svnadmin create $b
        echo "$txtcyn  Subversion Repo has been created. $txtrst"
        sleep 3
else
        echo "$txtred Mentioned REPO is already present at location $SVN_PATH $txtrst"
        exit 1
fi


grep $b $SVN_CONF
if [ $? -eq 0 ];then
        echo "$txtred Apache conf for same repo is already available, Please select another name. $SVN_PATH $txtrst"
        exit 1
else
echo "
############################################  $a ###########################################

<Location /$b>
    DAV svn
    SVNPath $SVN_PATH/$c/$b
    AuthType Basic
    AuthName \"Subversion repos\"
    AuthUserFile /etc/httpd/conf/SVN_user.list
    AuthzSVNAccessFile /etc/httpd/conf/SVN_acl.list
    Require valid-user
</Location>

" >> $SVN_CONF

fi


grep $b $SVN_ACL
if [ $? -eq 0 ];then
        echo "$txtred ACL is already available, please check again, whether you have selected right options or not .... $SVN_PATH $txtrst"
        exit 1
else
echo "
[$b:/]
@webmaster = rw

" >> $SVN_ACL

fi

chown apache:apache -R /opt/svn/$c/$b

apachectl -t
if [ $? -eq 0 ];then
        echo "$txtcyn Apache conf is OK. $txtrst"
else
        echo "$txtred Apache conf has problem, please check.... $SVN_PATH $txtrst"
        exit 1
fi

/etc/init.d/httpd restart

mkdir -p /tmp/svn/{tags,branches,trunks}

svn import /tmp/svn http://svn.example.com/$b -m  "Initial Import" --non-interactive --no-auth-cache --username webmaster --password  password
if [ $? -eq 0 ];then
        echo "$txtcyn New REPO created successfuly. $txtrst"
else
        echo "$txtred Something is not correct, please check.... $SVN_PATH $txtrst"
        exit 1
fi

rm -rf /tmp/svn

tput clear
echo "$txtmgn Your repository has been configured. $txtrst "
echo "$txtblu Please add users to $SVN_ACL to access the repository for the project. $txtrst "
echo "$txtmgn You can access repository with URL: $txtrst "
echo "$txtbld$txtcyn http://svn.example.com/$b $txtrst "
echo -e "$txtblk \t\t\t Thank you for using the script. $txtrst "

