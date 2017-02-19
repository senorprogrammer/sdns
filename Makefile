install:
	crystal build ./sdns.cr
	mv ./snds /usr/local/bin/sdns
	cp sdns.yaml ~/.sdns.yaml
