PATH := ./node_modules/.bin:${PATH}

.PHONY : clean build test publish

clean:
	rm -rf lib

build: clean
	gulp build

test: build
	mocha

publish: clean build
	npm publish
