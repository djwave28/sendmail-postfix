#!/bin/bash



function credentials() {
read -p 'Username: ' username
read -p 'Password: ' password
sudo tee /etc/postfix/sasl_passwd > /dev/null <<EOT
[smtp.gmail.com]:587 $username:$password
EOT
}

credentials


