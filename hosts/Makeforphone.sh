#!/bin/bash

# exclude exclusion list:
grep -Fvxf ./02_stevenblack/00_Exclude ./02_stevenblack/09_PornAndAllLists > hosts

# start adding other lists:
cat ./01_search/01_Tor >> hosts
cat ./01_search/02_SearchEngines >> hosts
cat ./01_search/03_Google >> hosts
cat ./01_search/04_Bing >> hosts
cat ./01_search/05_Yandex >> hosts
cat ./01_search/06_Yahoo >> hosts
cat ./01_search/07_Torrents >> hosts
cat ./02_stevenblack/01_Instagram >> hosts
cat ./02_stevenblack/02_Linkedin >> hosts
cat ./02_stevenblack/03_TicToc >> hosts
cat ./02_stevenblack/04_Twitter >> hosts
cat ./02_stevenblack/05_Tumblr >> hosts
cat ./02_stevenblack/06_Reddit >> hosts
cat ./02_stevenblack/07_Pinterest >> hosts
cat ./02_stevenblack/08_DateMeme >> hosts
#cat ./02_stevenblack/BlockOnPhone_Facebook >> hosts
#cat ./03_manuallycollected/BlockOnPhone_APK >> hosts
cat ./03_manuallycollected/BlockOnPhone_Porn >> hosts
cat ./03_manuallycollected/01_Secular >> hosts
cat ./03_manuallycollected/02_Required >> hosts
cat ./03_manuallycollected/03_PornographyServers >> hosts
cat ./03_manuallycollected/04_Pornography >> hosts
cat ./03_manuallycollected/05_ImageHosting >> hosts
cat ./04_Firefox_Ruttley >> hosts
cat ./05_Olivierbreuer >> hosts
cat ./06_shallalist/01_Sex >> hosts
cat ./06_shallalist/02_SearchEngines >> hosts
cat ./06_shallalist/03_URLShorteners >> hosts

echo "then connect to phone and copy manually simply using 'vim /etc/hosts' on phone"

