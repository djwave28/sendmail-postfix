# Send Mail /w Google SMPT

Linux setup for sendmail with google SMPT.

### install postfix and cyrus-sasl-plain
```
sudo dnf install postfix cyrus-sasl-plain
systemctl enable postfix
systemctl start postfix
```

### Create a Google application password
If you use two-way authentication for your google account, then follow these steps, 
otherwise just use your current account credentials.

Go to you Google account and choose `Manage your Google Account` and open `Security`. 
If the two-way verification is off then just use the standard credentials from your google ccount. 
If the two-way verification is on the create a application password by selecting
 `App passwords`.


### App passwords:
 Under `Select app` choose 'other' and give it a random name and click 'generate'. 
 A password will pop up. Copy an save this password.


Pull the git-repo to your system and run the script.

```
git clone https://github.com/djwave28/sendmail-postfix.git
cd sendmail-postfix
chmod +x postfix-config.sh
sh ./postfix-config.sh
```

You will be asked to enter your
- google username
- app-password

You will be asked for your sudo password to be able to write to your system files and to restart the `postfix.service`.

<hr>

The script will perfom the following operations


*appended to  /etc/postfix/main.cf*

```
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
```

*wite credentials to  /etc/postfix/sasl_passwd*

``` 
[smtp.gmail.com]:587 username:password
```