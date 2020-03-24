#!/bin/bash
directoryFrom="$(pwd)"
cd $(dirname "$0")
adduser challenge02 --disabled-login --gecos ""
echo challenge02:challenge02 |  chpasswd
cp todo.txt /home/challenge02/.todo.txt
chown challenge02:hackerman /home/challenge02/.todo.txt
chmod 775 /home/challenge02/.todo.txt
adduser challenge02ftp --disabled-login --gecos ""
echo challenge02ftp:password |  chpasswd
mkdir /srv/.S€CRE]/
cp config /srv/.S€CRE]/.
chmod 770 /srv/.S€CRE]/config
chown challenge02:hackerman /srv/.S€CRE]/config
cp startServer.sh /srv/.S€CRE]/.
mkdir /srv/.S€CRE]/data
cp index.html /srv/.S€CRE]/data/.
echo "anon_root=/srv/.S€CRE]/data/" >> /etc/vsftpd.conf
echo "listen_port=12345" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "allow_writeable_chroot=YES" >> /etc/vsftpd.conf
sed -i  s/anonymous_enable=NO/anonymous_enable=YES/g /etc/vsftpd.conf
cp passphrase /home/challenge02ftp/.
chown challenge02ftp:challenge02ftp /home/challenge02ftp/passphrase
chmod 770 /home/challenge02ftp/passphrase
cp startServer.sh /srv/.S€CRE]/startServer.sh
chmod 770 /srv/.S€CRE]/startServer.sh
chown challenge02:hackerman /srv/.S€CRE]/startServer.sh
cd $directoryFrom