debug:
	crystal build --debug ./sdns.cr
	dsymutil --flat sdns
	./sdns list

install:
	crystal build ./sdns.cr
	mv sdns /usr/local/bin/
	cp sdns.yaml ~/.sdns.yaml
