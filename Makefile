test:
	sudo apk -X http://dl-cdn.alpinelinux.org/alpine/edge/community \
		add runvimtests && make _test && sudo apk del runvimtests

_test:
	cd tests && vim '+packadd vader | Vader! index.vader'
	cd tests && sh run.sh
