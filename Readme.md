![SatanLovesP](SatanLovesP.png "SatanLovesP")

# An effective Catholic firewall filter to block pornography

*Lust is one of the seven cardinal vices.*

*«If your right eye causes you to stumble, gouge it out and throw it away. It is better for you to lose one part of your body than for your whole body to be thrown into hell. And if your right hand causes you to stumble, cut it off and throw it away. It is better for you to lose one part of your body than for your whole body to go into hell.» (Matthew 5:29-30)*

*«Put on the full armor of God, so that you can take your stand against the devil’s schemes.» (Ephesians 6:11)*

*«Submit yourselves, then, to God. Resist the devil, and he will flee from you.» (James 4:7)*

*«Anyone who looks at a woman to lust after her has already committed adultery with her in his heart.» (Matthew 5:28)*

*«You shall not covet your neighbor’s wife.» (Deuteronomy 5:21)*

*«But each one is tempted when by his own evil desires he is lured away and enticed.» (James 1:14)*

### About [v. 1.2]:
- This is the most effective method of blocking pornography that I have ever achieved (word origin: porneia πορνεία, meaning "prostitution", _britannica_ definition).
- The best way not to commit evil, is to avoid it, to stay far from it, and to make it difficult to reach.
- The filter blocks everything except a predefined whitelist of _domains_. It forces all http/https traffic to pass through a proxy, which acts as the filter. It can be used to protect your family, or to rid yourself from addiction.

## How to setup filter:
*1. Setup firewall (iptables rules)*

`./script_activate_firewall.sh`

*2. Force all traffic go through e2guardian port (iptables)*

`./script_activate_e2guardian.sh`

*3. Activate hosts blocking*

`./hosts && sudo make`

*4. Build e2guardian from source according to the instructions in the section below*

*5. Copy all e2g files*

`sudo make # or: e2copyNEVER`

*6. Set all of your applications to use proxy, and add certificate to firefox*

`127.0.0.1:8080`

## e2guardian notes:
- Forked from https://github.com/e2guardian/e2guardian
- The filter is preconfigured to be in ` walled garden ` mode.
- Powerful regular expression blocking, especially the file [bannedregexpurllist]
- Please help me improve this filter so that we can protect the children.

#### Articles:
https://fightthenewdrug.org/why-porn-can-be-difficult-to-quit/
https://www.thecatholicthing.org/2021/11/30/pornography-and-the-castration-of-young-men/
https://www.thecatholicthing.org/2018/06/25/satan-loves-porn/

## Installation of e2guardian:

#### 1. Build (on Archlinux & ubuntu):
`./autogen.sh`

`./configure --help`

`./configure '--enable-clamd=yes''--with-proxyuser=e2guardian' '--with-proxygroup=e2guardian' '--enable-icap=yes' '--enable-commandline=yes' '--enable-email=yes' '--enable-ntlm=yes' '--enable-pcre=yes' '--enable-sslmitm=yes' # options are taken from INSTALL file, debian section`

`make`
`sudo make install`

#### 2. Install configs:
`cd /build/e2guardian-5.3.4/configs`

`make`

`sudo make install`

#### 3. create new user:
`sudo useradd -r -s /usr/bin/nologin e2guardian # create user`

on ubuntu: `sudo useradd -r -s /usr/bin/bash e2guardian`

`sudo chown -R nobody:nobody /usr/local/var/log/e2guardian/ # sudo e2guardian won't run otherwise (must be root). try /var/log/e2guardian if the other path does not work.`

on ubuntu: `sudo chown -R nobody. /usr/local/var/log/e2guardian/`

`sudo e2guardian`

`sudo e2guardian -q`

**IMPORTANT:** ALL config files must not have any CRLF characters.
If you have error with config files when running `sudo systemctl status e2guardian`, it is because of CRLF chars; replace them with LF chars using: `sed -e $'s|\r||g' -i ./e2guardian.conf`

`sudo sed -e $'s|\r||g' -i /usr/local/var/log/e2guardian/access.log`

#### 4. enable service:
`sudo cp /usr/local/share/e2guardian/scripts/e2guardian.service /usr/lib/systemd/system/e2guardian.service`

- This line might be unnecessary:

`sudo vim /usr/lib/systemd/system/e2guardian.service # add under [Service]: User=e2guardian \ Group=e2guardian`

`sudo systemctl enable e2guardian`

`sudo systemctl start e2guardian`

`sudo systemctl status e2guardian`

- If it does not work:
`sudo vim /usr/lib/systemd/system/e2guardian.service # change path of exe to: /usr/bin/e2guardian`

`sudo systemctl daemon-reload`

#### 5. ssl:
`sudo mkdir -p /usr/local/etc/e2guardian/ssl/generatedcerts`

`sudo chown -R e2guardian. /usr/local/etc/e2guardian/ssl # i.e. change user and group`

`cd /usr/local/etc/e2guardian/ssl`

`sudo bash -c "openssl genrsa 4096 > private_root.pem" # [sudo bash -c] is required for using >; otherwise: login as root before you run it: [sudo -i]`

`sudo openssl req -new -x509 -days 3650 -key private_root.pem -out my_rootCA.crt`

`sudo bash -c "openssl genrsa > private_cert.pem"`

`sudo chown e2guardian. *`

#### 6. configs:
`sudo cp e2guardian.conf /usr/local/etc/e2guardian/e2guardian.conf`

`sudo cp e2guardianf1.conf /usr/local/etc/e2guardian/e2guardianf1.conf`

- **note:** changing [transparenthttpsport] to 8080, produces an error. so keep it 8443

- Make copy of certificate (to add to browser under 'Authorities'):
`cp /usr/local/etc/e2guardian/ssl/my_rootCA.crt ./conf/my_rootCA.crt`

`sudo systemctl restart e2guardian`

- See:
https://help.ubuntu.com/community/DansGuardian

#### 7. copy current configs:
- See make file

#### Paths:
`/usr/local/var/log/e2guardian/access.log`

`/usr/local/share/e2guardian/`

`/usr/local/etc/e2guardian/`

#### Watch the log:
- Use it for troubleshooting, you can also use it to know what is the phrase that caused a website to be banned

`tail -f /usr/local/var/log/e2guardian/access.log # | egrep www.youtube.com`

`sudo chown -R nobody:nobody /usr/local/var/log/e2guardian/access.log`

#### 8. Make pacman/youtube-dl work with the new certificate:
`sudo cp my_rootCA.crt /etc/ca-certificates/trust-source/anchors`

`sudo update-ca-trust`

## Help:
- Please ask me I will help you, God willing.

