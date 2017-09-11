Script to prepare an User Account: (Red Hat/Fedora)
#!/bin/sh
# Author Greg Ippolito
# Requires: /opt/etc/AccountDefaults/pathmsg favicon.ico  mwh-mini_tr.gif etc.
#           /opt/bin/ftponly
#   You must be root to run this script.
#
if [ $# -eq 0 ]  		( -eq means equal if root equal to 0 )
then
   echo "Enter user id as a command argument"
else if [ -r /home/$1 ]
then
   echo "User's home directory already exists"
else
   echo "1)  Create user."
   adduser -m $1

   echo "2)  Set user Password."
   passwd $1

   echo "3)  Add read access to user directory so apache can read it."
   cd /home
   chmod ugo+rx $1
   cd $1

   echo "4)  Create web directories."
   mkdir public_html
   chown $1.$1 public_html
   chcon -R -h -u system_u -r object_r -t httpd_sys_content_t public_html
   cd public_html
   mkdir images
   chown $1.$1 images
   chcon -R -h -u system_u -r object_r -t httpd_sys_content_t images

   # Block potential for unauthenticated logins
   cd ../
   touch .rhosts
   chmod ugo-xrw .rhosts

   echo "5)  Create default web page"
   sed "/HEADING/s!HEADING!$1!" /opt/etc/AccountDefaults/default-index.html > index.html
   cp -p /opt/etc/AccountDefaults/favicon.ico .
   cp -p /opt/etc/AccountDefaults/default-logo.gif ./images
   cp -p /opt/etc/AccountDefaults/robots.txt .
   chown $1.$1 index.html favicon.ico robots.txt
   chcon -R -h -t httpd_sys_content_t index.html favicon.ico robots.txt
   chcon -R -h -t httpd_sys_content_t images/default-logo.gif

   echo "6)  Edit /etc/passwd file - change user shell to /opt/bin/ftponly"
   cp -p  /etc/passwd /etc/passwd-`date +%m%d%y`
   sed "/^$1/s!/bin/bash!/opt/bin/ftponly!" /etc/passwd-`date +%m%d%y` > /etc/passwd

#wu-ftp# Requires: /etc/ftpaccess guestuser restrict-uid
#wu-ftp#   echo "7)  Add user to /etc/ftpaccess file"
#wu-ftp#   cp -p  /etc/ftpaccess /etc/ftpaccess-`date +%m%d%y`
#wu-ftp#   sed "/^guestuser/s!guestuser !guestuser $1 !" /etc/ftpaccess-`date +%m%d%y` > /etc/ftpaccess
#wu-ftp#   sed "/^restricted-uid/s!restricted-uid !restricted-uid $1 !" /etc/ftpaccess-`date +%m%d%y` > /etc/ftpaccess
#wu-ftp#   echo "guest-root /home/$1/public_html $1" >> /etc/ftpaccess

   echo "7)  Add user to vsftpd chroot list
   cat `echo $1` >> /etc/vsftpd/vsftpd.chroot_list

   echo "8)  Setting Disk Quotas to default 50Mb limit:"
#  Use user johndoe as a prototype.
   edquota -p johndoe $1

   echo "9)  Admin Follow-up:"
   echo "     Modify quota.user if different than default"
   echo "     Make changes to Bind names services on dns1 and dns2 if necessary"
   echo "       Change /etc/http/conf/httpd.conf or 
   echo "       add config to /etc/http/conf.d/ if using a new domain name"
   echo "       Add e-mail aliases to mail server if necessary"
fi
fi
      
