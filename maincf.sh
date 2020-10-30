#!/bin/bash
relayhost="relayhost = [smtp.gmail.com]:587"
maincf_file=/etc/postfix/main.cf

if grep -Fq "$relayhost" $maincf_file;
then
   break
else
sudo tee -a $maincf_file > /dev/null <<EOT
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
EOT
    
fi

