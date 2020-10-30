#!/bin/bash

source ./sasl.sh
source ./maincf.sh

sudo postmap /etc/postfix/sasl_passwd
sudo chown root:postfix /etc/postfix/sasl_passwd*
sudo chmod 640 /etc/postfix/sasl_passwd*

systemctl reload postfix

read -p "Deliver testmail to: " email
echo "Subject: postfix mail success" | /usr/sbin/sendmail -v $email
