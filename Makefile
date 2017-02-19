build:
	crystal build ./sdns.cr

debug:
	crystal build --debug ./sdns.cr
	dsymutil --flat sdns
	./sdns list

install:
	crystal build ./sdns.cr
	mv sdns /usr/local/bin/
	cp sdns.yaml ~/.sdns.yaml

run:
	crystal ./sdns.cr

uninstall:
	rm /usr/local/bin/sdns
	rm ~/.sdns.yaml
