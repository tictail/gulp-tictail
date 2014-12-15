PATH := ./node_modules/.bin:${PATH}

.PHONY : clean build publish

clean:
	rm -rf lib

build: clean
	coffee -o lib -c src

test: build
	mocha

publish: clean build
	npm publish
