### Parental Controls, block evil/toxic content websites notes:
* hosts does not block subdomains, so you need to include them as well. i.e. if only google.com is blocked; translate.google.com will still work.
* when you add new data, combine it with existing ones, then use vim [sort u].
* sudo vim /etc/hosts

### Sources:
* [02_stevenblack]:
* https://github.com/StevenBlack/hosts
* https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts _combine it with [StevenBlack_PornAndAllLists]_
* https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/social/hosts _extract what you need and separate into filed (e.g. [Custom09Instagram], [Custom10Linkedin].. etc.)_
* [04_Firefox_Ruttley]:
* https://github.com/matthewruttley/contentfilter/blob/master/sites.json
* https://gist.github.com/roycewilliams/48fa95d27ac382bf274b001e68341f66
* [07_other]:
* Blackip (ip addresses) https://github.com/maravento/blackip
* Blackweb (domains list) https://github.com/maravento/blackweb

### Notes:
* To block websites based on specific keywords, use e2guardian as a transparent proxy (https://github.com/elyoas/firewall_e2guardian) and use the following regular expression blocking list with it: (https://github.com/elyoas/Regular-expressions-to-block-pornography)
* see iptables (firewall filtering)
* It is possible to use DNS filtering instead of the hosts file. OpenDNS used to provide this for free. It is possible to run own DNS server
    + https://www.opendns.com/setupguide/#familyshield
    + https://support.opendns.com/hc/en-us/articles/228007087-Ubuntu
* To search for subdomains:
    + https://securitytrails.com
    + https://subdomains.whoisxmlapi.com/lookup # best
    + https://searchdns.netcraft.com/

### Useful scripts:
##### Find the most repeated/common words in a file:
`tr -c '[:alnum:]' '[\n*]' < test.txt | sort | uniq -c | sort -nr | head  -10`

https://unix.stackexchange.com/questions/41479/find-n-most-frequent-words-in-a-file

##### remove all lines existing in one file from another file:
https://stackoverflow.com/questions/4366533/how-to-remove-the-lines-which-appear-on-file-b-from-another-file-a

`grep -Fvxf removeThisList FromThisList > result`

##### remove all comments:
`grep -o '^[^#]*' input.txt > output.txt`
https://unix.stackexchange.com/questions/157328/how-can-i-remove-all-comments-from-a-file

