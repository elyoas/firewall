copy_files:
	#cd /home/elias/Documents/workspace/configs/firewall/e2guardian/hosts
	
	# 1. Clean files:
	sed -e 's|\r||g' -i ./01_search/01_Tor
	sed -e 's|\r||g' -i ./01_search/02_SearchEngines
	sed -e 's|\r||g' -i ./01_search/03_Google
	sed -e 's|\r||g' -i ./01_search/04_Bing
	sed -e 's|\r||g' -i ./01_search/05_Yandex
	sed -e 's|\r||g' -i ./01_search/06_Yahoo
	sed -e 's|\r||g' -i ./01_search/07_Torrents
	sed -e 's|\r||g' -i ./02_stevenblack/00_Exclude
	sed -e 's|\r||g' -i ./02_stevenblack/01_Instagram
	sed -e 's|\r||g' -i ./02_stevenblack/02_Linkedin
	sed -e 's|\r||g' -i ./02_stevenblack/03_TicToc
	sed -e 's|\r||g' -i ./02_stevenblack/04_Twitter
	sed -e 's|\r||g' -i ./02_stevenblack/05_Tumblr
	sed -e 's|\r||g' -i ./02_stevenblack/06_Reddit
	sed -e 's|\r||g' -i ./02_stevenblack/07_Pinterest
	sed -e 's|\r||g' -i ./02_stevenblack/08_DateMeme
	sed -e 's|\r||g' -i ./02_stevenblack/09_PornAndAllLists
	sed -e 's|\r||g' -i ./02_stevenblack/BlockOnPC_Whatsapp
	sed -e 's|\r||g' -i ./02_stevenblack/BlockOnPhone_Facebook
	sed -e 's|\r||g' -i ./03_manuallycollected/BlockOnPhone_APK
	sed -e 's|\r||g' -i ./03_manuallycollected/BlockOnPhone_Porn
	sed -e 's|\r||g' -i ./03_manuallycollected/01_Secular
	sed -e 's|\r||g' -i ./03_manuallycollected/02_Required
	sed -e 's|\r||g' -i ./03_manuallycollected/03_PornographyServers
	sed -e 's|\r||g' -i ./03_manuallycollected/04_Pornography
	sed -e 's|\r||g' -i ./03_manuallycollected/05_ImageHosting
	sed -e 's|\r||g' -i ./04_Firefox_Ruttley
	sed -e 's|\r||g' -i ./05_Olivierbreuer
	sed -e 's|\r||g' -i ./06_shallalist/01_Sex
	sed -e 's|\r||g' -i ./06_shallalist/02_SearchEngines
	sed -e 's|\r||g' -i ./06_shallalist/03_URLShorteners
	
	# 2. Exclude exclusion list:
	grep -Fvxf ./02_stevenblack/00_Exclude ./02_stevenblack/09_PornAndAllLists > hosts
	
	# 3. Add other lists:
	cat ./01_search/01_Tor >> hosts
	cat ./01_search/02_SearchEngines >> hosts
	cat ./01_search/03_Google >> hosts
	cat ./01_search/04_Bing >> hosts
	cat ./01_search/05_Yandex >> hosts
	cat ./01_search/06_Yahoo >> hosts
	cat ./01_search/07_Torrents >> hosts
	cat ./02_stevenblack/BlockOnPC_Whatsapp >> hosts
	cat ./02_stevenblack/01_Instagram >> hosts
	cat ./02_stevenblack/02_Linkedin >> hosts
	cat ./02_stevenblack/03_TicToc >> hosts
	cat ./02_stevenblack/04_Twitter >> hosts
	cat ./02_stevenblack/05_Tumblr >> hosts
	cat ./02_stevenblack/06_Reddit >> hosts
	cat ./02_stevenblack/07_Pinterest >> hosts
	cat ./02_stevenblack/08_DateMeme >> hosts
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
	
	# 4. Copy hosts file:
	sudo mv hosts /etc/hosts
	
	echo Done!
    
