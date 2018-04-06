#!/bin/bash

clear

echo -e "\033[4;36m © Two-VPS | 2018 All rights reserved \033[0m"

echo ""

echo -e "\033[1;36mStart PythonSocks\033[0m"
echo ""
echo -e "\033[1;31mVerificando... \033[0m"

sleep 2

abobora=/root/
verde=proxy443.py
rosa=proxy80.py

sshd_config(){ echo "# © TwoVPS | 2018 All rights reserved
#
Port 22 
Port 144
Protocol 2 
KeyRegenerationInterval 3600 
ServerKeyBits 1024 
SyslogFacility AUTH 
LogLevel INFO 
LoginGraceTime 120 
PermitRootLogin yes 
StrictModes yes 
RSAAuthentication yes 
PubkeyAuthentication yes 
IgnoreRhosts yes 
RhostsRSAAuthentication no 
HostbasedAuthentication no 
PermitEmptyPasswords no 
ChallengeResponseAuthentication no 
PasswordAuthentication yes 
X11Forwarding yes 
X11DisplayOffset 10 
PrintMotd no 
PrintLastLog yes 
TCPKeepAlive yes 
#UseLogin no 
AcceptEnv LANG LC_* 
Subsystem sftp /usr/lib/openssh/sftp-server 
UsePAM yes" > /etc/ssh/sshd_config
}

if [ -e "$abobora$verde" ] ; then
echo -e "\033[1;32mPort 443 OK √ \033[0m"
history -c
else
echo -e "\033[1;31mBaixando arquivos para porta 443...\033[0m"
wget https://github.com/juniorfdtech/conf/blob/master/proxy.py > /dev/null 2> /dev/null
history -c
fi

if [ -e "$abobora$rosa" ] ; then
echo -e "\033[1;32mPort 80 OK √ \033[0m"
history -c
else
echo -e "\033[1;31mBaixando arquivos para porta 80...\033[0m"
wget https://github.com/juniorfdtech/conf/blob/master/proxy8080.py > /dev/null 2> /dev/null
history -c
fi

sleep 2

echo ""

echo -e "\033[1;31mATENÇÃO! \033[0m"
echo ""
echo -e "\033[1;36mAo continuar, você aceita que: \n\nEstará ciente que o SQUID Proxy será desativado. \033[0m"

sleep 2

echo ""

echo -e "\033[1;31mRESPONDA ALGUMAS PERGUNTAS \033[0m"
echo ""

echo -e "\033[1;32mAbrir porta 443? \033[0m"
read -p "[s/n]: " -e -i s port443

echo -e "\033[1;32mAbrir porta 80? \033[0m"
read -p "[s/n]: " -e -i s port80

service squid3 stop > /dev/null 2> /dev/null
service squid stop > /dev/null 2> /dev/null
service ssh restart > /dev/null 2> /dev/null
service sshd restart > /dev/null 2> /dev/null

if [[ "$port443" = 's' ]]; then
chmod a+x proxy443.py && nohup python proxy443.py > proxy443.txt &
fi

if [[ "$port80" = 's' ]]; then
chmod a+x proxy80.py && nohup python proxy80.py > proxy80.txt &
fi

echo ""
echo -e "\033[1;32mTudo pronto! \n\nTwo-VPS \033[0m"