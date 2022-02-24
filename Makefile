copy_files:
	@sudo cp ./conf/e2guardian.conf   /usr/local/etc/e2guardian/e2guardian.conf
	@sudo cp ./conf/e2guardianf1.conf /usr/local/etc/e2guardian/e2guardianf1.conf
	@sudo cp ./conf/examplef1.story   /usr/local/etc/e2guardian/examplef1.story
	@sudo cp ./conf/site.story        /usr/local/etc/e2guardian/site.story
	@sudo cp ./conf/common.story      /usr/local/etc/e2guardian/common.story
	@sudo cp ./conf/preauth.story     /usr/local/etc/e2guardian/preauth.story
	
	@sudo cp ./conf/template.html     /usr/local/share/e2guardian/languages/ukenglish/template.html
	
	@sudo rm -rf        /usr/local/etc/e2guardian/lists
	@sudo cp -r ./lists /usr/local/etc/e2guardian
	
	@# clear log file: (do this only once in a while)
	@#sudo rm    /usr/local/var/log/e2guardian/access.log
	@#sudo touch /usr/local/var/log/e2guardian/access.log
	@#sudo chown -R nobody:nobody /usr/local/var/log/e2guardian/
	
	@sudo e2guardian -q
	@sudo systemctl restart e2guardian
	@sudo systemctl status e2guardian
	
	@echo Done!

