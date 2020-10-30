# Send Mail /w Google SMPT

Linux configuration setup for sendmail with google SMPT

## Pre-requisites:
- install postfix and cyrus-sasl-plain
- Google account
- application password


## Installing postfix (linux fedora)
```
sudo dnf install postfix cyrus-sasl-plain
systemctl enable postfix
systemctl start postfix
```

Go to you Google account and choose `Manage your Google Account` and open `Security`. 
If the two-way verification is off then just use the standard credentials from your google ccount. 
If the two-way verification is on the create a application password by selecting
 `App passwords`.

### App passwords:
 Under `Select app` choose 'other' and give it a random name and click 'generate'. 
 A password will pop up. Copy this password and use it with the username of your 
 google account.


Make sure the `postfix-config.sh` is executable and run teh file.

```
git clone https://github.com/djwave28/sendmail-postfix.git
chmod +x postfix-config.sh
sh ./postfix-config.sh
```

You will be asked to enter your
- google username
- password

The script will ask for your sudo password and will also ask to do this again when the postfix.service is restarted. 
Last it will ask you where you want your test email to be sent.


<hr>


*This will be appended to  /etc/postfix/main.cf*

```
relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous
```

*This will be written to  /etc/postfix/sasl_passwd*

``` 
[smtp.gmail.com]:587 username:password
```