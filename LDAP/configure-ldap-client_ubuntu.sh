#!/bin/bash
#
# Shell Script to install and configure Ldap Client
#
# Tested till : Ubuntu 12.04
#
# ----------------------------------------------------------------------------
# Before run this script:
#			Here we have LDAP server with fqdn: ldap.example.com which will reolve by our local DNS Server
#
# NOTE: This script is made for newly created machines only
#------------------------------------------------------------------------------

apt-get update

apt-get install ldap-auth-client nscd sysv-rc-conf nslcd libpam-ldap libnss-db ldap-utils libnss-ldap

sed -i '/host/ s/127.0.0.1/ldap.avnindia.com/1; s/^#host/host/' /etc/ldap.conf
sed -i '1,/uri/ s/ldapi/ldap/1' /etc/ldap.conf
sed -i '/base/ s/dc=example,dc=net/dc=ldap,dc=avnindia,dc=com/' /etc/ldap.conf
sed -i '/compat/ s/$/ ldap/' /etc/nsswitch.conf
sed -i 's/^rootbinddn/#rootbinddn/g' /etc/ldap.conf
sed -i 's/^#scope sub/scope sub/g' /etc/ldap.conf
sed -i '/base/ s/dc=avnindia,dc=com/dc=ldap,dc=avnindia,dc=com/' /etc/nslcd.conf
sed -i 's/^#bind_policy hard/bind_policy soft/g' /etc/ldap.conf
sed -i '170,173 s/^#nss_base_/nss_base_/' /etc/ldap.conf
sed -i '/nss_base_passwd/,/nss_base_shadow/  s/dc=padl,dc=com?one/dc=ldap,dc=avnindia,dc=com/ ' /etc/ldap.conf
sed -i '/nss_base_group/ s/dc=padl,dc=com?one/dc=ldap,dc=avnindia,dc=com/ ' /etc/ldap.conf
sed -i '/ou=Group,dc=ldap,dc=avnindia,dc=com/ a\nss_base_group          ou=Groups,dc=ldap,dc=avnindia,dc=com' /etc/ldap.conf
sed -i 's/^#pam_lookup_policy/pam_lookup_policy/g' /etc/ldap.conf
sed -i 's/^#pam_check_service_attr/pam_check_service_attr/g' /etc/ldap.conf
sed -i '/pam_member_attribute/ s/^#pam_member_attribute/pam_member_attribute/g; s/uniquemember/memberuid/g' /etc/ldap.conf
sed -i '/uid/ s/^#pam_login_attribute/pam_login_attribute/g' /etc/ldap.conf
sed -i '0,/pam_filter/ s/^#pam_filter/pam_filter/ ; s/objectclass=account/objectclass=posixAccount/g' /etc/ldap.conf

echo "
#
# LDAP Defaults
#

# See ldap.conf(5) for details
# This file should be world readable but not world writable.

BASE    dc=ldap,dc=avnindia,dc=com
URI ldap://ldap.avnindia.com/


SIZELIMIT       12
TIMELIMIT       15
#DEREF          never
#use_sasl no
#tls_checkpeer no
#sudoers_base ou=SUDOers,dc=a,dc=b,dc=c
#sudoers_debug 2
pam_lookup_policy yes
pam_check_host_attr yes
pam_lookup_policy yes
pam_check_host_attr yes
#TLS_CACERT  /etc/ssl/certs/ca-certificates.crt
#TLS_REQCERT never

# TLS certificates (needed for GnuTLS) " > /etc/ldap/ldap.conf

echo "Name: activate mkhomedir
Default: yes
Priority: 900
Session-Type: Additional
Session:
        required                        pam_mkhomedir.so umask=0022 skel=/etc/skel" > /usr/share/pam-configs/my_mkhomedir
echo "allow-guest=false
greeter-hide-users=true
greeter-show-manual-login=true " >> /etc/lightdm/lightdm.conf
        
pam-auth-update
update-rc.d nslcd enable
/etc/init.d/nscd restart
sysv-rc-conf libnss-ldap on
shutdown -r now
